#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Directories lesson,
# but keep the current directories3.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "directories3.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/directories3.sh" > "$HOME/cli-course/directories3.sh"
bash "$HOME/cli-course/directories3.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/directories4.sh" > "$HOME/cli-course/directories4.sh"
bash "$HOME/cli-course/directories4.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/old-folder"
mkdir -p "$COURSE_DIR/storage"
mkdir -p "$COURSE_DIR/photos"
printf 'Photo list.\n' > "$COURSE_DIR/photos/list.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
DIRECTORIES 3 — MOVE AND RENAME A DIRECTORY
============================================================

You already used:

    mv

to move and rename files.

The same command works with directories.

------------------------------------------------------------
RENAME A DIRECTORY
------------------------------------------------------------

Type:

    mv old-folder new-folder

Then:

    ls

You should now see:

    new-folder

------------------------------------------------------------
MOVE A DIRECTORY
------------------------------------------------------------

Move the photos directory into storage:

    mv photos storage

Now type:

    ls storage

You should see:

    photos

You can check inside it with:

    ls storage/photos

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Rename:

    new-folder

to:

    finished-folder

Then use:

    ls

to confirm the change.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Directories 4.

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
