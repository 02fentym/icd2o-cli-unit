#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue
    if [ "$(basename "$item")" != "lesson11.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson11.sh" > "$HOME/cli-course/lesson11.sh"
bash "$HOME/cli-course/lesson11.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson12.sh" > "$HOME/cli-course/lesson12.sh"
bash "$HOME/cli-course/lesson12.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

printf 'Welcome to the Files section!\n' > "$COURSE_DIR/message.txt"
printf 'Small commands can do powerful things.\n' > "$COURSE_DIR/quote.txt" 

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 11 — READ A FILE
============================================================

In the last lesson, you created files with:

    touch

Now let's read what's inside a file.

Use:

    cat

cat displays the contents of a file.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    cat message.txt

You should see:

    Welcome to the Files section!

------------------------------------------------------------
READ ANOTHER FILE
------------------------------------------------------------

Type:

    cat quote.txt

Read what appears.

------------------------------------------------------------
WHAT IF THE FILE IS EMPTY?
------------------------------------------------------------

Create an empty file:

    touch empty.txt

Now type:

    cat empty.txt

Nothing is displayed because the file is empty.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use cat to read:

    message.txt
    quote.txt

Remember:

    touch    create a file
    cat      read a file

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Lesson 12.

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
