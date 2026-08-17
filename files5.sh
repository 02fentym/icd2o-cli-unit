#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Files lesson,
# but keep the current files5.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "files5.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/files5.sh" > "$HOME/cli-course/files5.sh"
bash "$HOME/cli-course/files5.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/files6.sh" > "$HOME/cli-course/files6.sh"
bash "$HOME/cli-course/files6.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

printf 'Delete this file.\n' > "$COURSE_DIR/delete-me.txt"
printf 'Temporary file.\n' > "$COURSE_DIR/temporary.txt"
printf 'Old notes.\n' > "$COURSE_DIR/old-notes.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
FILES 5 — DELETE A FILE
============================================================

Now let's delete a file.

Use:

    rm

rm stands for:

    remove

------------------------------------------------------------
IMPORTANT
------------------------------------------------------------

The terminal usually does NOT move deleted files to a
Recycle Bin or Trash.

So always check the file name before pressing Enter.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

First:

    ls

Now delete:

    rm delete-me.txt

Then:

    ls

The file should be gone.

------------------------------------------------------------
DELETE ANOTHER FILE
------------------------------------------------------------

Delete:

    temporary.txt

Then use ls to confirm that it is gone.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Delete:

    old-notes.txt

Then use:

    ls

to check your work.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Files 6.

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
