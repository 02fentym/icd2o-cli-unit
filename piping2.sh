#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Piping lesson,
# but keep the current piping2.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "piping2.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping2.sh" > "$HOME/cli-course/piping2.sh"
bash "$HOME/cli-course/piping2.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping3.sh" > "$HOME/cli-course/piping3.sh"
bash "$HOME/cli-course/piping3.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/names.txt" <<'DATA'
Taylor
Alex
Morgan
Alex
Jordan
Taylor
Morgan
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
PIPING 2 — CHAINING TWO COMMANDS
============================================================

A pipe lets two commands work together.

The first command produces output.

The second command receives that output as input.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    cat names.txt

Notice that some names appear more than once.

Now type:

    cat names.txt | sort

The file is read first.

Then the result is sorted.

------------------------------------------------------------
ANOTHER EXAMPLE
------------------------------------------------------------

Try:

    sort names.txt | uniq

This does two things:

1. sort puts identical names beside each other
2. uniq removes repeated neighbouring lines

You should now see each name once.

------------------------------------------------------------
WHY ORDER MATTERS
------------------------------------------------------------

uniq removes duplicates that are NEXT TO each other.

So:

    sort names.txt | uniq

works well because sort groups duplicates together first.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use two commands connected with a pipe to display each name
only once.

Use:

    sort
    uniq

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Piping 3.

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
