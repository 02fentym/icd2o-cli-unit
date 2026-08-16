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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson4.sh" | bash
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson5.sh" | bash
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"
printf '4\n' > "$COURSE_DIR/current_lesson"

rm -rf "$WORKSPACE_DIR"
mkdir -p "$WORKSPACE_DIR"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 4 — PRINT WORKING DIRECTORY
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

to continue to Lesson 5.

At any time:

    ./lesson
    ./resetlesson

============================================================
LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
