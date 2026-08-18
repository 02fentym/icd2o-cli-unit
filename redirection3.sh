#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Redirection lesson,
# but keep the current redirection3.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "redirection3.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection3.sh" > "$HOME/cli-course/redirection3.sh"
bash "$HOME/cli-course/redirection3.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection4.sh" > "$HOME/cli-course/redirection4.sh"
bash "$HOME/cli-course/redirection4.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

printf 'Session started\n' > "$COURSE_DIR/activity.log"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
REDIRECTION 3 — APPEND TO A FILE
============================================================

You've learned:

    >

which sends output into a file.

But > OVERWRITES the file.

What if you want to ADD something to the end instead?

Use:

    >>

This is called:

    append

------------------------------------------------------------
TRY IT
------------------------------------------------------------

First read:

    cat activity.log

You should see:

    Session started

Now type:

    echo "User logged in" >> activity.log

Then:

    cat activity.log

You should now see:

    Session started
    User logged in

The original line stayed in the file.

------------------------------------------------------------
ADD ANOTHER LINE
------------------------------------------------------------

Type:

    echo "Task completed" >> activity.log

Then:

    cat activity.log

Now the file should contain three lines.

------------------------------------------------------------
COMPARE
------------------------------------------------------------

Remember:

    >     overwrite the file
    >>    append to the file

That's an important difference.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Append:

    Session ended

to:

    activity.log

Then use cat to check the complete file.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Redirection 4.

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
