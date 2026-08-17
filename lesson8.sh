#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous lesson,
# but keep the current Lesson 8 script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "lesson8.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson8.sh" > "$HOME/cli-course/lesson8.sh"
bash "$HOME/cli-course/lesson8.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson9.sh" > "$HOME/cli-course/lesson9.sh"
bash "$HOME/cli-course/lesson9.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/documents"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 8 — HOME AND ROOT DIRECTORY
============================================================

Two locations are especially important in a Unix filesystem:

    /
    ~

They are NOT the same thing.

------------------------------------------------------------
THE ROOT DIRECTORY
------------------------------------------------------------

A single slash:

    /

represents the ROOT directory.

This is the very top of the entire filesystem.

Everything on the system exists somewhere underneath it.

Try:

    cd /
    pwd

Your output should be:

    /

You can look around with:

    ls

------------------------------------------------------------
THE HOME DIRECTORY
------------------------------------------------------------

The tilde:

    ~

represents YOUR home directory.

Think of / as the entire building and ~ as your own room
inside that building.

From anywhere, you can return home with:

    cd ~

Try:

    cd ~
    pwd

Notice that you're no longer at /.

------------------------------------------------------------
CD BY ITSELF
------------------------------------------------------------

There is an even shorter way to return home:

    cd

With no argument, cd takes you to your home directory.

Try:

    cd /
    cd
    pwd

You should be back home.

------------------------------------------------------------
RETURN TO THE COURSE
------------------------------------------------------------

Your course directory is inside your home directory.

Return with:

    cd ~/cli-course

The ~ means "my home directory", so this path means:

    cli-course inside my home directory

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Try this journey:

    cd /
    pwd
    cd ~
    pwd
    cd /
    cd
    pwd
    cd ~/cli-course
    pwd

Watch how your location changes each time.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Make sure you're here:

    cd ~/cli-course

Then type:

    ./next

to continue to the Navigation recap.

At any time, type:

    ./lesson

to clear the screen and show these instructions again.

If you need to restart this lesson, type:

    ./resetlesson

============================================================
LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
