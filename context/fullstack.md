# Project Context: Full-Stack Application

## Architecture
- Clearly separate frontend and backend concerns
- Use typed API contracts between frontend and backend (tRPC, OpenAPI)
- Database access only through backend API — never from frontend

## Backend
- RESTful or GraphQL API design
- Input validation at API boundary
- Proper error responses with status codes
- Authentication middleware on protected routes
- Rate limiting on public endpoints

## Frontend
- Optimistic UI updates where appropriate
- Loading and error states for all async operations
- Form validation before submission
- Responsive design

## Database
- Use migrations for schema changes
- Index frequently queried columns
- Use transactions for multi-step operations
- Never expose database IDs directly (use UUIDs)

## Security
- CORS configuration
- CSRF protection
- Content Security Policy headers
- Input sanitization
- Rate limiting
