#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous File Content lesson,
# but keep the current file_content3.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "file_content3.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content3.sh" > "$HOME/cli-course/file_content3.sh"
bash "$HOME/cli-course/file_content3.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content4.sh" > "$HOME/cli-course/file_content4.sh"
bash "$HOME/cli-course/file_content4.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/fruits.txt" <<'DATA'
banana
apple
orange
cherry
mango
DATA

cat > "$COURSE_DIR/numbers.txt" <<'DATA'
50
3
100
25
7
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
FILE CONTENT 3 — SORT
============================================================

The sort command arranges lines.

Use:

    sort

------------------------------------------------------------
ALPHABETICAL ORDER
------------------------------------------------------------

First read:

    cat fruits.txt

Now type:

    sort fruits.txt

The lines are displayed in alphabetical order.

IMPORTANT:

sort does NOT change the original file.

It only displays the sorted result.

------------------------------------------------------------
REVERSE ORDER
------------------------------------------------------------

Use:

    sort -r fruits.txt

The -r option reverses the order.

------------------------------------------------------------
SORT NUMBERS
------------------------------------------------------------

Look at:

    cat numbers.txt

To sort numbers properly, use:

    sort -n numbers.txt

The -n option means:

    numerical order

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

1. Sort fruits.txt alphabetically.
2. Sort fruits.txt in reverse.
3. Sort numbers.txt numerically.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to File Content 4.

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
