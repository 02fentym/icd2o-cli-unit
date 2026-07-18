#!/bin/bash
# ICD2O CLI Unit - Bank Heist - Level 1: Casing the Building
# Commands used: ls, cd, cat

# Relocate to a safe spot before doing anything else. This guarantees
# the script always runs from home, no matter where it was downloaded
# and started from - and means the reset step below can never delete
# the very file that's currently running.
if [ -z "$RELOCATED" ]; then
  cp "$0" /tmp/_level.sh
  cd ~ || exit 1
  RELOCATED=1 exec bash /tmp/_level.sh
fi

# Reset - wipe everything in home. Safe now, since this script is
# actually running from /tmp, not from anywhere inside home.
find ~ -mindepth 1 -maxdepth 1 -exec rm -rf {} +

# Build the world
mkdir -p job/lobby/front_desk
mkdir -p job/hallway/closet
mkdir -p job/hallway/offices/reception
mkdir -p job/hallway/offices/managers_office/desk_drawer
mkdir -p job/security_room
mkdir -p job/basement/boiler_room
mkdir -p job/basement/vault_prep

echo "You've just slipped in through the loading dock. This is First
National Trust. Your crew needs the vault prep notes before tomorrow's
job.

Three commands are all you need tonight:
- ls    look around the room you're in
- cd    move into a room
- cat   read a note or file

Some rooms are dead ends. If a note tells you to go back, use:
cd ..

Type 'cat cheatsheet.txt' any time to see a reminder of everything
you know so far.

Good luck." > job/start_here.txt

echo "COMMANDS YOU KNOW SO FAR
- ls              list what's in the folder you're standing in
- cd foldername   move into a folder
- cd ..           step back up one level
- cat filename    read a file's contents

LOADING THE NEXT LEVEL
Once you find this level's secret keyword hidden somewhere in these
files, run these THREE commands in order (swap KEYWORD for the real
word, all lowercase, no spaces):

cd ~
curl -O https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/KEYWORD.sh
bash KEYWORD.sh

Always run 'cd ~' first, even if you think you're already home.
Skipping this step will scramble the next level." > job/cheatsheet.txt

echo "Just a dusty front desk. Old memos about parking passes.

- Nothing useful here. Go back and check somewhere else." \
  > job/lobby/front_desk/note.txt

echo "A supply closet. Mops, cleaning supplies, a busted vacuum.

- Not it. Go back." > job/hallway/closet/note.txt

echo "The reception area. A half-eaten sandwich and some sticky notes
about lunch orders.

- Go back and try another room." \
  > job/hallway/offices/reception/note.txt

echo "The manager's office. There's a locked-looking desk drawer here.

- Worth checking." > job/hallway/offices/managers_office/note.txt

echo "Inside the drawer: an old performance review. Disappointing.

- Not what you need. Go back." \
  > job/hallway/offices/managers_office/desk_drawer/note.txt

echo "The security room. Monitors show empty hallways - guard's on a
break.

- Nothing else useful here. Keep moving." > job/security_room/note.txt

echo "The boiler room. Loud, hot, and full of pipes.

- Not your target. Go back and check the other basement room." \
  > job/basement/boiler_room/note.txt

echo "You found it - the vault prep room. Taped under a loose floor
panel is a note from your crew's inside contact:

'Once you're set up, the next move is codenamed blackbird. Bring
that word to the safehouse.'" > job/basement/vault_prep/blueprint.txt

cd ~
clear
echo "=========================================="
echo "   FIRST NATIONAL TRUST - after hours"
echo "=========================================="
echo ""
echo "You're a thief casing First National Trust for tomorrow's job."
echo "Your crew needs the vault prep notes hidden somewhere inside."
echo "Move room to room, read what you find, and don't get caught"
echo "wasting time in the wrong place."
echo ""
echo "Next steps:"
echo "  - cd job"
echo "  - cat start_here.txt"
echo ""
