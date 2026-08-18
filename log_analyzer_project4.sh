#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Continue the Log Analyzer Project.
# Keep the student's project files and remove only
# the previous project script.
rm -f "$COURSE_DIR/log_analyzer_project3.sh"

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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/log_analyzer_project5.sh" > "$HOME/cli-course/log_analyzer_project5.sh"
bash "$HOME/cli-course/log_analyzer_project5.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LOG ANALYZER PROJECT 4 — COUNTING OCCURRENCES
============================================================

You've found the ERROR entries.

Now imagine your manager asks:

    "How many errors occurred?"

You could count them manually.

But the terminal can do it for you.

------------------------------------------------------------
YOUR TASK
------------------------------------------------------------

Build a pipeline that:

1. Reads server.log
2. Keeps only lines containing ERROR
3. Counts those lines

Use:

    cat
    grep
    wc -l

Connect the commands using:

    |

------------------------------------------------------------
CHECK YOUR RESULT
------------------------------------------------------------

Your final result should be:

    3

There are three ERROR entries in the log.

------------------------------------------------------------
ANOTHER QUESTION
------------------------------------------------------------

How many WARNING entries are there?

Build another pipeline that:

1. Reads server.log
2. Keeps WARNING lines
3. Counts them

------------------------------------------------------------
THINK LIKE AN ANALYST
------------------------------------------------------------

Your pipeline takes a large amount of data and reduces it
to one useful answer.

Think of the flow:

    server.log
        |
        v
    keep ERROR lines
        |
        v
    count the lines
        |
        v
        3

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to the final part of the project.

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
