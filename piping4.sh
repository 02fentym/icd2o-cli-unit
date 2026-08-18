#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Piping lesson,
# but keep the current piping4.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "piping4.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping4.sh" > "$HOME/cli-course/piping4.sh"
bash "$HOME/cli-course/piping4.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping5.sh" > "$HOME/cli-course/piping5.sh"
bash "$HOME/cli-course/piping5.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/access.log" <<'DATA'
GET /index.html 200
GET /about.html 200
POST /login 500
GET /images/logo.png 200
GET /profile 404
POST /checkout 500
GET /contact 200
POST /api/data 500
DATA

touch "$COURSE_DIR/report.txt"
touch "$COURSE_DIR/notes.txt"
touch "$COURSE_DIR/photo.jpg"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
PIPING 4 — PIPE WITH GREP
============================================================

grep can search inside a file.

But grep can also filter the OUTPUT of another command.

------------------------------------------------------------
FILTER COMMAND OUTPUT
------------------------------------------------------------

Try:

    ls

Now type:

    ls | grep ".txt"

The first command:

    ls

produces a list.

Then:

    grep ".txt"

keeps only lines containing:

    .txt

------------------------------------------------------------
FILTER A LOG FILE
------------------------------------------------------------

Now look at:

    cat access.log

Some lines contain:

    500

Use:

    cat access.log | grep "500"

You should see only the requests with a 500 status.

------------------------------------------------------------
FILTER AND COUNT
------------------------------------------------------------

Now add another command:

    cat access.log | grep "500" | wc -l

This:

1. reads the log
2. keeps only lines containing 500
3. counts those lines

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use ONE pipeline to count how many lines in:

    access.log

contain:

    200

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Piping 5.

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
