# Secure App Lab

## Attack → Remediate → Verify

**Secure App Lab** is a security-engineering case study demonstrating the complete lifecycle of identifying, reproducing, understanding, remediating and verifying web application security weaknesses.

The project centres on **Sentinel Support**, a synthetic support-ticket application created specifically for controlled security testing.

---

## Project Objective

The objective is not simply to demonstrate vulnerabilities.

The project aims to demonstrate the complete security-engineering process:

1. Design the application
2. Model its threats
3. Build legitimate functionality
4. Introduce controlled vulnerabilities
5. Reproduce the vulnerabilities
6. Identify their root causes
7. Implement appropriate controls
8. Retest the original attack scenarios
9. Verify legitimate functionality still works
10. Add automated security regression tests
11. Document residual risks and limitations

---

## Initial Security Scenarios

The first assessment will examine:

- SQL injection
- Broken object-level access control
- Unsafe file upload

Each scenario will be assessed independently and supported by reproducible evidence.

---

## Application

### Sentinel Support

Sentinel Support is a fictional support-ticket platform containing:

- User registration
- Authentication
- Private support tickets
- Ticket comments
- File attachments
- Administrator functionality

All users, organisations, credentials and application data used within the project are synthetic.

---

## Security Methodology

The project follows the principle:

> **Proof over claims.**

Security conclusions should be supported through repeatable tests, technical evidence and documented reasoning.

The project will use recognised security guidance including:

- OWASP Web Security Testing Guide
- OWASP Application Security Verification Standard
- STRIDE threat modelling

---

## Safety

The deliberately vulnerable components of this project are designed solely for testing inside an isolated local laboratory environment.

The vulnerable application must not be deployed as a public-facing service.

No third-party systems, real credentials or real customer information are used.

---

## Project Status

🟡 **In Development**

Current phase:

**Foundation & Architecture**

---

## Author

**Dean Barnes**

BSc (Hons) Cyber Security  
Liverpool John Moores University

Areas of development:

Cyber Security · Security Engineering · DevSecOps · AI Security