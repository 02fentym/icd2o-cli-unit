#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Redirection lesson,
# but keep the current redirection5.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "redirection5.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection5.sh" > "$HOME/cli-course/redirection5.sh"
bash "$HOME/cli-course/redirection5.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection6.sh" > "$HOME/cli-course/redirection6.sh"
bash "$HOME/cli-course/redirection6.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
REDIRECTION 5 — STANDARD ERROR
============================================================

Commands don't only produce normal output.

Sometimes something goes wrong.

Error messages are sent through:

    standard error

You may also see it written as:

    stderr

------------------------------------------------------------
CREATE AN ERROR
------------------------------------------------------------

Type:

    ls missing-folder

The folder doesn't exist, so you should see an error.

That message is standard error.

------------------------------------------------------------
REDIRECT AN ERROR
------------------------------------------------------------

To redirect standard error, use:

    2>

Try:

    ls missing-folder 2> errors.txt

This time, the error should NOT appear on the screen.

Instead, read:

    cat errors.txt

The error message was saved there.

------------------------------------------------------------
WHY THE 2?
------------------------------------------------------------

The shell uses numbers for its standard streams:

    0    standard input
    1    standard output
    2    standard error

For now, the important one to remember is:

    2>    redirect errors

------------------------------------------------------------
APPEND ERRORS
------------------------------------------------------------

You can also use:

    2>>

to append errors instead of overwriting the file.

Try:

    ls another-missing-folder 2>> errors.txt

Then:

    cat errors.txt

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Try to list:

    does-not-exist

and redirect the error into:

    errors.txt

using:

    2>>

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Redirection 6.

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
