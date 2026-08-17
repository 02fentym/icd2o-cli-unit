#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue
    if [ "$(basename "$item")" != "test3.sh" ]; then
        rm -rf "$item"
    fi
done

printf '\033[H\033[2J\033[3J\n'

echo "============================================================"
echo "FILES TEST - LESSONS 10-15"
echo "============================================================"
echo
echo "This is a short check of what you have learned."
echo
echo "Type your answers exactly as requested."
echo

score=0
total=6

read -r -p '1. What command creates an empty file?  > ' answer
if [ "$answer" = "touch" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: touch"
fi

echo

read -r -p '2. Type the command to read a file named notes.txt.  > ' answer
if [ "$answer" = "cat notes.txt" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: cat notes.txt"
fi

echo

read -r -p '3. What command copies files?  > ' answer
if [ "$answer" = "cp" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: cp"
fi

echo

read -r -p '4. Type the command to rename old.txt to new.txt.  > ' answer
if [ "$answer" = "mv old.txt new.txt" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: mv old.txt new.txt"
fi

echo

read -r -p '5. What command deletes a file?  > ' answer
if [ "$answer" = "rm" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: rm"
fi

echo

read -r -p '6. Does cp remove the original file? Type yes or no.  > ' answer
if [ "$answer" = "no" ] || [ "$answer" = "No" ] || [ "$answer" = "NO" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. cp keeps the original file."
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
    echo "You may want to review Lessons 10-15 before continuing."
fi

echo
echo "You've finished the Files section."
echo
echo "When you're ready for Lesson 16, type:"
echo
echo "    ./next"
echo
echo "============================================================"

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson16.sh" > "$HOME/cli-course/lesson16.sh"
bash "$HOME/cli-course/lesson16.sh"
HELPER

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/test3.sh" > "$HOME/cli-course/test3.sh"
bash "$HOME/cli-course/test3.sh"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/test3.sh" > "$HOME/cli-course/test3.sh"
bash "$HOME/cli-course/test3.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/next" "$COURSE_DIR/resetlesson"

cd "$COURSE_DIR"
