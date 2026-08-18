#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous File Content lesson,
# but keep the current file_content6.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "file_content6.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content6.sh" > "$HOME/cli-course/file_content6.sh"
bash "$HOME/cli-course/file_content6.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content7.sh" > "$HOME/cli-course/file_content7.sh"
bash "$HOME/cli-course/file_content7.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/messages.txt" <<'DATA'
ERROR Disk full
error Connection lost
INFO Server started
Error Invalid password
INFO User logged in
WARNING Memory high
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
FILE CONTENT 6 — GREP WITH FLAGS
============================================================

grep has options that change how it searches.

Two useful ones are:

    -i
    -n

------------------------------------------------------------
IGNORE CAPITALIZATION
------------------------------------------------------------

By default, grep is case-sensitive.

Try:

    grep "error" messages.txt

Now try:

    grep -i "error" messages.txt

The -i option means:

    ignore uppercase and lowercase differences

So it can match:

    ERROR
    error
    Error

------------------------------------------------------------
SHOW LINE NUMBERS
------------------------------------------------------------

Try:

    grep -n "INFO" messages.txt

The -n option shows the line number beside each match.

------------------------------------------------------------
COMBINE FLAGS
------------------------------------------------------------

You can combine them:

    grep -in "error" messages.txt

This:

    ignores capitalization
    shows line numbers

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

1. Find every version of the word error.
2. Show their line numbers too.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to File Content 7.

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
