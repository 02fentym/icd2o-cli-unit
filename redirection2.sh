#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Redirection lesson,
# but keep the current redirection2.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "redirection2.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection2.sh" > "$HOME/cli-course/redirection2.sh"
bash "$HOME/cli-course/redirection2.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection3.sh" > "$HOME/cli-course/redirection3.sh"
bash "$HOME/cli-course/redirection3.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
REDIRECTION 2 — OVERWRITE TO A FILE
============================================================

Normally, command output appears on your screen.

The symbol:

    >

redirects standard output into a file.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    echo "Hello!" > message.txt

Notice that:

    Hello!

does NOT appear on the screen.

Instead, the output was sent into:

    message.txt

Check it:

    cat message.txt

You should see:

    Hello!

------------------------------------------------------------
IMPORTANT: > OVERWRITES
------------------------------------------------------------

The > symbol replaces the contents of the file.

Try:

    echo "First message" > notes.txt

Then:

    cat notes.txt

Now type:

    echo "Second message" > notes.txt

Then:

    cat notes.txt

You should only see:

    Second message

The first message was overwritten.

------------------------------------------------------------
CREATE FILES WITH REDIRECTION
------------------------------------------------------------

If the file doesn't exist yet, > creates it.

For example:

    echo "My first log" > log.txt

Then:

    ls

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Create a file named:

    greeting.txt

containing:

    Welcome to the CLI

using echo and >.

Then use cat to check it.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Redirection 3.

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
