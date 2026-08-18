#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the Wildcards And Patterns section,
# but keep the current wildcards_and_patterns_test.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "wildcards_and_patterns_test.sh" ]; then
        rm -rf "$item"
    fi
done

printf '\033[H\033[2J\033[3J\n'

echo "============================================================"
echo "WILDCARDS AND PATTERNS TEST"
echo "============================================================"
echo
echo "This is a short check of what you have learned."
echo
echo "Type your answers exactly as requested."
echo

score=0
total=7

read -r -p '1. Which wildcard matches any number of characters?  > ' answer

if [ "$answer" = "*" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: *"
fi

echo

read -r -p '2. Which wildcard matches exactly one character?  > ' answer

if [ "$answer" = "?" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: ?"
fi

echo

read -r -p '3. Type the pattern that matches all .txt files.  > ' answer

if [ "$answer" = "*.txt" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: *.txt"
fi

echo

read -r -p '4. Type the command to list all .jpg files.  > ' answer

if [ "$answer" = "ls *.jpg" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is:"
    echo "    ls *.jpg"
fi

echo

read -r -p '5. Type the pattern that matches file1.txt, file2.txt and file3.txt using a range.  > ' answer

if [ "$answer" = "file[1-3].txt" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is:"
    echo "    file[1-3].txt"
fi

echo

read -r -p '6. Which matches file1.txt but NOT file10.txt: file?.txt or file*.txt?  > ' answer

if [ "$answer" = "file?.txt" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is:"
    echo "    file?.txt"
fi

echo

read -r -p '7. Type the command to copy all .jpg files into a directory named images.  > ' answer

if [ "$answer" = "cp *.jpg images" ] || [ "$answer" = "cp *.jpg images/" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. One correct answer is:"
    echo "    cp *.jpg images"
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
    echo "You may want to review the Wildcards And Patterns section before continuing."
fi

echo
echo "You've finished the Wildcards And Patterns section."
echo
echo "When you're ready for File Content 1, type:"
echo
echo "    ./next"
echo
echo "============================================================"

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content1.sh" > "$HOME/cli-course/file_content1.sh"
bash "$HOME/cli-course/file_content1.sh"
HELPER

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns_test.sh" > "$HOME/cli-course/wildcards_and_patterns_test.sh"
bash "$HOME/cli-course/wildcards_and_patterns_test.sh"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/wildcards_and_patterns_test.sh" > "$HOME/cli-course/wildcards_and_patterns_test.sh"
bash "$HOME/cli-course/wildcards_and_patterns_test.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/next" "$COURSE_DIR/resetlesson"

cd "$COURSE_DIR"
