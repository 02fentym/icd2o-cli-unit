#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Start the Log Analyzer Project with a clean course directory,
# but keep the current log_analyzer_project1.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "log_analyzer_project1.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/log_analyzer_project1.sh" > "$HOME/cli-course/log_analyzer_project1.sh"
bash "$HOME/cli-course/log_analyzer_project1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/log_analyzer_project2.sh" > "$HOME/cli-course/log_analyzer_project2.sh"
bash "$HOME/cli-course/log_analyzer_project2.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/server.log" <<'DATA'
2026-08-17 08:00:01 INFO Server started
2026-08-17 08:02:14 INFO User Alex logged in
2026-08-17 08:05:33 WARNING Memory usage high
2026-08-17 08:07:45 ERROR Database connection failed
2026-08-17 08:10:02 INFO Database connection restored
2026-08-17 08:14:19 INFO User Morgan logged in
2026-08-17 08:20:51 ERROR File not found
2026-08-17 08:24:03 WARNING Disk space low
2026-08-17 08:31:27 INFO Backup started
2026-08-17 08:35:44 ERROR Backup failed
2026-08-17 08:40:12 INFO User Alex logged out
2026-08-17 08:45:00 INFO Server running normally
DATA

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LOG ANALYZER PROJECT 1 — PROJECT OVERVIEW
============================================================

You've reached the final project!

System administrators and developers often work with:

    log files

Log files record events that happen while a program or
computer system is running.

For this project, you'll investigate:

    server.log

------------------------------------------------------------
TAKE A LOOK
------------------------------------------------------------

Type:

    ls

You should see:

    server.log

Now display the entire file:

    cat server.log

------------------------------------------------------------
UNDERSTANDING THE LOG
------------------------------------------------------------

Each line contains:

    a date and time
    a severity level
    a message

There are three severity levels:

    INFO
    WARNING
    ERROR

INFO means something normal happened.

WARNING means something may need attention.

ERROR means something went wrong.

------------------------------------------------------------
YOUR MISSION
------------------------------------------------------------

Over the next few parts, you will:

1. Inspect the log
2. Find errors
3. Count errors
4. Generate a report

You'll use commands you've already learned, including:

    cat
    head
    grep
    wc
    echo
    >
    >>
    |

------------------------------------------------------------
IMPORTANT
------------------------------------------------------------

This project continues across several parts.

Your server.log file and project work will stay in place
as you continue.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Log Analyzer Project 2.

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
