#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous section,
# but keep the current files1.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "files1.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/files1.sh" > "$HOME/cli-course/files1.sh"
bash "$HOME/cli-course/files1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/files2.sh" > "$HOME/cli-course/files2.sh"
bash "$HOME/cli-course/files2.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
FILES 1 — CREATE A FILE
============================================================

So far, you've learned how to move around the filesystem.

Now you'll start working with FILES.

The first command is:

    touch

touch can create a new, empty file.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    touch practice.txt

Now list the files:

    ls

You should see:

    practice.txt

You just created a file.

------------------------------------------------------------
CREATE ANOTHER FILE
------------------------------------------------------------

Try:

    touch notes.txt

Then:

    ls

You should now see both files.

------------------------------------------------------------
FILE NAMES
------------------------------------------------------------

A file name can include a file extension such as:

    .txt
    .py
    .java

The extension often helps describe what kind of file it is.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Create a file named:

    hello.txt

Then use:

    ls

to make sure it exists.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Files 2.

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
