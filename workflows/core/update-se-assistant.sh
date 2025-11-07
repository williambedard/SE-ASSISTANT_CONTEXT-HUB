#!/bin/bash

# SE-ASSISTANT_HUB Update Script
# Double-click this file (or run: bash update-se-assistant.sh) to get latest updates

set -e  # Exit on error

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo ""
echo "🚀 SE-ASSISTANT_HUB Update Script"
echo "=================================="
echo ""

# Get the directory where this script is located, then navigate to repo root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# Script is in workflows/core/, so go up two levels to repo root
REPO_ROOT="$( cd "$SCRIPT_DIR/../.." && pwd )"
cd "$REPO_ROOT"

# Verify we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}❌ Error: Not in a git repository${NC}"
    echo "Please run this script from the SE-ASSISTANT_HUB folder"
    exit 1
fi

# Get current branch and remote
CURRENT_BRANCH=$(git branch --show-current)
REMOTE="shopify-playground"
TARGET_BRANCH="main"

echo -e "${YELLOW}📍 Current branch: ${CURRENT_BRANCH}${NC}"
echo -e "${YELLOW}📡 Pulling from: ${REMOTE}/${TARGET_BRANCH}${NC}"
echo ""

# Check for uncommitted changes in tracked files
if ! git diff-index --quiet HEAD -- 2>/dev/null; then
    echo -e "${YELLOW}⚠️  You have uncommitted changes in tracked files${NC}"
    echo "Stashing them temporarily (they'll be restored after update)..."
    git stash push -m "Auto-stash before update $(date +%Y-%m-%d_%H-%M-%S)"
    STASHED=true
    echo -e "${GREEN}✓ Changes stashed${NC}"
    echo ""
else
    STASHED=false
fi

# Fetch latest updates
echo "📡 Fetching latest updates..."
if ! git fetch "$REMOTE" "$TARGET_BRANCH" 2>&1; then
    echo -e "${RED}❌ Error: Failed to fetch updates${NC}"
    echo "Check your internet connection or GitHub access"
    echo "Make sure you have access to the shopify-playground repository"
    exit 1
fi

# Check if updates are available
LOCAL=$(git rev-parse HEAD)
REMOTE_SHA=$(git rev-parse "$REMOTE/$TARGET_BRANCH" 2>/dev/null || echo "")

if [ -z "$REMOTE_SHA" ]; then
    echo -e "${RED}❌ Error: Cannot find ${REMOTE}/${TARGET_BRANCH}${NC}"
    echo "Make sure the remote is configured: git remote -v"
    exit 1
fi

if [ "$LOCAL" = "$REMOTE_SHA" ]; then
    echo -e "${GREEN}✓ Already up to date!${NC}"
    echo ""
    
    # Restore stash if we created one
    if [ "$STASHED" = true ]; then
        echo "🔄 Restoring your stashed changes..."
        git stash pop
        echo -e "${GREEN}✓ Changes restored${NC}"
    fi
    
    exit 0
fi

# Pull updates with merge strategy
echo "⬇️  Pulling updates from ${REMOTE}/${TARGET_BRANCH}..."
echo "📋 Merge strategy: Team versions take precedence for agents/workflows"
echo ""

# Pull with merge strategy (theirs = prefer remote/team version in conflicts)
# This ensures agent updates from team always apply
if git pull "$REMOTE" "$TARGET_BRANCH" -X theirs 2>&1; then
    echo ""
    echo -e "${GREEN}✅ Update successful!${NC}"
    echo ""
    
    # Show what changed
    echo "📝 Recent changes:"
    git log --oneline -5 --decorate
    echo ""
    
    # Restore stash if we created one
    if [ "$STASHED" = true ]; then
        echo "🔄 Restoring your stashed changes..."
        if git stash pop 2>&1; then
            echo -e "${GREEN}✓ Changes restored${NC}"
        else
            echo -e "${YELLOW}⚠️  Conflict while restoring changes${NC}"
            echo "Your changes are still in stash. Run: git stash list"
            echo "To see them and manually apply: git stash apply"
        fi
    fi
    
    echo ""
    echo -e "${GREEN}🎉 All done! Your SE-ASSISTANT_HUB is up to date.${NC}"
    echo ""
    
else
    echo ""
    echo -e "${RED}❌ Update failed${NC}"
    echo ""
    echo "Common fixes:"
    echo "1. Check if you have merge conflicts (look in Cursor's Source Control panel)"
    echo "2. Try manually: git pull $REMOTE $TARGET_BRANCH"
    echo "3. Verify remote is configured: git remote -v"
    echo "4. Ask for help in team Slack with the error message above"
    echo ""
    
    # Restore stash if we created one
    if [ "$STASHED" = true ]; then
        echo "Your changes are safely stashed. Run 'git stash list' to see them."
    fi
    
    exit 1
fi

