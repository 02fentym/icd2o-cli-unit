#!/bin/bash
COURSE_DIR="$HOME/cli-course"
WORKSPACE_DIR="$COURSE_DIR/workspace"
mkdir -p "$COURSE_DIR" "$WORKSPACE_DIR"

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
cat "$HOME/cli-course/lesson.txt"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
lesson_num="$(cat "$HOME/cli-course/current_lesson" 2>/dev/null)"
if [ -z "$lesson_num" ]; then
    echo "No lesson is currently loaded."
    exit 1
fi
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson${lesson_num}.sh" | bash
HELPER


cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash

printf '\033[H\033[2J\033[3J\n'

curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/test1.sh" > "$HOME/cli-course/test1.sh"

chmod +x "$HOME/cli-course/test1.sh"

"$HOME/cli-course/test1.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"
printf '3\n' > "$COURSE_DIR/current_lesson"

rm -rf "$WORKSPACE_DIR"
mkdir -p "$WORKSPACE_DIR"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 3 — COMMENTS
============================================================

Not everything you type needs to be a command.

Sometimes you want to leave a note for yourself or for
another person reading a shell script.

These notes are called COMMENTS.

In Bash, a comment begins with:

    #

Anything after the # on that line is ignored by the shell.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    # This is a comment

Then press Enter.

Nothing happens.

That's because the shell ignores the comment.

Now type:

    echo "Hello!"

You should see:

    Hello!

------------------------------------------------------------
COMMENTS CAN EXPLAIN COMMANDS
------------------------------------------------------------

For example:

    # Display a greeting
    echo "Welcome!"

The first line is for a human reader.

The second line is a command the shell actually runs.

You can also place a comment after a command:

    echo "Welcome!" # Display a greeting

The command still runs.

The comment is ignored.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Type a comment:

    # I am learning the CLI

Then use echo to display:

    Comments are useful!

------------------------------------------------------------
INTRODUCTION COMPLETE
------------------------------------------------------------

You've finished Lessons 1–3.

Before moving on, you'll complete a short test covering:

    What the terminal is
    echo
    commands and arguments
    comments

Type:

    ./next

to begin the test.

At any time:

    ./lesson
    ./resetlesson

============================================================
LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
