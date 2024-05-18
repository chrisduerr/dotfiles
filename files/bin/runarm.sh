#!/bin/sh

# Exit on error
set -e

# Build project for aarch64.

if [ $# -lt 1 ]; then
    echo "USAGE: runarm.sh [USER@]<HOST> [RUST_FLAGS…] -- [BIN_FLAGS]"
    exit 1
fi

remote="$1"

# Split options before and after `--`.
separator_index=0
for arg in "$@"; do
    if [ "$arg" == "--" ]; then
        break
    fi
    separator_index=$((separator_index + 1))
done
rustflags="${@:2:separator_index}"
binflags="${@:separator_index + 2}"

# Target platform sysroot.
SYSROOT=$(realpath ~/programming/alarm-sysroot)

# Setup pkgconfig.
export PKG_CONFIG_LIBDIR="${SYSROOT}/usr/lib/pkgconfig:${SYSROOT}/usr/share/pkgconfig"
export PKG_CONFIG_SYSROOT_DIR="${SYSROOT}"
export PKG_CONFIG_ALLOW_CROSS=true

# Setup linker.
export RUSTFLAGS="-C linker=aarch64-linux-gnu-gcc -C link-arg=--sysroot=${SYSROOT}"

# Build!
cargo build --release --target=aarch64-unknown-linux-gnu $rustflags


# Run project on a separate device through SSH.

# Get executable
project_root=$(dirname "$(cargo locate-project --workspace | sed 's/.*:\"\(.*\)\".*/\1/')")
binpath=$(find "$project_root/target/aarch64-unknown-linux-gnu/release" -maxdepth 1 -executable -type f | head -n 1)
bin=$(basename "$binpath")
targetpath="/tmp/$bin"

# Strip to improve copy speed
aarch64-linux-gnu-strip "$binpath"

# Kill potentially running previous executables
ssh "$remote" "pkill $bin; rm $targetpath" 2> /dev/null || true

# Copy to the remote machine
scp "$binpath" "${remote}:$targetpath"

# Execute
ssh "$remote" "WAYLAND_DISPLAY=wayland-1 $targetpath $binflags"
