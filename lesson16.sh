#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous lesson,
# but keep the current Lesson 16 script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "lesson16.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson16.sh" > "$HOME/cli-course/lesson16.sh"
bash "$HOME/cli-course/lesson16.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson17.sh" > "$HOME/cli-course/lesson17.sh"
bash "$HOME/cli-course/lesson17.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"



cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 16 — CREATE A DIRECTORY
============================================================

You've already worked with files.

Now let's create a DIRECTORY.

A directory is another word for a folder.

Use:

    mkdir

mkdir stands for:

    make directory

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    mkdir projects

Now list what is here:

    ls

You should see:

    projects

You just created a directory.

------------------------------------------------------------
CREATE ANOTHER DIRECTORY
------------------------------------------------------------

Try:

    mkdir photos

Then:

    ls

You should now see both:

    projects
    photos

------------------------------------------------------------
NESTED DIRECTORIES
------------------------------------------------------------

You can create directories inside other directories.

Use:

    mkdir -p school/computer-science

The -p option creates any missing directories in the path.

Now try:

    ls school

You should see:

    computer-science

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Create a directory named:

    music

Then use:

    ls

to confirm that it exists.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Lesson 17.

At any time, type:

    ./lesson

to clear the screen and show these instructions again.

If you need to restart this lesson, type:

    ./resetlesson


============================================================
LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
