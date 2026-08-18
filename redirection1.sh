#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous section,
# but keep the current redirection1.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "redirection1.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection1.sh" > "$HOME/cli-course/redirection1.sh"
bash "$HOME/cli-course/redirection1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection2.sh" > "$HOME/cli-course/redirection2.sh"
bash "$HOME/cli-course/redirection2.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
REDIRECTION 1 — STANDARD OUTPUT
============================================================

When a command produces normal results, those results are
called:

    standard output

You may also see it written as:

    stdout

By default, standard output appears on your screen.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    echo "Hello!"

You should see:

    Hello!

The echo command sent:

    Hello!

to standard output.

------------------------------------------------------------
ANOTHER EXAMPLE
------------------------------------------------------------

Type:

    ls

The list of files you see is also standard output.

The command produced information, and the terminal displayed
that information on your screen.

------------------------------------------------------------
WHY DOES THIS MATTER?
------------------------------------------------------------

Normally:

    command
       |
       v
    screen

But the shell can REDIRECT that output somewhere else.

For example, instead of displaying output on the screen,
you can send it into a file.

You'll do that in the next lesson.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use echo to display:

    Terminal streams are powerful

Remember:

    normal command results = standard output

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Redirection 2.

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
