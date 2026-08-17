#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Directories lesson,
# but keep the current directories5.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "directories5.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/directories5.sh" > "$HOME/cli-course/directories5.sh"
bash "$HOME/cli-course/directories5.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/directories_test.sh" > "$HOME/cli-course/directories_test.sh"
bash "$HOME/cli-course/directories_test.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/project"
printf 'Project file.\n' > "$COURSE_DIR/project/readme.txt"

mkdir -p "$COURSE_DIR/remove-this"
printf 'Temporary file.\n' > "$COURSE_DIR/remove-this/temp.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
DIRECTORIES 5 — RECAP: DIRECTORY OPERATIONS
============================================================

You've learned the core commands for working with directories:

    mkdir       create a directory
    mkdir -p    create nested directories
    cp -r       copy a directory
    mv          move or rename a directory
    rmdir       remove an empty directory
    rm -r       remove a directory and its contents

------------------------------------------------------------
CHALLENGE
------------------------------------------------------------

Complete these tasks:

1. Create a directory named:

       practice

2. Create nested directories:

       school/cs

3. Copy:

       project

   to:

       project-copy

4. Rename:

       practice

   to:

       finished

5. Delete the directory:

       remove-this

   and everything inside it.

------------------------------------------------------------
CHECK YOUR WORK
------------------------------------------------------------

Use:

    ls

You should see:

    finished
    project
    project-copy
    school

You should NOT see:

    practice
    remove-this

You can also check:

    ls project-copy
    ls school

------------------------------------------------------------
DIRECTORIES COMPLETE
------------------------------------------------------------

You've finished the Directories section.

Next, you'll complete a short test on the Directories section.

Type:

    ./next

to begin the Directories Test.

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
