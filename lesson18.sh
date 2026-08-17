#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous lesson,
# but keep the current Lesson 18 script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "lesson18.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson18.sh" > "$HOME/cli-course/lesson18.sh"
bash "$HOME/cli-course/lesson18.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson19.sh" > "$HOME/cli-course/lesson19.sh"
bash "$HOME/cli-course/lesson19.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/old-folder"
mkdir -p "$COURSE_DIR/storage"
mkdir -p "$COURSE_DIR/photos"
printf 'Vacation photo list.\n' > "$COURSE_DIR/photos/list.txt" 

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 18 — MOVE AND RENAME A DIRECTORY
============================================================

You learned that mv can move or rename FILES.

The same command works with DIRECTORIES.

Use:

    mv

------------------------------------------------------------
RENAME A DIRECTORY
------------------------------------------------------------

There is a directory named:

    old-folder

Rename it:

    mv old-folder new-folder

Then:

    ls

You should now see:

    new-folder

------------------------------------------------------------
MOVE A DIRECTORY
------------------------------------------------------------

There is also a directory named:

    photos

and another named:

    storage

Move photos inside storage:

    mv photos storage

Now check:

    ls storage

You should see:

    photos

You can also look inside:

    ls storage/photos

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Create a directory:

    drafts

Then rename it to:

    finished

Use:

    ls

to confirm the change.

Remember:

    mv    move or rename

works with both files and directories.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Lesson 19.

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
