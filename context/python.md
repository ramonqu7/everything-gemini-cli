# Project Context: Python

## General Instructions
- Follow PEP 8 and PEP 257 (docstrings).
- Use type hints on all function signatures.
- Prefer f-strings for string formatting.
- Use dataclasses or Pydantic models for structured data.

## Coding Style
- 4-space indentation
- Use snake_case for functions and variables
- Use PascalCase for classes
- Import order: stdlib → third-party → local (isort compatible)
- Max line length: 88 (Black compatible)

## Testing
- Use pytest as the test framework
- Test files: `test_*.py` in `tests/` directory
- Use fixtures for shared setup
- Use parametrize for testing multiple inputs

## Virtual Environments
- Always check for and use existing venv/virtualenv
- Never install packages globally
- Use requirements.txt or pyproject.toml for dependencies
