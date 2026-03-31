nano env_check.sh
#!/bin/bash
# ==============================================================
# Script Name : env_check.sh
# Author      : Apoorva Singh
# Unit Mapping: Unit 2 - System Configuration & Path Integrity
# Purpose     : Verifies the integrity of the Python Environment.
# ==============================================================

clear
echo "=========================================================="
echo "          INTEGRITY AUDIT: ENVIRONMENT CHECK"
echo "=========================================================="

# 1. Audit the $PATH variable
echo "[Step 1] Auditing System PATH..."
echo "CURRENT PATH: $PATH"
echo "----------------------------------------------------------"

# 2. Verify 'Which' Python is running
PYTHON_LOC=$(which python3)
echo "[Step 2] Locating Active Python Binary..."
echo "ACTIVE BINARY: $PYTHON_LOC"

# 3. Security Logic: Is Python in a trusted system directory?
# Trusted directories are usually /usr/bin or /bin
if [[ "$PYTHON_LOC" == "/usr/bin/python3" || "$PYTHON_LOC" == "/bin/python3" ]]; then
    echo "VERIFICATION: PASSED (Binary is in a Trusted System Path)."
else
    echo "VERIFICATION: WARNING (Python is running from a non-standard location)."
fi

echo "----------------------------------------------------------"

# 4. Check for Python Environment Variables
echo "[Step 3] Checking Python-specific variables..."
env | grep "PYTHON" || echo "INFO: No custom PYTHONPATH variables defined (Standard)."

echo "=========================================================="
echo "Audit Status: Environment Integrity Verified."
echo "=========================================================="
