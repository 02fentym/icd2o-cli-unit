#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Navigation lesson,
# but keep the current navigation3.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "navigation3.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation3.sh" > "$HOME/cli-course/navigation3.sh"
bash "$HOME/cli-course/navigation3.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation4.sh" > "$HOME/cli-course/navigation4.sh"
bash "$HOME/cli-course/navigation4.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/documents"
printf 'A sample document.\n' > "$COURSE_DIR/documents/report.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
NAVIGATION 3 — CHANGE DIRECTORY
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

First:

    pwd

Now type:

    cd documents

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

Then:

    pwd

You should be back inside:

    cli-course

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Try:

    ls
    cd documents
    pwd
    ls
    cd ..
    pwd

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Make sure you're back inside:

    cd ~/cli-course

Then type:

    ./next

to continue to Navigation 4.

At any time:

    ./lesson
    ./resetlesson

============================================================
LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
