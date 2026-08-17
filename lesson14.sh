#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue
    if [ "$(basename "$item")" != "lesson14.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson14.sh" > "$HOME/cli-course/lesson14.sh"
bash "$HOME/cli-course/lesson14.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson15.sh" > "$HOME/cli-course/lesson15.sh"
bash "$HOME/cli-course/lesson15.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

printf 'Delete this file.\n' > "$COURSE_DIR/delete-me.txt"
printf 'Temporary file.\n' > "$COURSE_DIR/temporary.txt"
printf 'Old notes.\n' > "$COURSE_DIR/old-notes.txt" 

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 14 — DELETE A FILE
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

to continue to Lesson 15.

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
