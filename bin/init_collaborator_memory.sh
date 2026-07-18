#!/bin/bash
# init_collaborator_memory.sh — Initialize by syncing collaborator memory.
# Call this at the start of every Claude Code session.
# Usage: source init_collaborator_memory.sh  OR  bash init_collaborator_memory.sh

MEMORY_HOME="$HOME/.hermes/collaborator-memory"

if [ ! -d "$MEMORY_HOME" ]; then
    echo "Collaborator memory not found. Cloning..."
    git clone git@github.com:rmpmrepo1278/collaborator.git "$MEMORY_HOME" 2>/dev/null
fi

# Pull latest from remote
git -C "$MEMORY_HOME" pull --rebase --autostash 2>/dev/null || true

# Export for Claude Code sessions
export COLLABORATOR_MEMORY="$MEMORY_HOME"

echo "Collaborator memory synced at $MEMORY_HOME"
echo "Last commit: $(git -C "$MEMORY_HOME" log --oneline -1 2>/dev/null)"
echo ""
echo "To initialize: read memory/MEMORY.md for the index, then journal/ and memory/ for context."
