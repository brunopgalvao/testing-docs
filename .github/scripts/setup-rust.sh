#!/usr/bin/env bash
set -euo pipefail

RUST_VERSION="${1:-stable}"

echo "🔧 Installing Rust ($RUST_VERSION)..."

if command -v rustc &>/dev/null && rustc --version | grep -q "$RUST_VERSION"; then
  echo "✅ Rust $RUST_VERSION already installed."
  exit 0
fi

if ! command -v rustup &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y --default-toolchain "$RUST_VERSION"
else
  rustup install "$RUST_VERSION"
fi

rustup default "$RUST_VERSION"

echo "✅ Rust $(rustc --version) installed."
