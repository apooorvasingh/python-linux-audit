nano log_audit.sh
#!/bin/bash
# ==============================================================
# Script Name : log_audit.sh
# Author      : Apoorva Singh
# Unit Mapping: Unit 4 - System Logging & Event Auditing
# Purpose     : Searches system journals for Python-related events.
# ==============================================================

clear
echo "=========================================================="
echo "          SYSTEM AUDIT: PYTHON LOG ANALYSIS"
echo "=========================================================="

# 1. Searching the Kernel/System logs
echo "[Step 1] Scanning last 100 system events for 'python'..."
echo "----------------------------------------------------------"

# We use journalctl -n 100 to look at the last 100 lines
# grep -i makes the search case-insensitive
LOG_DATA=$(journalctl -n 100 | grep -i "python")

if [ -z "$LOG_DATA" ]; then
    echo "STATUS: CLEAN - No recent Python errors or warnings found."
else
    echo "STATUS: EVENTS DETECTED"
    echo "$LOG_DATA"
fi

echo "----------------------------------------------------------"

# 2. Check for the existence of the python-distutils log
echo "[Step 2] Checking for installation logs..."
if [ -f /var/log/dpkg.log ]; then
    grep "python3" /var/log/dpkg.log | tail -n 5
else
    echo "INFO: Package logs are restricted or moved."
fi

echo "=========================================================="
echo "Audit Status: Log Analysis Complete."
echo "=========================================================="
