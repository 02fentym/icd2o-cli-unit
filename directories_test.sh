#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Continue the Organize Photos Project.
# Keep the student's project files and directories from Part 1,
# and remove only the previous project script.
rm -f "$COURSE_DIR/photo_project1.sh"

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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/photo_project3.sh" > "$HOME/cli-course/photo_project3.sh"
bash "$HOME/cli-course/photo_project3.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
ORGANIZE PHOTOS PROJECT 2 — CREATING THE STRUCTURE
============================================================

The first step is to create a place for each group of photos.

You need three directories:

    family
    school
    activities

------------------------------------------------------------
YOUR TASK
------------------------------------------------------------

Use:

    mkdir

to create all three directories.

When you're finished, type:

    ls

You should see:

    activities
    family
    school

along with the photo files.

------------------------------------------------------------
CHECK INSIDE
------------------------------------------------------------

The directories should be empty right now.

You can check one with:

    ls family

Nothing should appear yet.

That's okay.

You'll move the photos in the next part.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Once you've created:

    family
    school
    activities

type:

    ./next

to continue.

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
