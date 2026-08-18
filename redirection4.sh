#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Redirection lesson,
# but keep the current redirection4.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "redirection4.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection4.sh" > "$HOME/cli-course/redirection4.sh"
bash "$HOME/cli-course/redirection4.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection5.sh" > "$HOME/cli-course/redirection5.sh"
bash "$HOME/cli-course/redirection5.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/names.txt" <<'DATA'
Taylor
Alex
Morgan
Jordan
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
REDIRECTION 4 — STANDARD INPUT
============================================================

Commands can receive information too.

This is called:

    standard input

You may also see it written as:

    stdin

The symbol:

    <

redirects a file into a command as input.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

First read:

    cat names.txt

Now type:

    sort < names.txt

You should see the names in alphabetical order.

------------------------------------------------------------
WHAT HAPPENED?
------------------------------------------------------------

This command:

    sort < names.txt

means:

    take the contents of names.txt
    and give them to sort as input

Think of it like:

    names.txt
        |
        v
      sort
        |
        v
      screen

------------------------------------------------------------
ANOTHER EXAMPLE
------------------------------------------------------------

Try:

    wc -l < names.txt

This counts the lines from the input.

Notice that the result is just a number.

------------------------------------------------------------
COMPARE
------------------------------------------------------------

You've now seen:

    >     send output TO a file
    <     take input FROM a file

The direction of the symbol can help you remember.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use input redirection to send:

    names.txt

into:

    sort

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Redirection 5.

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
