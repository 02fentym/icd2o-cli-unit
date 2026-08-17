#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from Lesson 9,
# but keep the current Test 2 script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "test2.sh" ]; then
        rm -rf "$item"
    fi
done

printf '\033[H\033[2J\033[3J\n'

echo "============================================================"
echo "NAVIGATION TEST - LESSONS 4-9"
echo "============================================================"
echo
echo "This is a short check of what you have learned so far."
echo
echo "Type your answers exactly as requested."
echo

score=0
total=7

read -r -p '1. What command prints your current directory?  > ' answer

if [ "$answer" = "pwd" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: pwd"
fi

echo

read -r -p '2. What command lists files and directories?  > ' answer

if [ "$answer" = "ls" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: ls"
fi

echo

read -r -p '3. Type the command to enter a directory named documents.  > ' answer

if [ "$answer" = "cd documents" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: cd documents"
fi

echo

read -r -p '4. Type the command to move up one directory.  > ' answer

if [ "$answer" = "cd .." ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: cd .."
fi

echo

read -r -p '5. What symbol represents your home directory?  > ' answer

if [ "$answer" = "~" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: ~"
fi

echo

read -r -p '6. What symbol represents the root directory?  > ' answer

if [ "$answer" = "/" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: /"
fi

echo

read -r -p '7. Is "documents" an absolute path or a relative path?  > ' answer

if [ "$answer" = "relative" ] || [ "$answer" = "Relative" ] || [ "$answer" = "relative path" ] || [ "$answer" = "Relative path" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: relative"
fi

echo
echo "============================================================"
echo "RESULT"
echo "============================================================"
echo
echo "You scored:"
echo
echo "    $score / $total"
echo

if [ "$score" -eq "$total" ]; then
    echo "Perfect score!"
elif [ "$score" -ge 6 ]; then
    echo "Nice work!"
else
    echo "You may want to review Lessons 4-9 before continuing."
fi

echo
echo "You've finished the Navigation section."
echo
echo "When you're ready for Lesson 10, type:"
echo
echo "    ./next"
echo
echo "============================================================"

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson10.sh" > "$HOME/cli-course/lesson10.sh"
bash "$HOME/cli-course/lesson10.sh"
HELPER

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/test2.sh" > "$HOME/cli-course/test2.sh"
bash "$HOME/cli-course/test2.sh"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/test2.sh" > "$HOME/cli-course/test2.sh"
bash "$HOME/cli-course/test2.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/next" "$COURSE_DIR/resetlesson"

cd "$COURSE_DIR"
