# Testing Tutorials and Guides in the Polkadot Docs
Testing Tutorials and Guides in the Polkadot Docs

## Polkadot Dev Environment Scripts

Helper scripts for setting up a Polkadot/Substrate dev environment on **Linux**, **macOS**, and **Windows (WSL2)**.

### Scripts

| Script | Purpose |
|--------|---------|
| setup-rust.sh | Installs Rust |
| setup-chain-spec-builder.sh | Installs chain-spec-builder |
| setup-omni-node.sh | Installs polkadot-omni-node |
| build-parachain.sh | Builds parachain template from Cumulus |

### Workflows

- **Meta Setup** (`meta-setup.yml`) → Runs all scripts on Ubuntu, macOS, WSL2  
- **chain-spec-builder.yml** → Only sets up chain-spec-builder  
- **omni-node.yml** → Only sets up polkadot-omni-node  
- **parachain.yml** → Builds parachain template  

### Usage

```bash
bash .github/scripts/setup-rust.sh stable
bash .github/scripts/setup-chain-spec-builder.sh latest
bash .github/scripts/setup-omni-node.sh latest
bash .github/scripts/build-parachain.sh stable stable2412
