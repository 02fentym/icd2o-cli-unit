#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous section,
# but keep the current navigation1.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "navigation1.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation1.sh" > "$HOME/cli-course/navigation1.sh"
bash "$HOME/cli-course/navigation1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation2.sh" > "$HOME/cli-course/navigation2.sh"
bash "$HOME/cli-course/navigation2.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
NAVIGATION 1 — PRINT WORKING DIRECTORY
============================================================

The terminal is always working inside a directory.

A directory is another word for a folder.

Think of it like this:

    You are always standing somewhere in the filesystem.

So how do you find out where you are?

Use:

    pwd

pwd stands for:

    Print Working Directory

It displays the full path of your current directory.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    pwd

Then press Enter.

Because this course starts inside the cli-course directory,
your output should end with:

    /cli-course

------------------------------------------------------------
WHAT IS A PATH?
------------------------------------------------------------

A PATH describes a location in the filesystem.

For example:

    /home
    /home/documents
    /home/projects/python

Each / separates one directory from another.

For now, the important idea is simple:

    pwd tells you where you are.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Run:

    pwd

Look carefully at the result.

Which directory are you currently inside?

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Navigation 2.

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
