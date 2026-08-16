#!/bin/bash

COURSE_DIR="$HOME/cli-course"
WORKSPACE_DIR="$COURSE_DIR/workspace"

mkdir -p "$COURSE_DIR" "$WORKSPACE_DIR"

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
clear
cat "$HOME/cli-course/lesson.txt"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[2J\033[H'
lesson_num="$(cat "$HOME/cli-course/current_lesson" 2>/dev/null)"

if [ -z "$lesson_num" ]; then
    echo "No lesson is currently loaded."
    exit 1
fi

curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson${lesson_num}.sh" | bash
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash

lesson_num="$(cat "$HOME/cli-course/current_lesson" 2>/dev/null)"

if [ -z "$lesson_num" ]; then
    echo "No lesson is currently loaded."
    exit 1
fi

next_num=$((lesson_num + 1))

printf '\033[2J\033[H'

curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson${next_num}.sh" | bash
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

printf '2\n' > "$COURSE_DIR/current_lesson"

rm -rf "$WORKSPACE_DIR"
mkdir -p "$WORKSPACE_DIR"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 2 — YOUR FIRST COMMAND
============================================================

In the last lesson, you used:

    echo "Hello World!"

Let's look more closely at what that command means.

The first part is the COMMAND:

    echo

The command tells the computer what to do.

The second part is an ARGUMENT:

    "Hello World!"

The argument gives the command some extra information.

So:

    echo "Hello World!"

means:

    echo               display something
    "Hello World!"     the thing to display

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    echo "Hello World!"

Now try changing the argument:

    echo "I am learning the command line!"

Try your own message too.

------------------------------------------------------------
CASE MATTERS
------------------------------------------------------------

Try these two commands:

    echo "Hello World!"

    echo "hello world!"

The terminal prints exactly what you give it.

Capital and lowercase letters are different characters.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use echo to print:

    CLI is awesome!

Think about the pattern:

    command "argument"

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Lesson 3.

At any time, type:

    ./lesson

to clear the screen and show these instructions again.

If you need to restart this lesson, type:

    ./resetlesson

============================================================

LESSON

cd "$COURSE_DIR"
printf '\033[2J\033[H'
cat "$COURSE_DIR/lesson.txt"
