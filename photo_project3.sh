#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Continue the Organize Photos Project.
# Keep the student's project work from the previous parts,
# and remove only the previous project script.
rm -f "$COURSE_DIR/photo_project2.sh"

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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/photo_project4.sh" > "$HOME/cli-course/photo_project4.sh"
bash "$HOME/cli-course/photo_project4.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
ORGANIZE PHOTOS PROJECT 3 — MOVING THE FILES
============================================================

Now it's time to organize the photos.

Use:

    mv

to move each photo into the correct directory.

------------------------------------------------------------
FAMILY
------------------------------------------------------------

Move these files into:

    family

Files:

    birthday.jpg
    family.jpg

------------------------------------------------------------
SCHOOL
------------------------------------------------------------

Move:

    concert.jpg

into:

    school

------------------------------------------------------------
ACTIVITIES
------------------------------------------------------------

Move these files into:

    activities

Files:

    beach.jpg
    hiking.jpg
    soccer.jpg

------------------------------------------------------------
CHECK YOUR WORK
------------------------------------------------------------

When you're finished, try:

    ls family
    ls school
    ls activities

You should see:

family:

    birthday.jpg
    family.jpg

school:

    concert.jpg

activities:

    beach.jpg
    hiking.jpg
    soccer.jpg

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Once all six photos are organized, type:

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
