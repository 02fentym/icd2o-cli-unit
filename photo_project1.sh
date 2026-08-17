#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Start the Organize Photos Project with a clean course directory,
# but keep the current photo_project1.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "photo_project1.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/photo_project1.sh" > "$HOME/cli-course/photo_project1.sh"
bash "$HOME/cli-course/photo_project1.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/photo_project2.sh" > "$HOME/cli-course/photo_project2.sh"
bash "$HOME/cli-course/photo_project2.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

# Create the messy collection of files for the project.
printf 'Beach photo.\n' > "$COURSE_DIR/beach.jpg"
printf 'Birthday photo.\n' > "$COURSE_DIR/birthday.jpg"
printf 'Family photo.\n' > "$COURSE_DIR/family.jpg"
printf 'Concert photo.\n' > "$COURSE_DIR/concert.jpg"
printf 'Soccer photo.\n' > "$COURSE_DIR/soccer.jpg"
printf 'Hiking photo.\n' > "$COURSE_DIR/hiking.jpg"
printf 'Remember to organize these photos.\n' > "$COURSE_DIR/todo.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
ORGANIZE PHOTOS PROJECT 1 — PROJECT OVERVIEW
============================================================

You've learned how to work with files and directories.

Now you'll put those skills together in a small project.

Your photo collection is a mess.

Type:

    ls

You should see these files:

    beach.jpg
    birthday.jpg
    concert.jpg
    family.jpg
    hiking.jpg
    soccer.jpg
    todo.txt

Your job is to organize the photos into directories.

------------------------------------------------------------
THE PLAN
------------------------------------------------------------

You will create three directories:

    family
    school
    activities

Then you'll organize the photos like this:

    family
        birthday.jpg
        family.jpg

    school
        concert.jpg

    activities
        beach.jpg
        hiking.jpg
        soccer.jpg

Finally, you'll remove:

    todo.txt

------------------------------------------------------------
IMPORTANT
------------------------------------------------------------

This project continues across several parts.

Your files and directories will stay in place as you move
through the project.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to begin creating the directory structure.

At any time, type:

    ./lesson

to clear the screen and show these instructions again.

If you want to restart the ENTIRE project from the beginning,
type:

    ./resetlesson

============================================================
LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
