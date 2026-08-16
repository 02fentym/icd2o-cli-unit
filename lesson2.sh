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

printf '2\n' > "$COURSE_DIR/current_lesson"

cat > "$COURSE_DIR/lesson.txt" <<'LESSON'
============================================================
LESSON 2 — YOUR FIRST COMMAND
============================================================

In the last lesson, you used:

    echo "Hello World!"

Let's look more closely at what that command means.

The first part is the COMMAND:

    echo

The command tells the computer what to do.

The second part is an ARGUMENT:

    "Hello World!"

The argument gives the command some extra information.

So:

    echo "Hello World!"

means:

    echo               display something
    "Hello World!"     the thing to display

------------------------------------------------------------
TRY IT
------------------------------------------------------------

Type:

    echo "Hello World!"

Now try changing the argument:

    echo "I am learning the command line!"

Try your own message too.

------------------------------------------------------------
CASE MATTERS
------------------------------------------------------------

Try these two commands:

    echo "Hello World!"

    echo "hello world!"

The terminal prints exactly what you give it.

Capital and lowercase letters are different characters.

------------------------------------------------------------
YOUR TURN
------------------------------------------------------------

Use echo to print:

    CLI is awesome!

Don't copy the whole example above.

Think about the pattern:

    command "argument"

------------------------------------------------------------
WHEN YOU'RE READY
------------------------------------------------------------

Type:

    next

to continue to Lesson 3.

At any time:

    lesson        show these instructions again
    resetlesson   reload this lesson
============================================================
LESSON

clear
cat "$COURSE_DIR/lesson.txt"
