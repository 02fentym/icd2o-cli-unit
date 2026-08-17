#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue
    if [ "$(basename "$item")" != "lesson10.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson10.sh" > "$HOME/cli-course/lesson10.sh"
bash "$HOME/cli-course/lesson10.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson11.sh" > "$HOME/cli-course/lesson11.sh"
bash "$HOME/cli-course/lesson11.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"



cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 10 — CREATE A FILE
============================================================

So far, you've learned how to move around the filesystem.

Now you'll start working with FILES.

The first command is:

    touch

touch can create a new, empty file.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    touch practice.txt

Now list the files:

    ls

You should see:

    practice.txt

You just created a file.

------------------------------------------------------------
CREATE ANOTHER FILE
------------------------------------------------------------

Try:

    touch notes.txt

Then:

    ls

You should now see both files.

------------------------------------------------------------
FILE NAMES
------------------------------------------------------------

A file name can include a file extension such as:

    .txt
    .py
    .java

The extension often helps describe what kind of file it is.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Create a file named:

    hello.txt

Then use:

    ls

to make sure it exists.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Lesson 11.

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
