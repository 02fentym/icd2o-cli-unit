#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous lesson,
# but keep the current Lesson 19 script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "lesson19.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson19.sh" > "$HOME/cli-course/lesson19.sh"
bash "$HOME/cli-course/lesson19.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson20.sh" > "$HOME/cli-course/lesson20.sh"
bash "$HOME/cli-course/lesson20.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/empty-folder"
mkdir -p "$COURSE_DIR/old-project"
printf 'Old project file.\n' > "$COURSE_DIR/old-project/file.txt" 

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 19 — DELETE A DIRECTORY
============================================================

Now let's delete directories.

There are two useful commands to know:

    rmdir
    rm -r

------------------------------------------------------------
DELETE AN EMPTY DIRECTORY
------------------------------------------------------------

rmdir removes an EMPTY directory.

There is already an empty directory named:

    empty-folder

Delete it:

    rmdir empty-folder

Then:

    ls

It should be gone.

------------------------------------------------------------
WHAT IF THE DIRECTORY HAS FILES?
------------------------------------------------------------

There is also a directory named:

    old-project

Look inside:

    ls old-project

It contains a file.

If a directory is not empty, rmdir will not remove it.

For a directory and everything inside it, use:

    rm -r old-project

Then:

    ls

The directory should be gone.

------------------------------------------------------------
IMPORTANT
------------------------------------------------------------

Be careful with:

    rm -r

It can delete an entire directory and all of its contents.

Always check the name before pressing Enter.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Create an empty directory:

    practice

Then remove it with:

    rmdir practice

Use ls to confirm it is gone.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Lesson 20.

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
