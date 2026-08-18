#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the previous Redirection lesson,
# but keep the current redirection6.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "redirection6.sh" ]; then
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
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection6.sh" > "$HOME/cli-course/redirection6.sh"
bash "$HOME/cli-course/redirection6.sh"
HELPER

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection_test.sh" > "$HOME/cli-course/redirection_test.sh"
bash "$HOME/cli-course/redirection_test.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
REDIRECTION 6 — RECAP: LOG BUILDER
============================================================

You've learned how to control where command input and output
goes.

You know:

    >      overwrite a file with standard output
    >>     append standard output to a file
    <      use a file as standard input
    2>     overwrite a file with standard error
    2>>    append standard error to a file

------------------------------------------------------------
CHALLENGE
------------------------------------------------------------

Build an activity log.

Complete these steps IN ORDER.

1. Create activity.log containing:

       Session started

   using echo and >.

2. Append:

       User logged in

   using >>.

3. Append:

       Task completed

   using >>.

4. Try to list a directory that doesn't exist:

       invalid_path

   Append the error to activity.log using:

       2>>

5. Display the finished file with:

       cat

------------------------------------------------------------
CHECK YOUR WORK
------------------------------------------------------------

Your file should begin with:

    Session started
    User logged in
    Task completed

It should also contain an error message from:

    invalid_path

------------------------------------------------------------
REDIRECTION COMPLETE
------------------------------------------------------------

You've finished the Redirection section.

Next, you'll complete the Redirection Test.

Type:

    ./next

to begin the test.

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
