#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous section,
# but keep the current directories1.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "directories1.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/directories1.sh" > "$HOME/cli-course/directories1.sh"
bash "$HOME/cli-course/directories1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/directories2.sh" > "$HOME/cli-course/directories2.sh"
bash "$HOME/cli-course/directories2.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
DIRECTORIES 1 — CREATE A DIRECTORY
============================================================

You've already worked with files.

Now let's create directories.

A directory is another word for a folder.

Use:

    mkdir

mkdir stands for:

    make directory

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    mkdir practice

Now list the contents of the current directory:

    ls

You should see:

    practice

------------------------------------------------------------
CREATE ANOTHER DIRECTORY
------------------------------------------------------------

Try:

    mkdir projects

Then:

    ls

You should now see both directories.

------------------------------------------------------------
CREATE NESTED DIRECTORIES
------------------------------------------------------------

Sometimes you want to create several levels at once.

Use:

    mkdir -p

For example:

    mkdir -p school/cs

This creates:

    school
        cs

Try it.

Then type:

    ls school

You should see:

    cs

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Create:

    homework

Then create:

    classes/math

using mkdir -p.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Directories 2.

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
