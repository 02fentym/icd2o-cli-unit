#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous File Content lesson,
# but keep the current file_content2.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "file_content2.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content2.sh" > "$HOME/cli-course/file_content2.sh"
bash "$HOME/cli-course/file_content2.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content3.sh" > "$HOME/cli-course/file_content3.sh"
bash "$HOME/cli-course/file_content3.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/notes.txt" <<'DATA'
Learn terminal commands
Practice every day
Read command output carefully
Ask questions when stuck
Keep experimenting
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
FILE CONTENT 2 — WORD COUNT
============================================================

Sometimes you don't need to read a file.

You just want to know how much content is inside it.

Use:

    wc

wc stands for:

    word count

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    wc notes.txt

You'll see three numbers followed by the file name.

They represent:

    lines
    words
    characters

------------------------------------------------------------
COUNT ONLY LINES
------------------------------------------------------------

Use:

    wc -l notes.txt

The -l option counts lines.

------------------------------------------------------------
COUNT ONLY WORDS
------------------------------------------------------------

Use:

    wc -w notes.txt

The -w option counts words.

------------------------------------------------------------
COUNT CHARACTERS
------------------------------------------------------------

Use:

    wc -c notes.txt

The -c option counts characters.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Find:

1. How many lines are in notes.txt?
2. How many words are in notes.txt?

Use:

    wc -l
    wc -w

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to File Content 3.

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
