#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Wildcards And Patterns lesson,
# but keep the current wildcards_and_patterns2.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "wildcards_and_patterns2.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns2.sh" > "$HOME/cli-course/wildcards_and_patterns2.sh"
bash "$HOME/cli-course/wildcards_and_patterns2.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns3.sh" > "$HOME/cli-course/wildcards_and_patterns3.sh"
bash "$HOME/cli-course/wildcards_and_patterns3.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

touch "$COURSE_DIR/file1.txt"
touch "$COURSE_DIR/file2.txt"
touch "$COURSE_DIR/file3.txt"
touch "$COURSE_DIR/file10.txt"
touch "$COURSE_DIR/note1.txt"
touch "$COURSE_DIR/note2.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
WILDCARDS AND PATTERNS 2 — THE QUESTION MARK WILDCARD
============================================================

You've learned:

    *

which can match many characters.

Another wildcard is:

    ?

The ? matches exactly ONE character.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    ls

You should see:

    file1.txt
    file2.txt
    file3.txt
    file10.txt
    note1.txt
    note2.txt

Now type:

    ls file?.txt

You should see:

    file1.txt
    file2.txt
    file3.txt

But NOT:

    file10.txt

Why?

Because ? matches exactly one character.

------------------------------------------------------------
COMPARE
------------------------------------------------------------

Try:

    ls file*.txt

This matches:

    file1.txt
    file2.txt
    file3.txt
    file10.txt

Now try:

    ls file?.txt

Notice the difference.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use ? to list:

    note1.txt
    note2.txt

with one pattern.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Wildcards And Patterns 3.

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
