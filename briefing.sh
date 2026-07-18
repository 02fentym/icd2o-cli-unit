#!/bin/bash
# ICD2O CLI Unit - Bank Heist - Level 1: Casing the Building
# Commands used: ls, cd, cat

# Reset - wipe everything in this folder except this script itself
# (uses $0 so this works no matter what this file is named)
SCRIPT_NAME=$(basename "$0")
find . -mindepth 1 -maxdepth 1 ! -name "$SCRIPT_NAME" -exec rm -rf {} +

# Build the world
mkdir -p job/lobby/front_desk
mkdir -p job/hallway/closet
mkdir -p job/hallway/offices/reception
mkdir -p job/hallway/offices/managers_office/desk_drawer
mkdir -p job/security_room
mkdir -p job/basement/boiler_room
mkdir -p job/basement/vault_prep

echo "You've just slipped in through the loading dock. This is First National Trust. Your crew needs the vault prep notes before tomorrow's job. Start looking around - use 'ls' to see what's nearby, 'cd' to move into a room, and 'cat' to read anything you find." > job/start_here.txt

echo "Just a dusty front desk. Old memos about parking passes. Nothing useful here - head back and check somewhere else." > job/lobby/front_desk/note.txt

echo "A supply closet. Mops, cleaning supplies, a busted vacuum. Not it - go back." > job/hallway/closet/note.txt

echo "The reception area. A half-eaten sandwich and some sticky notes about lunch orders. Go back and try another room." > job/hallway/offices/reception/note.txt

echo "The manager's office. There's a locked-looking desk drawer here - worth checking." > job/hallway/offices/managers_office/note.txt
echo "Inside the drawer: an old performance review. Disappointing, but not what you need. Go back." > job/hallway/offices/managers_office/desk_drawer/note.txt

echo "The security room. Monitors show empty hallways - guard's on a break. Nothing else useful here, keep moving." > job/security_room/note.txt

echo "The boiler room. Loud, hot, and full of pipes. Whoever designed this bank really didn't want people down here. Not your target - go back and check the other basement room." > job/basement/boiler_room/note.txt

echo "You found it - the vault prep room. Taped under a loose floor panel is a note from your crew's inside contact: 'Once you're set up, the next move is codenamed BLACKBIRD. Bring that word to the safehouse.'" > job/basement/vault_prep/blueprint.txt

clear
echo "=========================================="
echo "   FIRST NATIONAL TRUST - after hours"
echo "=========================================="
echo ""
echo "Type: cd job"
echo "Then: cat start_here.txt"
echo ""
