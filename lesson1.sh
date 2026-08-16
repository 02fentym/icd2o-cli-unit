#!/bin/bash

# ---------- Course helper setup ----------
COURSE_DIR="$HOME/.cli-course"
BIN_DIR="/usr/local/bin"

mkdir -p "$COURSE_DIR"

cat > "$BIN_DIR/lesson" <<'HELPER'
#!/bin/bash
clear
cat "$HOME/.cli-course/lesson.txt"
HELPER

cat > "$BIN_DIR/resetlesson" <<'HELPER'
#!/bin/bash
lesson_num="$(cat "$HOME/.cli-course/current_lesson" 2>/dev/null)"
if [ -z "$lesson_num" ]; then
    echo "No lesson is currently loaded."
    exit 1
fi

curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson${lesson_num}.sh" | bash
HELPER

cat > "$BIN_DIR/next" <<'HELPER'
#!/bin/bash
lesson_num="$(cat "$HOME/.cli-course/current_lesson" 2>/dev/null)"
if [ -z "$lesson_num" ]; then
    echo "No lesson is currently loaded."
    exit 1
fi

next_num=$((lesson_num + 1))
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson${next_num}.sh" | bash
HELPER

chmod +x "$BIN_DIR/lesson" "$BIN_DIR/resetlesson" "$BIN_DIR/next"

printf '1\n' > "$COURSE_DIR/current_lesson"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 1 — WHAT IS THE TERMINAL?
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

    next

to continue to Lesson 2.

At any time, type:

    lesson

to clear the screen and show these instructions again.

If you need to reload this lesson, type:

    resetlesson
============================================================
LESSON

clear
cat "$COURSE_DIR/lesson.txt"
