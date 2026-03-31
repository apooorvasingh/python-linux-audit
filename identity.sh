nano identity.sh
#!/bin/bash
# ==============================================================
# Script Name : identity.sh
# Author      : Apoorva Singh
# Unit Mapping: Unit 2 - Linux System Identity
# Purpose     : Collects system metadata for the Python Audit.
# ==============================================================

# Clear the screen for a professional look
clear

# Define aesthetic separators
LINE="----------------------------------------------------------"
HEADER="          OPEN SOURCE SYSTEM IDENTITY REPORT"

echo "$LINE"
echo "$HEADER"
echo "$LINE"

# 1. Identity Data
echo "TIMESTAMP     : $(date)"
echo "CURRENT USER  : $(whoami) (UID: $(id -u))"
echo "HOSTNAME      : $(hostname)"

# 2. Operating System Data
echo "DISTRIBUTION  : $(lsb_release -ds 2>/dev/null || echo 'Ubuntu/Debian-based')"
echo "KERNEL VER    : $(uname -r)"
echo "ARCHITECTURE  : $(uname -m)"

# 3. Target Software Data (Python)
echo "PYTHON PATH   : $(which python3)"
echo "PYTHON VERSION: $(python3 --version)"

# 4. Environment Check
echo "SHELL TYPE    : $SHELL"
echo "HOME FOLDER   : $HOME"

echo "$LINE"
echo "Status: System Audit Captured Successfully."
echo "$LINE"
