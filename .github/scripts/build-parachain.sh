#!/usr/bin/env bash
set -euo pipefail

RUST_VERSION="${1:-stable}"
TEMPLATE_BRANCH="${2:-stable2412}"
REPO_URL="https://github.com/paritytech/cumulus"

echo "🚀 Building parachain template from branch '$TEMPLATE_BRANCH' with Rust $RUST_VERSION"

bash .github/scripts/setup-rust.sh "$RUST_VERSION"

if [ ! -d "cumulus" ]; then
  git clone --depth 1 --branch "$TEMPLATE_BRANCH" "$REPO_URL"
fi

cd cumulus || exit 1

cargo build --release --locked -p parachain-template-node

echo "✅ Parachain template built successfully."
