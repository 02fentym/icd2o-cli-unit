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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson${next_num}.sh" | bash
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

printf '1\n' > "$COURSE_DIR/current_lesson"

rm -rf "$WORKSPACE_DIR"
mkdir -p "$WORKSPACE_DIR"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 1 — WHAT IS THE TERMINAL???
============================================================

Most of the time, you control a computer by clicking things:
icons, buttons, menus, and folders.

The terminal gives you another way.

Instead of clicking, you TYPE instructions called commands.

For example, the command:

    echo "Hello World!"

asks the terminal to display the words:

    Hello World!

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type this command exactly:

    echo "Hello World!"

Then press Enter.

You should see:

    Hello World!

That's it!

You just gave your computer a command using the terminal.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Lesson 2.

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
