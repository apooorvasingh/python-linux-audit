# Python 3 Linux Audit Toolkit (FOSS Compliance & Security)

## 📌 Project Overview

This repository contains a specialized suite of **Bash Audit Scripts** developed to evaluate the integrity, security, and ecosystem of Python 3 within a Linux environment. This project was conducted as a formal audit to verify compliance with **Open Source Software (FOSS)** principles and system administration best practices.

The audit covers four core pillars:

1.  **System Identity:** Establishing a verifiable audit trail of the environment.
2.  **Dependency Mapping:** Analyzing the FOSS ecosystem and shared libraries.
3.  **Security Hardening:** Verifying binary ownership and octal permissions.
4.  **Operational Transparency:** Analyzing system logs and environment variables for anomalies.

-----

## 🛠 The Audit Toolkit

The following scripts were engineered to automate the data collection phase of the audit:

| Script | Name | Audit Focus | Unit Mapping |
| :--- | :--- | :--- | :--- |
| `01` | **identity.sh** | System Metadata & Versioning | Unit 2: OS Identity |
| `02` | **inspector.sh** | Dependency & Package Audit | Unit 3: FOSS Ecosystem |
| `03` | **permissions.sh** | Binary Ownership & Access Bits | Unit 2/4: Security |
| `04` | **log\_audit.sh** | System Journal & Event Analysis | Unit 4: Monitoring |
| `05` | **env\_check.sh** | PATH Integrity & Environment | Unit 2: Configuration |

-----

## 🚀 Getting Started

### Prerequisites

  * **Operating System:** Ubuntu 22.04 LTS (or any Debian-based distribution).
  * **Access:** Terminal/Shell access with standard user permissions.
  * **Language:** Python 3.x must be pre-installed.

### Installation & Execution

To replicate this audit in your own environment, clone this repository and grant execution permissions to the scripts:

```bash
# Clone the repository
git clone https://github.com/apooorvasingh/python-linux-audit/

# Enter the directory
cd python-linux-audit

# Grant execution permissions
chmod +x *.sh

# Run the full suite
./identity.sh
./inspector.sh
./permissions.sh
./log_audit.sh
./env_check.sh
```

-----

## ⚖️ FOSS Compliance Statement

This project is built upon the **Four Essential Freedoms** of Free Software:

  * **Freedom 0:** Users may run these scripts for any auditing purpose.
  * **Freedom 1:** The logic is transparent and open for study (via Bash source).
  * **Freedom 2:** Users are encouraged to redistribute these scripts to improve security standards.
  * **Freedom 3:** Modifications and improvements to these audit tools are welcomed.

-----

## 🔍 Technical Analysis

Each script in this toolkit utilizes low-level Linux binaries (`dpkg`, `stat`, `journalctl`, `grep`) to ensure high-fidelity data collection. By targeting the `/usr/bin/python3` path, we verify that the interpreter remains within a "Trusted Path," protected by the Linux Kernel's ring-fencing and root-level ownership.

-----

## 📜 License

This toolkit is released under the **MIT License**. The Python interpreter audited within this project is governed by the **Python Software Foundation (PSF) License**.

-----
