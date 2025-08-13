#!/usr/bin/env bash
set -euo pipefail

OMNI_VERSION="${1:-latest}"

echo "🔧 Installing polkadot-omni-node ($OMNI_VERSION)..."

if command -v polkadot-omni-node &>/dev/null && [[ "$OMNI_VERSION" != "latest" ]]; then
  if polkadot-omni-node --version | grep -q "$OMNI_VERSION"; then
    echo "✅ polkadot-omni-node $OMNI_VERSION already installed."
    exit 0
  fi
fi

if [[ "$OMNI_VERSION" == "latest" ]]; then
  cargo install polkadot-omni-node
else
  cargo install polkadot-omni-node --version "$OMNI_VERSION"
fi

echo "✅ polkadot-omni-node $(polkadot-omni-node --version) installed."
