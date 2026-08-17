#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue
    if [ "$(basename "$item")" != "lesson15.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson15.sh" > "$HOME/cli-course/lesson15.sh"
bash "$HOME/cli-course/lesson15.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/test3.sh" > "$HOME/cli-course/test3.sh"
bash "$HOME/cli-course/test3.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

printf 'Welcome to the file operations challenge!\n' > "$COURSE_DIR/message.txt"
printf 'This file should be removed.\n' > "$COURSE_DIR/remove-me.txt" 

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 15 — RECAP: FILE OPERATIONS
============================================================

You've learned the core commands for working with files:

    touch    create a file
    cat      read a file
    cp       copy a file
    mv       move or rename a file
    rm       delete a file

------------------------------------------------------------
CHALLENGE
------------------------------------------------------------

Complete these tasks:

1. Create:

       practice.txt

2. Read:

       message.txt

3. Copy message.txt to:

       message-copy.txt

4. Rename practice.txt to:

       finished.txt

5. Delete:

       remove-me.txt

------------------------------------------------------------
CHECK YOUR WORK
------------------------------------------------------------

Use:

    ls

You should see:

    finished.txt
    message.txt
    message-copy.txt

You should NOT see:

    practice.txt
    remove-me.txt

------------------------------------------------------------
FILES COMPLETE
------------------------------------------------------------

Next, you'll complete a short test on Lessons 10–15.

Type:

    ./next

to begin the Files Test.

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
