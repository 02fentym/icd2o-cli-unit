#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous project,
# but keep the current wildcards_and_patterns1.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "wildcards_and_patterns1.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns1.sh" > "$HOME/cli-course/wildcards_and_patterns1.sh"
bash "$HOME/cli-course/wildcards_and_patterns1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns2.sh" > "$HOME/cli-course/wildcards_and_patterns2.sh"
bash "$HOME/cli-course/wildcards_and_patterns2.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

touch "$COURSE_DIR/notes.txt"
touch "$COURSE_DIR/homework.txt"
touch "$COURSE_DIR/report.txt"
touch "$COURSE_DIR/photo.jpg"
touch "$COURSE_DIR/logo.png"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
WILDCARDS AND PATTERNS 1 — THE STAR WILDCARD
============================================================

Sometimes you want a command to work with several files at
once.

Wildcards let you match file names using patterns.

The most common wildcard is:

    *

The * can match any number of characters.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

First type:

    ls

You should see several files, including:

    homework.txt
    logo.png
    notes.txt
    photo.jpg
    report.txt

Now type:

    ls *.txt

The pattern:

    *.txt

means:

    anything ending in .txt

You should see:

    homework.txt
    notes.txt
    report.txt

------------------------------------------------------------
MATCH THE BEGINNING
------------------------------------------------------------

You can put * at the end too.

Try:

    ls photo*

This matches anything that begins with:

    photo

You should see:

    photo.jpg

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use a wildcard to list only the files ending in:

    .txt

Then use a wildcard to list files beginning with:

    r

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Wildcards And Patterns 2.

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
