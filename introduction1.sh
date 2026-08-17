#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Start the Introduction section with a completely clean
# course directory, but keep the current introduction1.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "introduction1.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/introduction1.sh" > "$HOME/cli-course/introduction1.sh"
bash "$HOME/cli-course/introduction1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/introduction2.sh" > "$HOME/cli-course/introduction2.sh"
bash "$HOME/cli-course/introduction2.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
INTRODUCTION 1 — WHAT IS THE TERMINAL?
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

to continue to Introduction 2.

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
