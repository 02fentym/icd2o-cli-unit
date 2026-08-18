#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Continue the Log Analyzer Project.
# Keep the student's project files and remove only
# the previous project script.
rm -f "$COURSE_DIR/log_analyzer_project2.sh"

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
cat "$HOME/cli-course/lesson.txt"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/log_analyzer_project1.sh" > "$HOME/cli-course/log_analyzer_project1.sh"
bash "$HOME/cli-course/log_analyzer_project1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/log_analyzer_project4.sh" > "$HOME/cli-course/log_analyzer_project4.sh"
bash "$HOME/cli-course/log_analyzer_project4.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LOG ANALYZER PROJECT 3 — FILTERING ERRORS
============================================================

The log contains:

    INFO
    WARNING
    ERROR

You're investigating problems with the server.

That means the most important entries right now are:

    ERROR

------------------------------------------------------------
YOUR TASK
------------------------------------------------------------

Display ONLY the lines in:

    server.log

that contain:

    ERROR

Use the command you've learned for searching file contents.

------------------------------------------------------------
CHECK YOUR RESULT
------------------------------------------------------------

You should find three errors:

    ERROR Database connection failed
    ERROR File not found
    ERROR Backup failed

Each line will also include its date and time.

------------------------------------------------------------
WHY THIS IS USEFUL
------------------------------------------------------------

Imagine server.log contained:

    10,000 lines

Reading the entire file would be difficult.

Filtering lets you quickly find only the information you
care about.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

After finding the errors, try displaying only the lines
containing:

    WARNING

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Log Analyzer Project 4.

At any time, type:

    ./lesson

to clear the screen and show these instructions again.

To restart the ENTIRE project from the beginning, type:

    ./resetlesson

============================================================
LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
