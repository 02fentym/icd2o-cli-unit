#!/bin/bash
# ICD2O CLI Unit - Bank Heist - Level 2: The Safehouse
# Commands used: pwd, cd (absolute/relative), cd .., cd ~, cat

# Reset - wipe everything in this folder except this script itself
SCRIPT_NAME=$(basename "$0")
find . -mindepth 1 -maxdepth 1 ! -name "$SCRIPT_NAME" -exec rm -rf {} +

# Build the world - a safehouse with two rooms sharing the same name
mkdir -p safehouse/floor1/backroom
mkdir -p safehouse/floor1/kitchen
mkdir -p safehouse/floor2/east_wing/backroom
mkdir -p safehouse/floor2/west_wing/storage

echo "You made it to the safehouse. This place is a maze - hallways
loop back on themselves, and there's more than one room with the
same name.

If you get turned around:
- pwd    show your exact location (your full address)
- cd     move into a room (works nearby or with a full path)
- cd ..  step back up one level
- cd ~   jump straight back to the front door if you're lost
- cat    read what you find

Careful: two rooms in this building are both called 'backroom'.
Only one of them matters. Run pwd before you trust what you're
reading." > safehouse/start_here.txt

echo "Just a kitchen. Cold coffee and a stack of unpaid bills.

- Not it. Go back." > safehouse/floor1/kitchen/note.txt

echo "A backroom. Empty except for a folding chair and a dead
lightbulb.

- Wrong backroom. There's another one somewhere in this building.
- Run pwd right now so you remember what a dead end looks like." \
  > safehouse/floor1/backroom/note.txt

echo "A storage closet. Boxes of zip ties and old radios.

- Not it. Go back." > safehouse/floor2/west_wing/storage/note.txt

echo "This backroom is different - a folding table with a map spread
across it. Someone circled a word in red marker:

'The next stop is codenamed wraith. Bring that word to the lockup.'

Run pwd. Take a screenshot or copy this exact path - you'll want to
remember how you got here." > safehouse/floor2/east_wing/backroom/note.txt

clear
echo "=========================================="
echo "   THE SAFEHOUSE - somewhere off Dundas St"
echo "=========================================="
echo ""
echo "BLACKBIRD confirmed. You're in."
echo ""
echo "The crew scattered notes around the safehouse for security."
echo "Two rooms share a name - only one has what you need. Move"
echo "carefully and check pwd if you're not sure where you are."
echo ""
echo "Next steps:"
echo "  - cd safehouse"
echo "  - cat start_here.txt"
echo ""
