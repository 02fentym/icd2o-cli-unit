#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Piping lesson,
# but keep the current piping3.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "piping3.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping3.sh" > "$HOME/cli-course/piping3.sh"
bash "$HOME/cli-course/piping3.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping4.sh" > "$HOME/cli-course/piping4.sh"
bash "$HOME/cli-course/piping4.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/visitors.txt" <<'DATA'
Alex
Jordan
Taylor
Alex
Morgan
Taylor
Jordan
Alex
Casey
Morgan
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
PIPING 3 — CHAINING MULTIPLE COMMANDS
============================================================

You're not limited to one pipe.

You can connect several commands together.

For example:

    command1 | command2 | command3

Each command processes the result of the command before it.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    cat visitors.txt | sort | uniq

Follow the data from left to right:

    cat
      |
      v
    sort
      |
      v
    uniq

The result is a sorted list with duplicates removed.

------------------------------------------------------------
ADD ANOTHER COMMAND
------------------------------------------------------------

Now type:

    cat visitors.txt | sort | uniq | wc -l

This pipeline:

1. reads the file
2. sorts the names
3. removes duplicates
4. counts the remaining lines

The final number tells you how many UNIQUE visitors there are.

------------------------------------------------------------
ORDER MATTERS
------------------------------------------------------------

Each command receives the result of the command before it.

So you should think carefully about the order.

For this problem:

    sort

must come before:

    uniq

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use ONE pipeline to count how many unique names are in:

    visitors.txt

Use:

    cat
    sort
    uniq
    wc -l

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Piping 4.

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
