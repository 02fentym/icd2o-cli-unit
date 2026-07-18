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

echo "You've just slipped in through the loading dock. This is First
National Trust. Your crew needs the vault prep notes before tomorrow's
job.

Three commands are all you need tonight:
- ls    look around the room you're in
- cd    move into a room
- cat   read a note or file

Some rooms are dead ends. If a note tells you to go back, use:
cd ..

Good luck." > job/start_here.txt

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

'Once you're set up, the next move is codenamed blackbird. Bring that
word to the safehouse.'" > job/basement/vault_prep/blueprint.txt

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
