#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Directories lesson,
# but keep the current directories4.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "directories4.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/directories4.sh" > "$HOME/cli-course/directories4.sh"
bash "$HOME/cli-course/directories4.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/directories5.sh" > "$HOME/cli-course/directories5.sh"
bash "$HOME/cli-course/directories5.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/empty-folder"
mkdir -p "$COURSE_DIR/old-project"
printf 'Old project file.\n' > "$COURSE_DIR/old-project/file.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
DIRECTORIES 4 — DELETE A DIRECTORY
============================================================

There are two common ways to delete directories.

The command you use depends on whether the directory is empty.

------------------------------------------------------------
DELETE AN EMPTY DIRECTORY
------------------------------------------------------------

Use:

    rmdir

rmdir only removes EMPTY directories.

Try:

    rmdir empty-folder

Then:

    ls

The directory should be gone.

------------------------------------------------------------
DELETE A DIRECTORY WITH FILES
------------------------------------------------------------

The directory:

    old-project

contains a file.

Try:

    ls old-project

You should see:

    file.txt

To delete the directory AND everything inside it, use:

    rm -r

Try:

    rm -r old-project

Then:

    ls

The directory should be gone.

------------------------------------------------------------
IMPORTANT
------------------------------------------------------------

Be careful with:

    rm -r

It removes an entire directory and everything inside it.

There is usually no Trash or Recycle Bin.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Create an empty directory:

    mkdir temporary

Then remove it using:

    rmdir temporary

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Directories 5.

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
