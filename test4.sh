#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from Lesson 20,
# but keep the current Test 4 script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "test4.sh" ]; then
        rm -rf "$item"
    fi
done

printf '\033[H\033[2J\033[3J\n'

echo "============================================================"
echo "DIRECTORIES TEST - LESSONS 16-20"
echo "============================================================"
echo
echo "This is a short check of what you have learned."
echo
echo "Type your answers exactly as requested."
echo

score=0
total=6

read -r -p '1. What command creates a directory?  > ' answer
if [ "$answer" = "mkdir" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: mkdir"
fi

echo

read -r -p '2. Type the command to create a directory named projects.  > ' answer
if [ "$answer" = "mkdir projects" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: mkdir projects"
fi

echo

read -r -p '3. What option is commonly used with cp to copy a directory?  > ' answer
if [ "$answer" = "-r" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: -r"
fi

echo

read -r -p '4. Type the command to rename old-folder to new-folder.  > ' answer
if [ "$answer" = "mv old-folder new-folder" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: mv old-folder new-folder"
fi

echo

read -r -p '5. What command removes an empty directory?  > ' answer
if [ "$answer" = "rmdir" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: rmdir"
fi

echo

read -r -p '6. Type the command to remove a directory named old and everything inside it.  > ' answer
if [ "$answer" = "rm -r old" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: rm -r old"
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
elif [ "$score" -ge 5 ]; then
    echo "Nice work!"
else
    echo "You may want to review Lessons 16-20 before continuing."
fi

echo
echo "You've finished the Directories section."
echo
echo "When you're ready for Lesson 21, type:"
echo
echo "    ./next"
echo
echo "============================================================"

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson21.sh" > "$HOME/cli-course/lesson21.sh"
bash "$HOME/cli-course/lesson21.sh"
HELPER

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/test4.sh" > "$HOME/cli-course/test4.sh"
bash "$HOME/cli-course/test4.sh"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/test4.sh" > "$HOME/cli-course/test4.sh"
bash "$HOME/cli-course/test4.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/next" "$COURSE_DIR/resetlesson"

cd "$COURSE_DIR"
