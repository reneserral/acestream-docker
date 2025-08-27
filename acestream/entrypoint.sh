#!/bin/bash

# ================================================
# ACESTREAM DOCKER ENTRYPOINT
# Mejorado con logging y manejo de errores
# ================================================

set -e  # Exit on any error

# === LOGGING SETUP ===
echo "=== ACESTREAM DOCKER STARTUP ==="
echo "Timestamp: $(date)"

# === ACESTREAM ENGINE STARTUP ===
echo "=== STARTING ACESTREAM ENGINE ==="
echo "Command: /home/start-engine \"@/home/acestream.conf\""

# Add error handling for engine startup
if ! /home/start-engine "@/home/acestream.conf"; then
    echo "ERROR: Failed to start Acestream engine"
    echo "Configuration file contents:"
    cat /home/acestream.conf
    exit 1
fi
