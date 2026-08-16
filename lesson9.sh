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
printf '9\n' > "$COURSE_DIR/current_lesson"

rm -rf "$WORKSPACE_DIR"
mkdir -p "$WORKSPACE_DIR"


rm -rf "$COURSE_DIR/documents"
mkdir -p "$COURSE_DIR/documents"
printf 'Math homework\n' > "$COURSE_DIR/documents/homework.txt"
printf 'Project ideas\n' > "$COURSE_DIR/documents/ideas.txt"
printf 'Class notes\n' > "$COURSE_DIR/documents/notes.txt"


cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 9 — RECAP: FIND YOUR WAY
============================================================

You've learned the core tools for navigating a filesystem:

    pwd    Where am I?
    ls     What's here?
    cd     Move somewhere else

You've also learned about:

    absolute paths
    relative paths
    .
    ..
    ~
    /

Now let's put those skills together.

------------------------------------------------------------
CHALLENGE
------------------------------------------------------------

Start inside:

    ~/cli-course

Your goal is to explore the documents directory.

Do these steps WITHOUT copying a complete command sequence.

1. Use a RELATIVE PATH to move into:

       documents

2. List all of the files inside it.

3. Print your current working directory.

If you've done everything correctly, you should find:

    homework.txt
    ideas.txt
    notes.txt

and your final path should end with:

    /cli-course/documents

------------------------------------------------------------
ONE MORE TRIP
------------------------------------------------------------

Now:

1. Move up one directory.
2. Confirm where you are.
3. Go to the root directory.
4. Confirm that you're at /.
5. Return directly to ~/cli-course.

Use the commands you've learned rather than looking back
unless you need to.

------------------------------------------------------------
NAVIGATION COMPLETE
------------------------------------------------------------

You now know how to:

    pwd          print your current location
    ls           list files and directories
    ls -l        show a detailed listing
    ls -a        include hidden files
    cd folder    enter a directory
    cd ..        move to the parent directory
    cd ~         go home
    cd /         go to the root directory
    .            refer to the current directory
    ..           refer to the parent directory

The next Coddy section is:

    FILES

where you'll begin creating, reading, copying, moving,
renaming, and deleting files.

To see this lesson again:

    ./lesson

To restart it:

    ./resetlesson

============================================================

LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
