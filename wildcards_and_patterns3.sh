#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Wildcards And Patterns lesson,
# but keep the current wildcards_and_patterns3.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "wildcards_and_patterns3.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns3.sh" > "$HOME/cli-course/wildcards_and_patterns3.sh"
bash "$HOME/cli-course/wildcards_and_patterns3.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns4.sh" > "$HOME/cli-course/wildcards_and_patterns4.sh"
bash "$HOME/cli-course/wildcards_and_patterns4.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

touch "$COURSE_DIR/file1.txt"
touch "$COURSE_DIR/file2.txt"
touch "$COURSE_DIR/file3.txt"
touch "$COURSE_DIR/file4.txt"
touch "$COURSE_DIR/file5.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
WILDCARDS AND PATTERNS 3 — BRACKET WILDCARDS
============================================================

Sometimes you want to match ONE character, but only from a
specific group.

For that, use:

    [ ]

------------------------------------------------------------
MATCH SPECIFIC CHARACTERS
------------------------------------------------------------

Type:

    ls

You should see:

    file1.txt
    file2.txt
    file3.txt
    file4.txt
    file5.txt

Now type:

    ls file[123].txt

You should see:

    file1.txt
    file2.txt
    file3.txt

The pattern:

    [123]

means:

    match 1, 2, or 3

------------------------------------------------------------
USE A RANGE
------------------------------------------------------------

You can also write:

    ls file[1-3].txt

This gives the same result.

The pattern:

    [1-3]

means:

    any ONE character from 1 through 3

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use a bracket pattern to list only:

    file4.txt
    file5.txt

Try using:

    [45]

Then try using a range instead.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Wildcards And Patterns 4.

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
