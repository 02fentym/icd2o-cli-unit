#!/bin/bash
COURSE_DIR="$HOME/cli-course"
WORKSPACE_DIR="$COURSE_DIR/workspace"
mkdir -p "$COURSE_DIR" "$WORKSPACE_DIR"

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
cat "$HOME/cli-course/lesson.txt"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson8.sh" | bash
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson9.sh" | bash
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"
printf '8\n' > "$COURSE_DIR/current_lesson"

rm -rf "$WORKSPACE_DIR"
mkdir -p "$WORKSPACE_DIR"


rm -rf "$COURSE_DIR/documents"
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

At any time:

    ./lesson
    ./resetlesson

============================================================

LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
