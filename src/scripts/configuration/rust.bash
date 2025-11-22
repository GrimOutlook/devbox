#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Installing Rust components"

rustup toolchain install stable nightly

echo "Finish installing Rust components"
