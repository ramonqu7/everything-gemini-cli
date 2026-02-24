# Project Context: React / Next.js

## General Instructions
- Use functional components with hooks. No class components.
- Prefer server components (Next.js App Router) unless client interactivity is needed.
- Use TypeScript for all components.
- Keep components small and focused.

## Component Patterns
- Extract custom hooks for reusable logic
- Use composition over prop drilling
- Memoize expensive computations with useMemo
- Use useCallback for event handlers passed to children
- Avoid premature optimization — profile first

## State Management
- Local state: useState/useReducer
- Server state: React Query / SWR
- Global state: Only when truly needed (Zustand, Jotai)
- URL state: Use searchParams for filterable/shareable state

## Styling
- Follow project conventions (Tailwind, CSS Modules, styled-components)
- Use semantic HTML elements
- Ensure accessibility (ARIA labels, keyboard navigation)

## Testing
- Use React Testing Library (not Enzyme)
- Test behavior from user perspective
- Use MSW for API mocking
