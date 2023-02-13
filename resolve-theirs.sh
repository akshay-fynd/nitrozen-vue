#!/bin/bash

echo "🚀 Starting auto-rebase with --theirs conflict resolution..."

while true; do
  # Check if a rebase is still in progress
  if git rebase --show-current-patch > /dev/null 2>&1; then
    echo "⚠️  Conflict detected. Accepting incoming changes..."
    # Get all conflicted files and resolve them using --theirs
    git diff --name-only --diff-filter=U | xargs -I {} git checkout --theirs {}
    git add .
    git rebase --continue
  else
    echo "✅ Rebase complete."
    break
  fi
done
