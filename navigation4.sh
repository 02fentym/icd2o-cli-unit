#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Navigation lesson,
# but keep the current navigation4.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "navigation4.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation4.sh" > "$HOME/cli-course/navigation4.sh"
bash "$HOME/cli-course/navigation4.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation5.sh" > "$HOME/cli-course/navigation5.sh"
bash "$HOME/cli-course/navigation5.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/documents"
mkdir -p "$COURSE_DIR/projects/python"
printf 'Navigation practice.\n' > "$COURSE_DIR/documents/notes.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
NAVIGATION 4 — ABSOLUTE VS RELATIVE PATHS
============================================================

A PATH tells the shell where something is located.

There are two important kinds of paths:

    absolute paths
    relative paths

------------------------------------------------------------
ABSOLUTE PATHS
------------------------------------------------------------

An absolute path starts from the very top of the filesystem.

It begins with:

    /

An absolute path describes the full location.

It does not depend on where you are right now.

------------------------------------------------------------
RELATIVE PATHS
------------------------------------------------------------

A relative path starts from your CURRENT location.

If you're already inside:

    ~/cli-course

you can move into documents with:

    cd documents

You don't need the entire path.

------------------------------------------------------------
SPECIAL RELATIVE PATHS
------------------------------------------------------------

You already know:

    ..

which means:

    parent directory

Another useful symbol is:

    .

which means:

    current directory

So:

    cd ./documents

means essentially the same thing as:

    cd documents

------------------------------------------------------------
TRY IT
------------------------------------------------------------

From ~/cli-course:

    cd documents
    pwd
    cd ..
    cd ./documents
    pwd
    cd ..

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Return to:

    cd ~/cli-course

Then type:

    ./next

to continue to Navigation 5.

At any time:

    ./lesson
    ./resetlesson

============================================================
LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
