#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous File Content lesson,
# but keep the current file_content5.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "file_content5.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content5.sh" > "$HOME/cli-course/file_content5.sh"
bash "$HOME/cli-course/file_content5.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content6.sh" > "$HOME/cli-course/file_content6.sh"
bash "$HOME/cli-course/file_content6.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/server.log" <<'DATA'
INFO server started
INFO user connected
ERROR disk full
WARNING memory high
INFO request completed
ERROR connection timeout
INFO server stopped
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
FILE CONTENT 5 — GREP BASICS
============================================================

Imagine a file has hundreds or thousands of lines.

You might only want to see lines containing a certain word.

Use:

    grep

grep searches file contents for matching text.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

First:

    cat server.log

Now search for ERROR:

    grep "ERROR" server.log

You should see only the lines containing:

    ERROR

------------------------------------------------------------
SEARCH FOR ANOTHER WORD
------------------------------------------------------------

Try:

    grep "INFO" server.log

Now only the INFO lines are displayed.

------------------------------------------------------------
CASE MATTERS
------------------------------------------------------------

grep is case-sensitive by default.

These are different:

    ERROR
    error

So:

    grep "error" server.log

will not match uppercase ERROR.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use grep to display only the line containing:

    WARNING

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to File Content 6.

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
