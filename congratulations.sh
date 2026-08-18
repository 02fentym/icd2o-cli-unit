#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Finish the course while preserving the student's
# final server.log and report.txt files.
rm -f "$COURSE_DIR/log_analyzer_project5.sh"
rm -f "$COURSE_DIR/lesson"
rm -f "$COURSE_DIR/resetlesson"
rm -f "$COURSE_DIR/next"
rm -f "$COURSE_DIR/lesson.txt"

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
cat "$HOME/cli-course/lesson.txt"
HELPER

chmod +x "$COURSE_DIR/lesson"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
                     CONGRATULATIONS!
============================================================

You completed the CLI course!

You started with your very first command:

    echo "Hello World!"

And you can now use the terminal to navigate a filesystem,
work with files and directories, search through data, and
combine commands together.

------------------------------------------------------------
WHAT YOU LEARNED
------------------------------------------------------------

INTRODUCTION

    echo
    comments

NAVIGATION

    pwd
    ls
    cd
    paths
    .
    ..
    ~
    /

FILES

    touch
    cat
    cp
    mv
    rm

DIRECTORIES

    mkdir
    cp -r
    rmdir
    rm -r

WILDCARDS AND PATTERNS

    *
    ?
    [ ]

FILE CONTENT

    head
    tail
    wc
    sort
    uniq
    grep

REDIRECTION

    >
    >>
    <
    2>
    2>>

PIPING

    |

------------------------------------------------------------
YOU ALSO COMPLETED TWO PROJECTS
------------------------------------------------------------

    Organize Photos Project

    Log Analyzer Project

In the final project, you combined several commands to turn
a server log into useful information and generate a report.

------------------------------------------------------------
YOUR FINAL FILES
------------------------------------------------------------

Your Log Analyzer files have been preserved.

Type:

    ls

You should still see:

    server.log
    report.txt

To view your final report:

    cat report.txt

------------------------------------------------------------
COURSE COMPLETE
------------------------------------------------------------

You now know the fundamentals of working from the command
line.

Keep experimenting.

Keep building.

And don't be afraid of the terminal.

============================================================
                     COURSE COMPLETE
============================================================

At any time, type:

    ./lesson

to clear the screen and show this message again.

============================================================
LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
