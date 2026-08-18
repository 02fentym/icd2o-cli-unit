#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous File Content lesson,
# but keep the current file_content4.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "file_content4.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content4.sh" > "$HOME/cli-course/file_content4.sh"
bash "$HOME/cli-course/file_content4.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content5.sh" > "$HOME/cli-course/file_content5.sh"
bash "$HOME/cli-course/file_content5.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/names.txt" <<'DATA'
Alex
Alex
Jordan
Jordan
Jordan
Morgan
Taylor
Taylor
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
FILE CONTENT 4 — UNIQUE LINES
============================================================

Sometimes a file contains duplicate lines.

Use:

    uniq

uniq removes repeated lines that are NEXT TO each other.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

First:

    cat names.txt

Now type:

    uniq names.txt

You should see each group of repeated names only once.

------------------------------------------------------------
IMPORTANT
------------------------------------------------------------

uniq only removes duplicates that are beside each other.

That means files are often sorted before using uniq.

For now, remember:

    uniq

works best when duplicate lines are already grouped together.

------------------------------------------------------------
COUNT DUPLICATES
------------------------------------------------------------

Try:

    uniq -c names.txt

The -c option shows how many times each line appears.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Run:

    uniq names.txt

Then:

    uniq -c names.txt

Compare the results.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to File Content 5.

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
