---
type: core
title: Project Architecture
version: 1.0
last_updated: TBD
sections:
  - name: Tech Stack
  - name: Folder Structure
  - name: Key Dependencies
  - name: Design Decisions
  - name: API Architecture
  - name: Data Model
  - name: Deployment
---

## Summary

<!-- TODO: Write a 200-word max summary of the project's architecture, tech stack,
and key design decisions. This helps agents make consistent choices.
Example: "A Next.js 14 app with server components, PostgreSQL via Prisma,
deployed on Vercel. Uses Tailwind CSS for styling, tRPC for type-safe API layer." -->

## Tech Stack

<!-- List your actual technologies. Each row should answer: what runs in this layer,
what version, and why it was chosen. -->
| Layer | Technology | Version | Purpose |
|-------|-----------|---------|---------|
| Frontend |  |  |  |
| Backend |  |  |  |
| Database |  |  |  |
| Hosting |  |  |  |

## Folder Structure

<!-- Describe your actual folder structure. This helps agents place files correctly.
Replace the example below with your real structure. -->
```
project-root/
├── src/
│   ├── components/
│   ├── pages/
│   ├── services/
│   ├── utils/
│   └── styles/
├── public/
├── tests/
└── docs/
```

## Key Dependencies

<!-- List your most important dependencies. Focus on ones that affect architecture decisions. -->
| Dependency | Purpose | Version |
|-----------|---------|---------|
|  |  |  |

## Design Decisions

<!-- Record key architectural decisions with rationale. This prevents re-litigating choices.
Example:
| Use server components | Performance + SEO | Considered SPA with client rendering |
| PostgreSQL over MongoDB | Relational data, ACID | Considered MongoDB for flexibility |
-->
| Decision | Rationale | Alternatives Considered |
|----------|-----------|------------------------|
|  |  |  |

## API Architecture

<!-- Describe API patterns: REST, GraphQL, tRPC, etc. Include auth approach.
Replace the example below with your actual API design. -->

### Endpoints

| Method | Path | Purpose |
|--------|------|---------|
|  |  |  |

## Data Model

<!-- Describe your database schema. Include entities, key properties, and relationships.
Replace the example below with your actual data model. -->

### Entities

| Entity | Properties | Relationships |
|--------|-----------|---------------|
|  |  |  |

## Deployment

<!-- Describe deployment architecture: where it runs, how CI/CD works,
what environments exist. -->
| Environment | URL | Purpose |
|------------|-----|---------|
|  |  |  |
