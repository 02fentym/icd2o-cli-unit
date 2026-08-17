#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Navigation lesson,
# but keep the current navigation6.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "navigation6.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation6.sh" > "$HOME/cli-course/navigation6.sh"
bash "$HOME/cli-course/navigation6.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation_test.sh" > "$HOME/cli-course/navigation_test.sh"
bash "$HOME/cli-course/navigation_test.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

mkdir -p "$COURSE_DIR/documents"
printf 'Math homework\n' > "$COURSE_DIR/documents/homework.txt"
printf 'Project ideas\n' > "$COURSE_DIR/documents/ideas.txt"
printf 'Class notes\n' > "$COURSE_DIR/documents/notes.txt"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
NAVIGATION 6 — RECAP: FIND YOUR WAY
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

------------------------------------------------------------
CHALLENGE
------------------------------------------------------------

Start inside:

    ~/cli-course

Your goal is to explore the documents directory.

1. Use a relative path to move into:

       documents

2. List the files.

3. Print your current working directory.

You should find:

    homework.txt
    ideas.txt
    notes.txt

------------------------------------------------------------
ONE MORE TRIP
------------------------------------------------------------

Now:

1. Move up one directory.
2. Confirm where you are.
3. Go to the root directory.
4. Confirm that you're at /.
5. Return directly to ~/cli-course.

------------------------------------------------------------
NAVIGATION COMPLETE
------------------------------------------------------------

You've finished the Navigation section.

Next, you'll complete the Navigation Test.

Make sure you're back inside:

    cd ~/cli-course

Then type:

    ./next

to begin the test.

At any time:

    ./lesson
    ./resetlesson

============================================================
LESSON

cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
