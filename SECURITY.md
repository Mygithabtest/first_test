# Security Policy

## Supported Versions

We actively provide security updates for the following versions of Hello Java App:

| Version | Supported          | Notes                    |
| ------- | ------------------ | ------------------------ |
| 1.0.x   | :white_check_mark: | Current stable release   |
| < 1.0   | :x:                | Development/pre-release  |

## Security Scanning

This project includes automated security scanning as part of our CI/CD pipeline:

- **Docker Scout**: Scans container images for vulnerabilities
- **Dependency Scanning**: Maven dependencies are monitored for known vulnerabilities
- **Static Analysis**: Code is analyzed for potential security issues

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability, please follow these steps:

### How to Report

1. **DO NOT** create a public GitHub issue for security vulnerabilities
2. **Use GitHub's Private Vulnerability Reporting**: [Report a vulnerability privately](https://github.com/ouedraob/first_test/security/advisories/new)
3. **Alternative**: Email security reports to: [your-email@domain.com]
4. **Include** the following information:
   - Description of the vulnerability
   - Steps to reproduce the issue
   - Potential impact assessment
   - Any suggested fixes (if available)

### What to Expect

- **Initial Response**: We will acknowledge receipt within **48 hours**
- **Investigation**: We will investigate and provide an initial assessment within **5 business days**
- **Updates**: You will receive progress updates at least every **7 days** during the investigation
- **Resolution**: We aim to resolve critical vulnerabilities within **30 days**

### Security Update Process

1. **Accepted Vulnerabilities**:
   - We will work on a fix and keep you informed of progress
   - Credit will be given in the security advisory (unless you prefer to remain anonymous)
   - A security advisory will be published after the fix is released

2. **Declined Vulnerabilities**:
   - We will provide a detailed explanation of why the report was declined
   - You are welcome to provide additional information if you disagree with our assessment

## Security Best Practices

When using this application:

- Always use the latest supported version
- Regularly update Docker base images
- Follow the principle of least privilege when deploying
- Monitor security advisories for dependencies
- Use HTTPS for all communications
- Implement proper authentication and authorization

## Security Features

- **Container Security**: Docker images are scanned for vulnerabilities
- **Dependency Management**: Regular updates to address known vulnerabilities
- **Build Security**: Secure CI/CD pipeline with proper secrets management
- **Documentation**: Security considerations documented in deployment guides

## Contact

For security-related questions or concerns:
- Security issues: [Create a private vulnerability report](https://github.com/${{ github.repository }}/security/advisories/new)
- General questions: Create a public issue or discussion

---

*This security policy was last updated on [06/13/2025] and applies to version 1.0.x and later.*
