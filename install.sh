#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GEMINI_DIR="$HOME/.gemini"
TARGET="global"
PROJECT_DIR=""

# Parse args
while [[ $# -gt 0 ]]; do
  case $1 in
    --project)
      TARGET="project"
      PROJECT_DIR="$2"
      shift 2
      ;;
    --help|-h)
      echo "Usage: ./install.sh [--project /path/to/project]"
      echo ""
      echo "Options:"
      echo "  --project PATH  Install to a specific project directory"
      echo "  --help          Show this help"
      echo ""
      echo "Without --project, installs globally to ~/.gemini/"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

if [ "$TARGET" = "project" ]; then
  if [ -z "$PROJECT_DIR" ]; then
    echo "Error: --project requires a path"
    exit 1
  fi
  INSTALL_DIR="$PROJECT_DIR/.gemini"
else
  INSTALL_DIR="$GEMINI_DIR"
fi

echo "🚀 Installing Everything Gemini CLI..."
echo "   Target: $INSTALL_DIR"
echo ""

# Create directories
mkdir -p "$INSTALL_DIR/commands/git"
mkdir -p "$INSTALL_DIR/commands/learn"

# Copy commands
echo "⚡ Installing commands..."
cp -r "$SCRIPT_DIR/commands/"*.toml "$INSTALL_DIR/commands/" 2>/dev/null || true
cp -r "$SCRIPT_DIR/commands/git/"*.toml "$INSTALL_DIR/commands/git/" 2>/dev/null || true
cp -r "$SCRIPT_DIR/commands/learn/"*.toml "$INSTALL_DIR/commands/learn/" 2>/dev/null || true
echo "   ✓ $(find "$INSTALL_DIR/commands" -name "*.toml" | wc -l | tr -d ' ') commands installed"

# Copy agents (referenced by commands via @agents/)
if [ "$TARGET" = "project" ]; then
  echo "🤖 Installing agents..."
  mkdir -p "$INSTALL_DIR/../agents"
  cp "$SCRIPT_DIR/agents/"*.md "$INSTALL_DIR/../agents/" 2>/dev/null || true
  echo "   ✓ $(ls "$INSTALL_DIR/../agents/"*.md 2>/dev/null | wc -l | tr -d ' ') agents installed"
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "Available commands:"
echo "  /plan      - Implementation planning"
echo "  /tdd       - Test-driven development"
echo "  /review    - Code review"
echo "  /fix       - Fix build errors"
echo "  /security  - Security audit"
echo "  /test      - Run & analyze tests"
echo "  /explain   - Explain code"
echo "  /optimize  - Performance optimization"
echo "  /doc       - Generate documentation"
echo "  /git:commit - Smart commit messages"
echo "  /git:pr     - PR descriptions"
echo ""
echo "Run '/commands reload' in Gemini CLI to load the new commands."
echo ""
echo "📝 Don't forget to set up a GEMINI.md for your project!"
echo "   Copy a template from context/ directory:"
echo "   cp context/typescript.md ~/my-project/GEMINI.md"
