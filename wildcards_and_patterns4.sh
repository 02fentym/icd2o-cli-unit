#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Wildcards And Patterns lesson,
# but keep the current wildcards_and_patterns4.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "wildcards_and_patterns4.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns4.sh" > "$HOME/cli-course/wildcards_and_patterns4.sh"
bash "$HOME/cli-course/wildcards_and_patterns4.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns5.sh" > "$HOME/cli-course/wildcards_and_patterns5.sh"
bash "$HOME/cli-course/wildcards_and_patterns5.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

touch "$COURSE_DIR/photo_1.jpg"
touch "$COURSE_DIR/photo_2.jpg"
touch "$COURSE_DIR/photo_10.jpg"
touch "$COURSE_DIR/photo_1.png"
touch "$COURSE_DIR/photo_2.png"
touch "$COURSE_DIR/report_1.txt"
touch "$COURSE_DIR/report_2.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
WILDCARDS AND PATTERNS 4 — COMBINING WILDCARDS
============================================================

Wildcards become even more useful when you combine them.

You know:

    *        any number of characters
    ?        exactly one character
    [ ]      one character from a group or range

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    ls

Now type:

    ls photo_?.jpg

You should see:

    photo_1.jpg
    photo_2.jpg

You should NOT see:

    photo_10.jpg

The ? only allows one character between:

    photo_

and:

    .jpg

------------------------------------------------------------
USE BRACKETS
------------------------------------------------------------

Try:

    ls photo_[1-2].jpg

This also matches:

    photo_1.jpg
    photo_2.jpg

------------------------------------------------------------
ANOTHER PATTERN
------------------------------------------------------------

Try:

    ls report_?.txt

You should see:

    report_1.txt
    report_2.txt

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Write a pattern that lists the .jpg photos with exactly one
digit in their names.

Then try a pattern that lists all files beginning with:

    photo_

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Wildcards And Patterns 5.

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
