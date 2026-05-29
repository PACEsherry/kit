# AGENTS.md

## Project Overview

`kit` is a Python code intelligence toolkit (PyPI: `cased-kit`). The main project lives in the `kit/` subdirectory.

## Setup

```bash
cd kit
uv sync                    # Install all dependencies
uv pip install -e .        # Install kit in editable mode
```

## Key Commands

All commands run from the `kit/` directory:

```bash
# Tests
uv run pytest -v tests                    # All tests
uv run pytest tests/test_file.py -v       # Single file
uv run pytest tests/test_file.py::test_fn # Single test
uv run pytest -m "not llm and not expensive"  # Fast tests only

# Linting & Formatting
uv run ruff check .                       # Check lint
uv run ruff check . --fix --unsafe-fixes  # Fix lint
uv run ruff format --check .              # Check format
uv run ruff format .                      # Apply format

# Type Checking
uv run mypy src/kit

# All-in-one (Python + TypeScript)
scripts/format.sh --fix   # Fix everything
scripts/format.sh         # Check only
```

## TypeScript Client

Located in `clients/typescript/`. Requires Node.js.

```bash
cd clients/typescript
npm ci              # Install deps
npm test            # Run tests
npm run typecheck   # Type check
npm run lint        # Lint
npm run format      # Format check
```

## Test Markers

| Marker | Description | Requires |
|--------|-------------|----------|
| `llm` | Calls LLM APIs (expensive) | `ANTHROPIC_API_KEY` or `OPENAI_API_KEY` |
| `integration` | End-to-end tests | Nothing extra |
| `expensive` | Slow/costly tests | Nothing extra |
| `ci_skip` | Skipped in CI | Nothing extra |

Fast tests (default): `uv run pytest -q`

## Architecture

- **Source**: `kit/src/kit/` (src layout)
- **Entry points**: `kit.cli:app` (CLI), `kit.mcp.dev:main` (MCP server)
- **Main class**: `Repository` in `src/kit/repository.py`
- **Tree-sitter queries**: `src/kit/queries/**/*.scm`
- **MCP server**: `src/kit/mcp/`
- **Tests**: `kit/tests/` (markers in `pyproject.toml`)

## Environment Variables

| Variable | Purpose |
|----------|---------|
| `KIT_GITHUB_TOKEN` or `GITHUB_TOKEN` | GitHub API access |
| `ANTHROPIC_API_KEY` | Anthropic LLM features |
| `OPENAI_API_KEY` | OpenAI LLM features |
| `KIT_TREE_SITTER_LIB` | Custom tree-sitter .so path |

## Conventions

- Python 3.10+, line length 120
- Ruff rules: E, F, W, I, RUF
- mypy with `ignore_missing_imports = true`
- Version in `src/kit/__init__.py` and `pyproject.toml` must match
- TypeScript client version must match Python version for releases

## CI

GitHub Actions (`.github/workflows/ci.yml`):
1. Python 3.13 + uv + Node 20
2. `uv sync` → `uv pip install -e .`
3. `scripts/format.sh --fix` (lint + format)
4. `uv run mypy src/kit` + `uv run ruff check .` + `uv run ruff format --check .`
5. `npm test --prefix clients/typescript`
6. `uv run scripts/test.sh -v`

## Gotchas

- Click 8.2+ has a Typer compatibility issue; `src/kit/__init__.py` monkey-patches it at import time
- `scripts/test.sh` sets `KIT_TREE_SITTER_LIB=build/my-languages.so` automatically
- Tests use `conftest.py` to add project root to `sys.path`
- LLM tests are auto-skipped in CI and when API keys are missing
