#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous lesson,
# but keep the current Lesson 3 script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "lesson3.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson3.sh" > "$HOME/cli-course/lesson3.sh"
bash "$HOME/cli-course/lesson3.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/test1.sh" > "$HOME/cli-course/test1.sh"
bash "$HOME/cli-course/test1.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 3 — COMMENTS
============================================================

Not everything you type in the terminal has to be a command.

Sometimes you want to write a note that the computer will
ignore.

These notes are called COMMENTS.

In Bash, a comment begins with:

    #

Anything after the # is ignored by the shell.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    # This is a comment

Then press Enter.

Nothing happens.

That's because the shell ignores comments.

Now type:

    echo "Hello!"

You should see:

    Hello!

------------------------------------------------------------
WHY USE COMMENTS?
------------------------------------------------------------

Comments can explain what a command does.

For example:

    # Display a greeting
    echo "Welcome!"

The first line is a comment.

The second line is a command.

The comment is for the person reading the code.
The command is for the computer.

------------------------------------------------------------
COMMENTS AFTER COMMANDS
------------------------------------------------------------

A comment can also appear after a command.

Try:

    echo "Welcome!" # Display a greeting

You should still see:

    Welcome!

The command runs normally.

Everything after the # is ignored.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Type this comment:

    # I am learning the CLI

Then use echo to display:

    Comments are useful!

------------------------------------------------------------
INTRODUCTION COMPLETE
------------------------------------------------------------

You've finished the Introduction section.

You learned about:

    the terminal
    commands
    arguments
    echo
    comments

Next, you'll complete a short test on Lessons 1–3.

Type:

    ./next

to begin the Introduction Test.

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
