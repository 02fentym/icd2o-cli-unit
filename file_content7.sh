#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous File Content lesson,
# but keep the current file_content7.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "file_content7.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content7.sh" > "$HOME/cli-course/file_content7.sh"
bash "$HOME/cli-course/file_content7.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content_test.sh" > "$HOME/cli-course/file_content_test.sh"
bash "$HOME/cli-course/file_content_test.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/activity.log" <<'DATA'
INFO User Alex logged in
ERROR File missing
INFO User Morgan logged in
WARNING Storage almost full
ERROR Permission denied
INFO Backup completed
ERROR Network unavailable
INFO User Taylor logged out
DATA

cat > "$COURSE_DIR/names.txt" <<'DATA'
Taylor
Alex
Morgan
Alex
Jordan
Taylor
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
FILE CONTENT 7 — RECAP: TEXT DETECTIVE
============================================================

You've learned several commands for investigating text files:

    head
    tail
    wc
    sort
    uniq
    grep

Now you'll use them like a text detective.

------------------------------------------------------------
CHALLENGE 1
------------------------------------------------------------

Display only the first 3 lines of:

    activity.log

------------------------------------------------------------
CHALLENGE 2
------------------------------------------------------------

Display only the last 2 lines of:

    activity.log

------------------------------------------------------------
CHALLENGE 3
------------------------------------------------------------

Find how many lines are in:

    activity.log

------------------------------------------------------------
CHALLENGE 4
------------------------------------------------------------

Display only the lines containing:

    ERROR

------------------------------------------------------------
CHALLENGE 5
------------------------------------------------------------

Sort:

    names.txt

alphabetically.

------------------------------------------------------------
CHALLENGE 6
------------------------------------------------------------

Look at names.txt.

Some names appear more than once.

Use the commands you've learned to explore the file.

Remember:

    uniq

only removes repeated lines when they are next to each other.

------------------------------------------------------------
FILE CONTENT COMPLETE
------------------------------------------------------------

You've finished the File Content section.

Next, you'll complete the File Content Test.

Type:

    ./next

to begin the test.

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
