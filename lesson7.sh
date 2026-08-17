#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous lesson,
# but keep the current Lesson 7 script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "lesson7.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson7.sh" > "$HOME/cli-course/lesson7.sh"
bash "$HOME/cli-course/lesson7.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson8.sh" > "$HOME/cli-course/lesson8.sh"
bash "$HOME/cli-course/lesson8.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/documents"
mkdir -p "$COURSE_DIR/projects/python"
printf 'Navigation practice.\n' > "$COURSE_DIR/documents/notes.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 7 — ABSOLUTE VS RELATIVE PATHS
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

For example, if your course directory is located at:

    /home/cli-course

then this is an absolute path:

    /home/cli-course/documents

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

The shell interprets "documents" relative to where you are now.

------------------------------------------------------------
SPECIAL RELATIVE PATHS
------------------------------------------------------------

You already know:

    ..

which means:

    parent directory

There is another useful symbol:

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

From ~/cli-course, type:

    cd documents
    pwd

That's a RELATIVE path.

Now return:

    cd ..

Try:

    cd ./documents
    pwd

Again, that's relative.

Then return:

    cd ..

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Starting from ~/cli-course:

1. Enter documents using:

       cd documents

2. Return using:

       cd ..

3. Enter documents again using:

       cd ./documents

4. Return to the course directory.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Return to:

    cd ~/cli-course

Then type:

    ./next

to continue to Lesson 8.

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
