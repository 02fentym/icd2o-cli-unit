#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Navigation lesson,
# but keep the current navigation2.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "navigation2.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation2.sh" > "$HOME/cli-course/navigation2.sh"
bash "$HOME/cli-course/navigation2.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation3.sh" > "$HOME/cli-course/navigation3.sh"
bash "$HOME/cli-course/navigation3.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/documents"
printf 'Welcome to the CLI course.\n' > "$COURSE_DIR/readme.txt"
printf 'Practice makes progress.\n' > "$COURSE_DIR/notes.txt"
printf 'A sample document.\n' > "$COURSE_DIR/documents/report.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
NAVIGATION 2 — LIST FILES
============================================================

You already know how to ask:

    Where am I?

with:

    pwd

Now let's ask:

    What's here?

Use:

    ls

ls stands for:

    list

It shows the visible files and directories in your current
location.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    ls

You should see several items, including:

    documents
    notes.txt
    readme.txt

You'll also see some files used by this course.

------------------------------------------------------------
LIST A SPECIFIC DIRECTORY
------------------------------------------------------------

You don't have to move into a directory to see what's inside.

Try:

    ls documents

You should see:

    report.txt

------------------------------------------------------------
USEFUL OPTIONS
------------------------------------------------------------

Commands can have OPTIONS that change how they behave.

Try:

    ls -l

The -l option gives you a longer, more detailed listing.

Now try:

    ls -a

The -a option also shows hidden files.

Hidden files usually begin with:

    .

You can combine the options:

    ls -la

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Try:

    ls
    ls -l
    ls -a
    ls documents

Notice how the output changes.

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    ./next

to continue to Navigation 3.

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
