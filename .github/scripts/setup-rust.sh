#!/usr/bin/env bash
set -euo pipefail

RUST_VERSION="${1:-stable}"

echo "🔧 Installing Rust ($RUST_VERSION)..."

# Check if Rust is already installed
if command -v rustc &>/dev/null && rustc --version | grep -q "$RUST_VERSION"; then
  echo "✅ Rust $RUST_VERSION already installed."
else
  # Install Rust if rustup is missing
  if ! command -v rustup &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \
      | sh -s -- -y --default-toolchain "$RUST_VERSION"
  else
    rustup install "$RUST_VERSION"
  fi

  rustup default "$RUST_VERSION"
  echo "✅ Rust $(rustc --version) installed."
fi

# Add WASM target and rust-src for Apple Silicon macOS
if [[ "$(uname -s)" == "Darwin" && "$(uname -m)" == "arm64" ]]; then
  echo "🔧 Adding wasm32-unknown-unknown target and rust-src for aarch64-apple-darwin..."
  rustup target add wasm32-unknown-unknown --toolchain "${RUST_VERSION}-aarch64-apple-darwin"
  rustup component add rust-src --toolchain "${RUST_VERSION}-aarch64-apple-darwin"
  echo "✅ WASM target and rust-src added for aarch64-apple-darwin"
fi
