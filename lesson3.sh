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
lesson_num="$(cat "$HOME/cli-course/current_lesson" 2>/dev/null)"
if [ -z "$lesson_num" ]; then
    echo "No lesson is currently loaded."
    exit 1
fi
next_num=$((lesson_num + 1))
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson${next_num}.sh" | bash
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"
printf '3\n' > "$COURSE_DIR/current_lesson"

rm -rf "$WORKSPACE_DIR"
mkdir -p "$WORKSPACE_DIR"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 3 — COMMENTS
============================================================

Not everything you type into a shell script has to be a
command.

Sometimes you want to leave a note for yourself or for another
person reading the script.

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

Imagine you saw this:

    # Display a greeting
    echo "Welcome!"

The first line explains the code.

The second line is the command the shell actually runs.

You can also place a comment after a command:

    echo "Welcome!" # Display a greeting

The command runs, but the comment is ignored.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Type a comment:

    # I am learning the CLI

Then use echo to display:

    Comments are useful!

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Lesson 4.

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
