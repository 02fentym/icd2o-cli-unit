#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Wildcards And Patterns lesson,
# but keep the current wildcards_and_patterns5.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "wildcards_and_patterns5.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns5.sh" > "$HOME/cli-course/wildcards_and_patterns5.sh"
bash "$HOME/cli-course/wildcards_and_patterns5.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns_test.sh" > "$HOME/cli-course/wildcards_and_patterns_test.sh"
bash "$HOME/cli-course/wildcards_and_patterns_test.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/images"

touch "$COURSE_DIR/photo1.jpg"
touch "$COURSE_DIR/photo2.jpg"
touch "$COURSE_DIR/photo10.jpg"
touch "$COURSE_DIR/logo.jpg"
touch "$COURSE_DIR/notes.txt"
touch "$COURSE_DIR/homework.txt"
touch "$COURSE_DIR/report.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
WILDCARDS AND PATTERNS 5 — RECAP: SELECTIVE OPERATIONS
============================================================

You've learned three important wildcard patterns:

    *        any number of characters
    ?        exactly one character
    [ ]      one character from a group or range

Wildcards can be used with commands you already know.

For example:

    ls *.txt
    cp *.jpg images

------------------------------------------------------------
CHALLENGE
------------------------------------------------------------

Complete these tasks.

1. List only the .txt files.

2. List the files that begin with:

       photo

3. List only:

       photo1.jpg
       photo2.jpg

   without matching:

       photo10.jpg

4. Copy ALL .jpg files into:

       images

------------------------------------------------------------
CHECK YOUR WORK
------------------------------------------------------------

Use:

    ls images

You should see:

    logo.jpg
    photo1.jpg
    photo2.jpg
    photo10.jpg

------------------------------------------------------------
IMPORTANT
------------------------------------------------------------

Be especially careful when using wildcards with commands
that remove or move files.

For example:

    rm *.txt

could delete MANY files at once.

A good habit is to first check the pattern with:

    ls *.txt

Then you can see exactly what it matches.

------------------------------------------------------------
WILDCARDS AND PATTERNS COMPLETE
------------------------------------------------------------

You've finished the Wildcards And Patterns section.

Next, you'll complete a short test.

Type:

    ./next

to begin the Wildcards And Patterns Test.

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
