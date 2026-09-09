# Secure App Lab — Project Charter

## 1. Project Name

**Secure App Lab**

Application:

**Sentinel Support**

---

## 2. Objective

Design, build, assess and harden a realistic support-ticket application inside an isolated laboratory environment.

The project is intended to demonstrate an end-to-end security-engineering workflow rather than vulnerability exploitation alone.

---

## 3. Application Scope

Sentinel Support will provide:

- User registration
- User authentication
- Session management
- Private support tickets
- Ticket comments
- File attachments
- Administrator functionality
- Database-backed storage

---

## 4. Initial Security Assessment Scope

The initial assessment will focus on:

1. SQL injection
2. Broken object-level access control
3. Unsafe file upload

Additional weaknesses may be investigated later where they contribute meaningful security-engineering evidence.

---

## 5. Included Activities

The project includes:

- Application architecture
- Data modelling
- Trust-boundary analysis
- Threat modelling
- Authentication
- Authorisation
- Database interaction
- Secure file handling
- Manual security testing
- Automated security testing
- Vulnerability remediation
- Functional regression testing
- Security regression testing
- Technical documentation
- Security reporting

---

## 6. Excluded Activities

The following are explicitly out of scope:

- Testing third-party systems
- Testing real organisations
- Public exploitation
- Real customer information
- Real production credentials
- Denial-of-service testing
- Malware deployment
- Public deployment of deliberately vulnerable components

---

## 7. Data Handling

Only synthetic data will be used.

No real:

- Customer data
- Employee data
- Credentials
- University identifiers
- Personal records
- Production information

will be stored within the application or repository.

---

## 8. Success Criteria

The project will be considered successful when:

1. Sentinel Support functions correctly.
2. Each selected vulnerability can be reproduced.
3. The technical root cause can be explained.
4. Appropriate controls are implemented.
5. The original attack fails following remediation.
6. Legitimate functionality continues to operate.
7. Automated tests verify the relevant controls.
8. Assessment evidence is reproducible.
9. Residual risks are identified.
10. Technical limitations are documented.

---

## 9. Evidence Standard

Every significant security claim should be supported by evidence.

Evidence may include:

- Source-code references
- Automated tests
- Manual test results
- Screenshots
- HTTP requests/responses
- Architecture diagrams
- Threat models
- Scanner results
- Retest evidence
- Git history
- Technical reports

---

## 10. Core Principle

> **Proof over claims.**

The purpose of this project is not simply to state that security concepts are understood.

The purpose is to demonstrate that understanding through reproducible engineering evidence.