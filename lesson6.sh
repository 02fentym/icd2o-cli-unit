#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous lesson,
# but keep the current Lesson 6 script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "lesson6.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson6.sh" > "$HOME/cli-course/lesson6.sh"
bash "$HOME/cli-course/lesson6.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson7.sh" > "$HOME/cli-course/lesson7.sh"
bash "$HOME/cli-course/lesson7.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/documents"
printf 'A sample document.\n' > "$COURSE_DIR/documents/report.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 6 — CHANGE DIRECTORY
============================================================

So far, you've stayed in one place.

Now let's move around the filesystem.

Use:

    cd

cd stands for:

    Change Directory

To move into a directory, type cd followed by its name.

For example:

    cd documents

------------------------------------------------------------
TRY IT
------------------------------------------------------------

First, make sure you're in the course directory:

    pwd

Now type:

    cd documents

Your prompt may change slightly.

Check your location:

    pwd

Your path should now end with:

    /cli-course/documents

------------------------------------------------------------
MOVING UP
------------------------------------------------------------

To move up one directory, use:

    cd ..

Try it:

    cd ..

Then check:

    pwd

You should be back inside:

    cli-course

------------------------------------------------------------
A USEFUL PATTERN
------------------------------------------------------------

When you're exploring, these three commands work well together:

    ls
    cd directory_name
    pwd

First see what's there.
Then move.
Then confirm where you are.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Try this sequence:

    ls
    cd documents
    pwd
    ls
    cd ..
    pwd

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Make sure you're back in the course directory:

    cd ~/cli-course

Then type:

    ./next

to continue to Lesson 7.

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
