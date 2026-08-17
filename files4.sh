#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Files lesson,
# but keep the current files4.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "files4.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/files4.sh" > "$HOME/cli-course/files4.sh"
bash "$HOME/cli-course/files4.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/files5.sh" > "$HOME/cli-course/files5.sh"
bash "$HOME/cli-course/files5.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/documents"
printf 'Rename me.\n' > "$COURSE_DIR/oldname.txt"
printf 'Move me.\n' > "$COURSE_DIR/report.txt"
printf 'First draft.\n' > "$COURSE_DIR/draft.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
FILES 4 — MOVE AND RENAME A FILE
============================================================

Now let's learn:

    mv

mv stands for:

    move

You can use mv to MOVE a file or RENAME a file.

------------------------------------------------------------
RENAME A FILE
------------------------------------------------------------

Type:

    mv oldname.txt newname.txt

Then:

    ls

You should now see:

    newname.txt

------------------------------------------------------------
MOVE A FILE
------------------------------------------------------------

Move report.txt into documents:

    mv report.txt documents

Now check:

    ls documents

You should see:

    report.txt

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Rename:

    draft.txt

to:

    final.txt

Then use:

    ls

to confirm the change.

Remember:

    cp    copy
    mv    move or rename

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Files 5.

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
