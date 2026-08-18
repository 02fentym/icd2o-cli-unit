#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Piping lesson,
# but keep the current piping5.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "piping5.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping5.sh" > "$HOME/cli-course/piping5.sh"
bash "$HOME/cli-course/piping5.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping_test.sh" > "$HOME/cli-course/piping_test.sh"
bash "$HOME/cli-course/piping_test.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/scores.txt" <<'DATA'
Taylor 82
Alex 91
Morgan 76
Jordan 91
Alex 91
Casey 88
Morgan 76
Taylor 82
DATA

cat > "$COURSE_DIR/system.log" <<'DATA'
INFO System started
ERROR Disk full
WARNING Memory high
INFO User connected
ERROR Network failed
INFO Backup complete
ERROR Permission denied
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
PIPING 5 — RECAP: DATA PIPELINE
============================================================

You've learned how to connect commands using:

    |

A pipeline lets the output of one command become the input
of the next command.

------------------------------------------------------------
CHALLENGE 1
------------------------------------------------------------

Use a pipeline to display scores.txt in alphabetical order.

Use:

    cat
    sort

------------------------------------------------------------
CHALLENGE 2
------------------------------------------------------------

Use a pipeline to display the unique lines in scores.txt.

Remember:

    sort

should come before:

    uniq

------------------------------------------------------------
CHALLENGE 3
------------------------------------------------------------

Use ONE pipeline to count how many unique lines are in:

    scores.txt

Use:

    cat
    sort
    uniq
    wc -l

------------------------------------------------------------
CHALLENGE 4
------------------------------------------------------------

Use ONE pipeline to count how many lines in:

    system.log

contain:

    ERROR

Use:

    cat
    grep
    wc -l

------------------------------------------------------------
THINK LIKE A PIPELINE
------------------------------------------------------------

When building a pipeline, ask:

1. What data do I start with?
2. What should happen to it first?
3. What should happen next?
4. What final result do I want?

Then connect the commands from left to right.

------------------------------------------------------------
PIPING COMPLETE
------------------------------------------------------------

You've finished the Piping section.

Next, you'll complete the Piping Test.

Type:

    ./next

to begin the test.

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
