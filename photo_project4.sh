#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Continue the final part of the Organize Photos Project.
# Keep the student's organized photo directories and files,
# and remove only the previous project script.
rm -f "$COURSE_DIR/photo_project3.sh"

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
cat "$HOME/cli-course/lesson.txt"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/photo_project1.sh" > "$HOME/cli-course/photo_project1.sh"
bash "$HOME/cli-course/photo_project1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns1.sh" > "$HOME/cli-course/wildcards_and_patterns1.sh"
bash "$HOME/cli-course/wildcards_and_patterns1.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
ORGANIZE PHOTOS PROJECT 4 — CLEANING UP
============================================================

Your photos should now be organized.

There's just one unnecessary file left:

    todo.txt

You don't need it anymore.

------------------------------------------------------------
YOUR TASK
------------------------------------------------------------

Delete:

    todo.txt

using the command you've already learned.

Then type:

    ls

------------------------------------------------------------
FINAL CHECK
------------------------------------------------------------

Your main directory should now contain:

    activities
    family
    school

You can check each directory:

    ls family
    ls school
    ls activities

Your finished structure should look like this:

    family
        birthday.jpg
        family.jpg

    school
        concert.jpg

    activities
        beach.jpg
        hiking.jpg
        soccer.jpg

And:

    todo.txt

should be gone.

------------------------------------------------------------
PROJECT COMPLETE
------------------------------------------------------------

You used several commands together to organize a messy
collection of files:

    ls
    mkdir
    mv
    rm

That's exactly what working in the command line often looks
like: combining simple commands to complete a larger task.

Type:

    ./next

to continue to the next section.

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
