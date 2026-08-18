#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous section,
# but keep the current piping1.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "piping1.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping1.sh" > "$HOME/cli-course/piping1.sh"
bash "$HOME/cli-course/piping1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping2.sh" > "$HOME/cli-course/piping2.sh"
bash "$HOME/cli-course/piping2.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/fruits.txt" <<'DATA'
banana
apple
orange
cherry
mango
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
PIPING 1 — WHAT IS A PIPE?
============================================================

Redirection lets you send command output into a file.

But sometimes you want to send the output of one command
DIRECTLY into another command.

For that, use:

    |

This symbol is called a:

    pipe

------------------------------------------------------------
HOW A PIPE WORKS
------------------------------------------------------------

A pipe connects:

    output from one command

to:

    input of another command

Think of it like:

    command 1
        |
        v
    command 2

------------------------------------------------------------
TRY IT
------------------------------------------------------------

First type:

    cat fruits.txt

Now type:

    cat fruits.txt | sort

Here's what happens:

1. cat reads fruits.txt
2. cat sends its output into the pipe
3. sort receives that output
4. sort displays the sorted result

No temporary file is needed.

------------------------------------------------------------
READ IT LEFT TO RIGHT
------------------------------------------------------------

This:

    cat fruits.txt | sort

can be read as:

    read fruits.txt
    THEN
    sort the result

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use a pipe to:

1. Read fruits.txt with cat
2. Send the result into sort

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Piping 2.

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
