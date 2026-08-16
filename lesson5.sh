#!/bin/bash
COURSE_DIR="$HOME/cli-course"
WORKSPACE_DIR="$COURSE_DIR/workspace"
mkdir -p "$COURSE_DIR" "$WORKSPACE_DIR"

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
cat "$HOME/cli-course/lesson.txt"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
lesson_num="$(cat "$HOME/cli-course/current_lesson" 2>/dev/null)"
if [ -z "$lesson_num" ]; then
    echo "No lesson is currently loaded."
    exit 1
fi
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson${lesson_num}.sh" | bash
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
lesson_num="$(cat "$HOME/cli-course/current_lesson" 2>/dev/null)"
if [ -z "$lesson_num" ]; then
    echo "No lesson is currently loaded."
    exit 1
fi
next_num=$((lesson_num + 1))
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson${next_num}.sh" | bash
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"
printf '5\n' > "$COURSE_DIR/current_lesson"

rm -rf "$WORKSPACE_DIR"
mkdir -p "$WORKSPACE_DIR"


rm -rf "$COURSE_DIR/documents"
mkdir -p "$COURSE_DIR/documents"
printf 'Welcome to the CLI course.\n' > "$COURSE_DIR/readme.txt"
printf 'Practice makes progress.\n' > "$COURSE_DIR/notes.txt"
printf 'A sample document.\n' > "$COURSE_DIR/documents/report.txt"


cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 5 — LIST FILES
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

Try these four commands:

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

to continue to Lesson 6.

At any time:

    ./lesson
    ./resetlesson

============================================================

LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
