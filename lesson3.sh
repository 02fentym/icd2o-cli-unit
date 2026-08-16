#!/bin/bash

# ---------- Course helper setup ----------
COURSE_DIR="$HOME/.cli-course"
BIN_DIR="$HOME/.local/bin"
mkdir -p "$COURSE_DIR" "$BIN_DIR"

# Make ~/.local/bin available in future shells.
if ! grep -Fq 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.bashrc" 2>/dev/null; then
    printf '\nexport PATH="$HOME/.local/bin:$PATH"\n' >> "$HOME/.bashrc"
fi

cat > "$BIN_DIR/lesson" <<'HELPER'
#!/bin/bash
clear
cat "$HOME/.cli-course/lesson.txt"
HELPER

cat > "$BIN_DIR/resetlesson" <<'HELPER'
#!/bin/bash
lesson_num="$(cat "$HOME/.cli-course/current_lesson" 2>/dev/null)"
if [ -z "$lesson_num" ]; then
    echo "No lesson is currently loaded."
    exit 1
fi
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson${lesson_num}.sh" | bash
HELPER

cat > "$BIN_DIR/next" <<'HELPER'
#!/bin/bash
lesson_num="$(cat "$HOME/.cli-course/current_lesson" 2>/dev/null)"
if [ -z "$lesson_num" ]; then
    echo "No lesson is currently loaded."
    exit 1
fi
next_num=$((lesson_num + 1))
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson${next_num}.sh" | bash
HELPER

chmod +x "$BIN_DIR/lesson" "$BIN_DIR/resetlesson" "$BIN_DIR/next"

printf '3\n' > "$COURSE_DIR/current_lesson"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 3 — COMMENTS
============================================================

Sometimes we want to write something in the terminal or in a
shell script that is meant for HUMANS, not the computer.

That's what comments are for.

A comment begins with:

    #

Everything after the # on that line is treated as a comment.

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    # This is a comment

Then press Enter.

Notice that nothing is printed.

The shell ignores the comment.

Now type:

    echo "Hello!"

You should see:

    Hello!

------------------------------------------------------------
COMMENTS CAN EXPLAIN COMMANDS
------------------------------------------------------------

A comment can describe what a command is doing.

For example:

    # Print a greeting
    echo "Welcome!"

The first line is for the person reading the commands.

The second line is actually executed.

------------------------------------------------------------
COMMENTS CAN ALSO APPEAR AFTER A COMMAND
------------------------------------------------------------

Try:

    echo "Hello!" # Print a greeting

The echo command still runs.

The part beginning with # is ignored.

------------------------------------------------------------
ONE SPECIAL COMMENT
------------------------------------------------------------

You may eventually see this at the top of a shell script:

    #!/bin/bash

This is called a SHEBANG.

It tells the computer that the script should be run using Bash.

We'll work with shell scripts later. For now, just recognize
what this line means when you see it.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Enter a comment that says:

    This is my first comment

Then use echo on the next line to display:

    Comments are ignored!

------------------------------------------------------------
LESSON COMPLETE
------------------------------------------------------------

You've finished the first three introductory lessons.

Next, Coddy's course begins filesystem navigation with:

    pwd

At any time:

    lesson        show these instructions again
    resetlesson   reload this lesson
============================================================
LESSON

clear
cat "$COURSE_DIR/lesson.txt"
