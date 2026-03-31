nano permissions.sh
#!/bin/bash
# ==============================================================
# Script Name : permissions.sh
# Author      : Apoorva Singh
# Unit Mapping: Unit 2 & 4 - Security and Integrity Audit
# Purpose     : Verifies the ownership and access bits of Python.
# ==============================================================

clear
echo "=========================================================="
echo "          SECURITY AUDIT: PYTHON PERMISSIONS"
echo "=========================================================="

# Find the path to Python 3
TARGET=$(which python3)

echo "TARGET BINARY : $TARGET"

# 1. Get Human-Readable Permissions and Ownership
# %a = octal permissions (e.g. 755)
# %A = symbolic permissions (e.g. -rwxr-xr-x)
# %U:%G = User:Group ownership
PERMS=$(stat -c "%a (%A)" $TARGET)
OWNER=$(stat -c "%U:%G" $TARGET)

echo "PERMISSIONS   : $PERMS"
echo "OWNERSHIP     : $OWNER"

echo "----------------------------------------------------------"

# 2. Security Logic Check
echo "[Security Validation Check]"

if [[ "$OWNER" == "root:root" ]]; then
    echo "RESULT: PASSED - Binary is owned by the Superuser (Root)."
else
    echo "RESULT: WARNING - Ownership mismatch. Potential Security Risk."
fi

# 3. Check if the binary is executable by the current user
if [ -x "$TARGET" ]; then
    echo "EXECUTION: SUCCESS - Current user has 'Execute' rights."
else
    echo "EXECUTION: FAILED - Current user cannot run this binary."
fi

echo "=========================================================="
echo "Audit Status: Security Verification Complete."
echo "=========================================================="
