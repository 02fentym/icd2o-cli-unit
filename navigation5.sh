#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Navigation lesson,
# but keep the current navigation5.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "navigation5.sh" ]; then
        rm -rf "$item"
    fi
done

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
cat "$HOME/cli-course/lesson.txt"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation5.sh" > "$HOME/cli-course/navigation5.sh"
bash "$HOME/cli-course/navigation5.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation6.sh" > "$HOME/cli-course/navigation6.sh"
bash "$HOME/cli-course/navigation6.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
NAVIGATION 5 — HOME AND ROOT DIRECTORY
============================================================

Two locations are especially important:

    /
    ~

They are NOT the same thing.

------------------------------------------------------------
THE ROOT DIRECTORY
------------------------------------------------------------

A single slash:

    /

represents the ROOT directory.

This is the top of the entire filesystem.

Try:

    cd /
    pwd

Your output should be:

    /

------------------------------------------------------------
THE HOME DIRECTORY
------------------------------------------------------------

The tilde:

    ~

represents YOUR home directory.

From anywhere, you can return home with:

    cd ~

Try:

    cd ~
    pwd

------------------------------------------------------------
CD BY ITSELF
------------------------------------------------------------

There is an even shorter way to return home:

    cd

Try:

    cd /
    cd
    pwd

------------------------------------------------------------
RETURN TO THE COURSE
------------------------------------------------------------

Return with:

    cd ~/cli-course

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Try:

    cd /
    pwd
    cd ~
    pwd
    cd /
    cd
    pwd
    cd ~/cli-course
    pwd

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Make sure you're inside:

    cd ~/cli-course

Then type:

    ./next

to continue to Navigation 6.

At any time:

    ./lesson
    ./resetlesson

============================================================
LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
