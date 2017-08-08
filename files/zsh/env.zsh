# General
export PATH=$HOME/.cargo/bin:$HOME/bin:/usr/local/bin:$HOME/Scripts:$PATH
export EDITOR="nvim"
export VISUAL="nvim"

# History
export HISTFILE=$HOME/.zsh_history
export SAVEHIST=100000
export HISTSIZE=100000

# ls/completion colors
export LS_COLORS='ow=36:di=34:fi=32:ex=31:ln=35:'

# RUST
export RLS_ROOT=$HOME/.cargo/bin/rls
export LD_LIBRARY_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib
export RUST_SRC_PATH=$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src

# Manpages
export LESS_TERMCAP_md=$'\e[32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[100;37m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[34m'
