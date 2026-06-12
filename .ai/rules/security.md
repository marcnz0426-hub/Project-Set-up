# Security Rules

These rules ensure the AI agent follows security best practices in all implementations.

## Core Principle

**Security is not optional. Every implementation must follow these rules.**

## Rules

### 1. Secrets and Credentials

- NEVER hardcode secrets, tokens, or credentials in source code
- NEVER commit .env files or credentials to version control
- Use environment variables for all configuration
- Use secrets management for production credentials
- Rotate any credentials that may have been exposed

### 2. Input Validation

- Validate ALL user input on the server side
- Sanitize input to prevent injection attacks
- Use parameterized queries for database operations
- Validate file uploads (type, size, content)
- Reject invalid input early with clear error messages

### 3. Authentication

- Never store passwords in plain text
- Use established authentication libraries
- Implement proper session management
- Use secure, HTTP-only cookies for session tokens
- Implement logout functionality

### 4. Authorization

- Check permissions on every request
- Never rely on client-side authorization alone
- Use principle of least privilege
- Validate ownership before allowing resource access
- Log authorization failures

### 5. Data Protection

- Encrypt sensitive data at rest and in transit
- Never log sensitive data (passwords, tokens, PII)
- Use HTTPS for all API calls
- Implement proper data retention policies
- Sanitize data before displaying to users

### 6. API Security

- Use rate limiting to prevent abuse
- Validate Content-Type headers
- Implement CORS properly
- Use API keys or OAuth for authentication
- Validate request signatures where applicable

### 7. Error Handling

- Never expose internal errors to users
- Log errors server-side with context
- Use generic error messages for security failures
- Don't reveal system architecture in error messages

### 8. Dependencies

- Keep dependencies updated
- Review security advisories before adding new dependencies
- Use lock files to prevent supply chain attacks
- Audit dependencies regularly

## Checking Before Implementation

Before writing any code that handles:

- **User input**: Apply input validation rules
- **Authentication**: Follow authentication rules
- **Authorization**: Check permissions on every request
- **Data storage**: Apply data protection rules
- **API calls**: Apply API security rules
- **Error handling**: Never expose internals

## Common Vulnerabilities to Avoid

| Vulnerability | Prevention |
|--------------|------------|
| SQL Injection | Use parameterized queries |
| XSS | Sanitize output, use CSP |
| CSRF | Use CSRF tokens |
| Insecure Deserialization | Validate all input |
| Broken Authentication | Use established libraries |
| Sensitive Data Exposure | Encrypt, don't log |
| XXE | Disable XML external entities |
| Broken Access Control | Check permissions server-side |

## Enforcement

Before claiming any task is complete, verify:

- [ ] No hardcoded secrets or credentials
- [ ] All input is validated and sanitized
- [ ] Authentication is properly implemented
- [ ] Authorization checks are in place
- [ ] Sensitive data is encrypted
- [ ] Error messages don't expose internals
- [ ] Dependencies are up to date