#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Introduction lesson,
# but keep the current introduction2.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "introduction2.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/introduction2.sh" > "$HOME/cli-course/introduction2.sh"
bash "$HOME/cli-course/introduction2.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/introduction3.sh" > "$HOME/cli-course/introduction3.sh"
bash "$HOME/cli-course/introduction3.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
INTRODUCTION 2 — YOUR FIRST COMMAND
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

to continue to Introduction 3.

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
