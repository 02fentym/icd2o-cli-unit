#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Files lesson,
# but keep the current files3.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "files3.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/files3.sh" > "$HOME/cli-course/files3.sh"
bash "$HOME/cli-course/files3.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/files4.sh" > "$HOME/cli-course/files4.sh"
bash "$HOME/cli-course/files4.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

printf 'This is the original file.\n' > "$COURSE_DIR/original.txt"
printf 'These are some notes.\n' > "$COURSE_DIR/notes.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
FILES 3 — COPY A FILE
============================================================

Now let's make a COPY of a file.

Use:

    cp

cp stands for:

    copy

The basic pattern is:

    cp original copy

------------------------------------------------------------
TRY IT
------------------------------------------------------------

First read:

    cat original.txt

Now copy it:

    cp original.txt copy.txt

Then:

    ls

You should see:

    original.txt
    copy.txt

------------------------------------------------------------
CHECK THE COPY
------------------------------------------------------------

Type:

    cat copy.txt

The contents should match the original.

The original file still exists.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Copy:

    notes.txt

to:

    notes-backup.txt

Then use:

    ls

to confirm that both files exist.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Files 4.

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
