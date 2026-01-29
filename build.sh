#!/data/data/com.termux/files/usr/bin/bash
# Package: aether-sync
# Version: 41.0 (Adaptive Ghost IA)
# Maintainer: DavidTX2000
# Description: Professional forensic environment deployment

echo -e "\033[1;34m[BUILD]\033[0m Initializing aether-sync v41.0..."

PREFIX="/data/data/com.termux/files/usr"
BIN_DIR="$PREFIX/bin"
SHADOW_DIR="$PREFIX/share/aether-sync/shadow"

# Creating necessary directory structure
mkdir -p "$BIN_DIR"
mkdir -p "$SHADOW_DIR"

if [ -f "aether" ]; then
    echo -e "\033[1;34m[BUILD]\033[0m Deploying core binary..."
    cp aether "$BIN_DIR/aether"
    chmod 755 "$BIN_DIR/aether"
    
    echo -e "\033[1;32m[SUCCESS]\033[0m aether-sync v41.0 (Adaptive Ghost) installed."
    echo -e "\033[1;34m[INFO]\033[0m Run 'aether --morph' to start the environment."
else
    echo -e "\033[1;31m[ERROR]\033[0m Source 'aether' not found in current directory!"
    echo -e "\033[1;33m[FIX]\033[0m Please ensure the 'aether' file is present before building."
    exit 1
fi
