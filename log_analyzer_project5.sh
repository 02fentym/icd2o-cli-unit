#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Continue the final part of the Log Analyzer Project.
# Keep the student's project files and remove only
# the previous project script.
rm -f "$COURSE_DIR/log_analyzer_project4.sh"

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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/congratulations.sh" > "$HOME/cli-course/congratulations.sh"
bash "$HOME/cli-course/congratulations.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LOG ANALYZER PROJECT 5 — GENERATING A REPORT
============================================================

You've inspected, filtered, and counted the log.

Now you'll create a report that someone else could read.

Your finished report will be:

    report.txt

------------------------------------------------------------
STEP 1 — CREATE THE REPORT
------------------------------------------------------------

Use echo and > to create report.txt with this heading:

    === Log Analysis Report ===

Remember:

    >

creates or overwrites a file.

------------------------------------------------------------
STEP 2 — ADD THE ERROR COUNT
------------------------------------------------------------

Append this line:

    Total errors found:

using echo and >>.

Then use a pipeline to count the ERROR entries and append
the result to report.txt.

Your report should now begin like this:

    === Log Analysis Report ===
    Total errors found:
    3

------------------------------------------------------------
STEP 3 — ADD A DETAILS HEADING
------------------------------------------------------------

Append:

    === Error Details ===

to report.txt.

------------------------------------------------------------
STEP 4 — ADD THE ERRORS
------------------------------------------------------------

Use grep to find every ERROR line in:

    server.log

Redirect those results so they are APPENDED to:

    report.txt

------------------------------------------------------------
STEP 5 — VIEW THE REPORT
------------------------------------------------------------

Display:

    report.txt

Your finished report should look like:

    === Log Analysis Report ===
    Total errors found:
    3
    === Error Details ===
    2026-08-17 08:07:45 ERROR Database connection failed
    2026-08-17 08:20:51 ERROR File not found
    2026-08-17 08:35:44 ERROR Backup failed

------------------------------------------------------------
PROJECT COMPLETE
------------------------------------------------------------

You just used the terminal to analyze real-looking data.

You:

    viewed a log file
    filtered important information
    built a pipeline
    counted results
    redirected output
    generated a report

These simple commands become much more powerful when you
combine them.

------------------------------------------------------------
FINISH THE COURSE
------------------------------------------------------------

Once your report is complete, type:

    ./next

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
