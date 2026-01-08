# PasswordStore — Security Audit (Audit Branch)

## Overview

This branch contains the **security audit artifacts** for the `PasswordStore` smart contract.  
The audit focuses on identifying security vulnerabilities, design flaws, and best-practice violations in the original implementation.

> ⚠️ No code changes are made in this branch.  
> The audited contract remains **unchanged** in the `main` branch.

---

## 🎯 Audit Scope

### In-Scope Contracts
```javascript
./src/
└── PasswordStore.sol
```

- **Solidity Version:** `0.8.18`
- **Target Chain:** Ethereum

---

## 🧠 Audit Methodology

The audit was conducted using a **manual, line-by-line review**, including:

- Access control analysis
- Data confidentiality assessment
- Documentation consistency review
- Event and logging inspection
- Best-practice and design evaluation

No automated tools were relied upon as the sole source of findings.

---

## 📄 Audit Artifacts

This branch contains the following materials:
```
audit/
├── findings/ # Individual findings (H/M/L/I)
├── poc/ # Proof of Concepts for critical issues
```
---

## 🧪 Proof of Concepts

Proofs of Concept (PoCs) are provided for **High and Medium severity findings** to demonstrate exploitability and impact.

Low and Informational findings include inline code references where applicable.

---

## 📊 Findings Summary

| ID   | Severity | Title |
|------|----------|-------|
| H-01 | High     | Missing Access Control on `setPassword` |
| M-01 | Medium   | Sensitive Data Stored in Plaintext On-Chain |
| L-01 | Low      | Misleading Documentation Regarding Password Privacy |
| L-02 | Low      | Missing Input Validation for Password |
| L-03 | Low      | Event Emitted Without Relevant Context |
| I-01 | Info     | Typo in Event Name |
| I-02 | Info     | No Ownership Transfer Mechanism |
| I-03 | Info     | Unused or Inconsistently Applied Custom Error |

---

## 🔗 Relationship to Other Branches

| Branch | Description |
|------|-------------|
| `main` | Original audited contract |
| `audit` | Audit findings, report, and PoCs |
| `fixes` | Remediated implementation |

---

## ⚠️ Disclaimer

This audit is provided **for educational and portfolio purposes only**.  
It does not represent a formal security guarantee and should not be relied upon for production deployments.

---

## 👤 Auditor

**Belal Zedan**  
Smart Contract Auditor  
Specialized in Solidity & Smart Contract Security
****