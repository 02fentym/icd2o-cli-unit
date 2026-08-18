#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Continue the Log Analyzer Project.
# Keep the student's project files and remove only
# the previous project script.
rm -f "$COURSE_DIR/log_analyzer_project1.sh"

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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/log_analyzer_project3.sh" > "$HOME/cli-course/log_analyzer_project3.sh"
bash "$HOME/cli-course/log_analyzer_project3.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LOG ANALYZER PROJECT 2 — VIEWING THE LOG FILE
============================================================

Your server.log file contains many events.

You could display everything with:

    cat server.log

But sometimes you only want a quick look at part of a file.

------------------------------------------------------------
YOUR TASK
------------------------------------------------------------

Display the first 5 lines of:

    server.log

You've already learned the command you need:

    head

Remember that:

    -n

lets you choose the number of lines.

------------------------------------------------------------
CHECK YOUR RESULT
------------------------------------------------------------

Your output should begin with:

    2026-08-17 08:00:01 INFO Server started

and show exactly 5 log entries.

------------------------------------------------------------
INVESTIGATE SOME MORE
------------------------------------------------------------

Now display the last 3 lines of:

    server.log

Use the command you've learned for viewing the end of a file.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Log Analyzer Project 3.

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
