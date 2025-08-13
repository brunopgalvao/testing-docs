#!/usr/bin/env bash
set -euo pipefail

CSB_VERSION="${1:-latest}"

echo "🔧 Installing chain-spec-builder ($CSB_VERSION)..."

if command -v chain-spec-builder &>/dev/null && [[ "$CSB_VERSION" != "latest" ]]; then
  if chain-spec-builder --version | grep -q "$CSB_VERSION"; then
    echo "✅ chain-spec-builder $CSB_VERSION already installed."
    exit 0
  fi
fi

if [[ "$CSB_VERSION" == "latest" ]]; then
  cargo install chain-spec-builder
else
  cargo install chain-spec-builder --version "$CSB_VERSION"
fi

echo "✅ chain-spec-builder $(chain-spec-builder --version) installed."
