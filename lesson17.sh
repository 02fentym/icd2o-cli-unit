#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous lesson,
# but keep the current Lesson 17 script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "lesson17.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson17.sh" > "$HOME/cli-course/lesson17.sh"
bash "$HOME/cli-course/lesson17.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson18.sh" > "$HOME/cli-course/lesson18.sh"
bash "$HOME/cli-course/lesson18.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/project"
printf 'Project notes.\n' > "$COURSE_DIR/project/notes.txt"
printf 'print("Hello")\n' > "$COURSE_DIR/project/main.py" 

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 17 — COPY A DIRECTORY
============================================================

You already know how to copy a file with:

    cp

To copy a DIRECTORY, we add:

    -r

Use:

    cp -r

The -r option means:

    recursive

It tells cp to copy the directory and everything inside it.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

There is already a directory named:

    project

Look inside it:

    ls project

You should see:

    main.py
    notes.txt

Now copy the entire directory:

    cp -r project project-copy

Then:

    ls

You should see both:

    project
    project-copy

------------------------------------------------------------
CHECK THE COPY
------------------------------------------------------------

Type:

    ls project-copy

You should see the same files:

    main.py
    notes.txt

The original directory still exists.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Copy:

    project

to a new directory named:

    backup

Then use:

    ls backup

to confirm that its files were copied too.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Lesson 18.

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
