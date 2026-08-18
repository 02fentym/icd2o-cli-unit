#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous section,
# but keep the current file_content1.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "file_content1.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content1.sh" > "$HOME/cli-course/file_content1.sh"
bash "$HOME/cli-course/file_content1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content2.sh" > "$HOME/cli-course/file_content2.sh"
bash "$HOME/cli-course/file_content2.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/story.txt" <<'DATA'
Line 1: The journey begins.
Line 2: You open the terminal.
Line 3: You look around.
Line 4: You find a mysterious file.
Line 5: You open it.
Line 6: The message contains a clue.
Line 7: You follow the clue.
Line 8: A hidden path appears.
Line 9: You reach the final room.
Line 10: The journey ends.
Line 11: Bonus line.
Line 12: Another bonus line.
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
FILE CONTENT 1 — HEAD AND TAIL
============================================================

You already know:

    cat

cat displays an entire file.

But sometimes a file is very long and you only want to see
the beginning or the end.

Use:

    head
    tail

------------------------------------------------------------
HEAD
------------------------------------------------------------

head shows the beginning of a file.

Try:

    head story.txt

By default, head shows the first 10 lines.

------------------------------------------------------------
TAIL
------------------------------------------------------------

tail shows the end of a file.

Try:

    tail story.txt

By default, tail shows the last 10 lines.

------------------------------------------------------------
CHOOSE HOW MANY LINES
------------------------------------------------------------

You can use:

    -n

to choose how many lines to display.

Try:

    head -n 3 story.txt

This shows the first 3 lines.

Now try:

    tail -n 4 story.txt

This shows the last 4 lines.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Display only the first 5 lines of:

    story.txt

Then display only the last 2 lines.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to File Content 2.

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
