nano inspector.sh
#!/bin/bash
# ==============================================================
# Script Name : inspector.sh
# Author      : Apoorva Singh
# Unit Mapping: Unit 3 - FOSS Ecosystem & Dependencies
# Purpose     : Audits Python package status and dependencies.
# ==============================================================

clear
echo "----------------------------------------------------------"
echo "          FOSS ECOSYSTEM: PACKAGE INSPECTOR"
echo "----------------------------------------------------------"

# Define the package to audit
PACKAGE="python3"

# 1. Check if the package is installed using dpkg
echo "[Step 1] Checking installation status for: $PACKAGE"
if dpkg -l | grep -q "^ii  $PACKAGE "; then
    VERSION=$(dpkg -s $PACKAGE | grep "^Version" | awk '{print $2}')
    echo "STATUS: SUCCESS - $PACKAGE is installed."
    echo "INSTALLED VERSION: $VERSION"
else
    echo "STATUS: FAILED - $PACKAGE not found in package database."
    exit 1
fi

echo "----------------------------------------------------------"

# 2. Audit Dependencies
echo "[Step 2] Auditing Core Dependencies (Shared Libraries):"
# This shows the first 5 major dependencies required for Python to run
apt-cache depends $PACKAGE | grep "Depends:" | head -n 5

echo "----------------------------------------------------------"

# 3. Verify Pip (Python Package Index)
echo "[Step 3] Checking Python Package Manager (pip):"
if command -v pip3 >/dev/null 2>&1; then
    echo "PIP STATUS: Available ($(pip3 --version | awk '{print $1,$2}'))"
else
    echo "PIP STATUS: Not installed (Standard for minimal Linux images)"
fi

echo "----------------------------------------------------------"
echo "Audit Recommendation: System is ready for FOSS development."
