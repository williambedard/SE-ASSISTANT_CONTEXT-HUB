# Updating SE-ASSISTANT_HUB from GitHub

**Purpose:** Get the latest updates from the team without needing to know git commands.

**Safe to Update:** This guide protects your personal files (merchant folders, personal-config.md) while pulling team updates.

**Merge Strategy:** In conflicts, team versions take precedence for:
- ✅ Agent files (`.cursor/rules/*.mdc`)
- ✅ Workflows (`workflows/**`)
- ✅ Templates (`templates/**`)
- ✅ Documentation (`README.md`, etc.)

Your personal files are gitignored and never conflict.

---

## 🔔 How You'll Know Updates Are Available

Cursor automatically checks `shopify-playground/main` for updates every 3 minutes and shows you:

**Bottom-left status bar:**
- `↓ 2` = 2 commits behind shopify-playground/main (updates available!)
- Your current branch name is displayed
- Click the branch name to see update details

**When you see the ↓ indicator:** Updates are ready to pull from shopify-playground/main! Use any method below.

---

## ⚡ How to Update (Multiple Options)

### 🥇 Method 1: Cursor's Built-in Git (Easiest - Already There!)

**Cursor automatically tells you when updates are available:**

1. **Look at bottom-left status bar** - You'll see a sync icon (↓) with a number showing commits behind
2. **Click the sync icon** OR open Source Control panel (branch icon in sidebar)
3. **Click "Sync Changes"** button - One click, done! ✅

**This is the most "app-like" experience** - Cursor handles everything automatically.

---

### 🥈 Method 2: Command Palette (One-Click Task)

Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux), then type:

```
Run Task: 🔄 Update SE-ASSISTANT_HUB
```

Select it and hit Enter. The update script runs automatically in a terminal window.

**Bonus:** You can also check for updates without pulling:
```
Run Task: 📊 Check for Updates
```

---

### 🥉 Method 3: Terminal Script

Open Terminal, navigate to SE-ASSISTANT_HUB folder, then:

```bash
bash workflows/core/update-se-assistant.sh
```

Or navigate to `workflows/core/` in Finder and double-click `update-se-assistant.sh`.

The script automatically:
- Checks for updates
- Stashes your uncommitted changes (if any)
- Pulls latest team updates
- Restores your changes
- Shows clear success/error messages

---

### 🥉 Method 4: Direct Git Command (Advanced)

If you're comfortable with terminal:

```bash
git pull shopify-playground main
```

Or from anywhere:
```bash
cd "/Users/[YourUsername]/Documents/GitHub Repos/SE-ASSISTANT_HUB"
git pull shopify-playground main
```

---

## 🔄 What Happens During Updates

### Normal Update (No Conflicts)
1. Script fetches latest from `shopify-playground/main`
2. Checks if you're behind
3. Pulls updates automatically
4. Shows what changed

**Result:** Your files updated, personal files untouched. ✅

### Update with Local Changes
1. Script detects uncommitted changes
2. Stashes them temporarily
3. Pulls updates
4. Restores your changes

**Result:** Both updates and your work preserved. ✅

### Update with Conflicts
1. Same file modified locally and remotely
2. Script uses `-X theirs` strategy (team version wins)
3. Your changes are in stash if needed

**Result:** Team version applied, your version in stash if needed. ✅

**Why this strategy?** Ensures everyone gets latest agent updates immediately. If you customized agents, save them separately first.

---

## ⚠️ Troubleshooting Common Issues

### Issue 1: "You have uncommitted changes"

**What it means:** You've modified files that are tracked by git (not your personal files).

**Fix:**
1. In Source Control panel, look at "Changes" section
2. For each file:
   - If it's a **merchant folder file** or **personal-config.md**: This shouldn't happen (these are gitignored)
   - If it's a **workflow/template file**: Click the file → Click `...` → "Discard Changes" (if you didn't intentionally modify it)
   - If you **did modify** intentionally: Click `+` to stage → Click checkmark to commit → Add message "My custom changes" → Try pull again

### Issue 2: "Merge conflict detected"

**What it means:** You and the team both modified the same file.

**Fix:**
1. Click on the conflicting file in Source Control panel
2. Cursor will show conflict markers: `<<<<<<< HEAD` and `>>>>>>> shopify-playground/main`
3. Choose which version to keep (or manually merge)
4. Save the file
5. Click `+` to stage → Click checkmark to commit → Try pull again

**If this is too complex:** Ask for help in the team Slack channel.

### Issue 3: "Not a git repository" or "fatal: not a git repository"

**What it means:** Terminal is in wrong folder.

**Fix:**
```bash
cd "/Users/[YourUsername]/Documents/GitHub Repos/SE-ASSISTANT_HUB"
git status
```

You should see "On branch [branch-name]". If not, you're in the wrong folder.

---

## 🛡️ Protected Files (Won't Be Overwritten)

These files are safe from updates (they're in `.gitignore`):

✅ **Your Personal Files:**
- `personal-config.md` - Your Salesforce UserId, preferences
- `merchants/*` folders - All your merchant work
- `current-q-priorities.md` - Your quarterly priorities
- `current-w-priorities.md` - Your weekly notes

❌ **Shared Files (Will Update):**
- `.cursor/rules/*.mdc` - Agent configurations
- `workflows/*` - Workflow documentation
- `templates/*` - File templates
- `README.md` - Repository documentation

---

## 📋 Update Checklist (Optional, but Safe)

Before pulling updates, you can optionally backup:

```bash
# Backup personal config (optional paranoia)
cp personal-config.md personal-config.backup.md

# Check what files will update (preview only)
git fetch shopify-playground main
git diff shopify-playground/main --name-only
```

This shows which files will change. If you see your merchant folders or personal-config.md, something is wrong - reach out for help.

---

## 🚀 Best Practices

**When to update:**
- ✅ **Monday mornings** - Weekly habit
- ✅ **After team announcements** - When you see "SE-ASSISTANT_HUB updated!" in Slack
- ✅ **Before important work** - Pull latest before working on high-stakes merchants
- ✅ **If seeing weird behavior** - Might be fixed in latest version

**What to do after updating:**
- Just continue working! Your merchant context is preserved.
- If agents/workflows changed significantly, you'll see a Slack announcement with details.

---

## 🆘 Emergency: "I Broke Something"

If you pulled and now things are broken:

**Step 1: Undo the Pull**
```bash
cd "/Users/[YourUsername]/Documents/GitHub Repos/SE-ASSISTANT_HUB"
git reset --hard HEAD@{1}
```

**Step 2: Ask for Help**
- Post in team Slack channel with error message screenshot
- Include what you were doing when it broke
- Someone will help you recover

**Step 3: Nuclear Option (Rarely Needed)**
If truly stuck, re-clone the repository to a new folder and copy your `merchants/` and `personal-config.md` back in:

```bash
# Backup your work first!
cp -r merchants ~/Desktop/merchants-backup
cp personal-config.md ~/Desktop/personal-config-backup.md

# Re-clone (creates new folder)
cd "/Users/[YourUsername]/Documents/GitHub Repos"
mv SE-ASSISTANT_HUB SE-ASSISTANT_HUB-broken
git clone [repository-url] SE-ASSISTANT_HUB

# Restore your work
cd SE-ASSISTANT_HUB
cp -r ~/Desktop/merchants-backup/* merchants/
cp ~/Desktop/personal-config-backup.md personal-config.md
```

---

## 🆘 Need Help?

**Don't spend more than 5 minutes troubleshooting.** Post in team Slack with:
1. Screenshot of error message
2. Which update method you tried
3. What you were doing when it broke

Someone will help! 🙌

---

**Questions?** Ask in the team Slack channel or tag someone who's comfortable with git.

