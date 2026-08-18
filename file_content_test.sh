#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the File Content section,
# but keep the current file_content_test.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "file_content_test.sh" ]; then
        rm -rf "$item"
    fi
done

printf '\033[H\033[2J\033[3J\n'

echo "============================================================"
echo "FILE CONTENT TEST"
echo "============================================================"
echo
echo "This is a short check of what you have learned."
echo
echo "Type your answers exactly as requested."
echo

score=0
total=10

read -r -p '1. What command shows the beginning of a file?  > ' answer

if [ "$answer" = "head" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: head"
fi

echo

read -r -p '2. What command shows the end of a file?  > ' answer

if [ "$answer" = "tail" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: tail"
fi

echo

read -r -p '3. Type the command to show the first 5 lines of notes.txt.  > ' answer

if [ "$answer" = "head -n 5 notes.txt" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is:"
    echo "    head -n 5 notes.txt"
fi

echo

read -r -p '4. Type the command to count the lines in notes.txt.  > ' answer

if [ "$answer" = "wc -l notes.txt" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is:"
    echo "    wc -l notes.txt"
fi

echo

read -r -p '5. What command sorts the lines of a file?  > ' answer

if [ "$answer" = "sort" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: sort"
fi

echo

read -r -p '6. What option makes sort use numerical order?  > ' answer

if [ "$answer" = "-n" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: -n"
fi

echo

read -r -p '7. What command removes consecutive duplicate lines?  > ' answer

if [ "$answer" = "uniq" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: uniq"
fi

echo

read -r -p '8. Type the command to find ERROR inside server.log.  > ' answer

if [ "$answer" = 'grep "ERROR" server.log' ] || [ "$answer" = "grep ERROR server.log" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo 'Not quite. One correct answer is:'
    echo '    grep "ERROR" server.log'
fi

echo

read -r -p '9. What grep option ignores capitalization?  > ' answer

if [ "$answer" = "-i" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: -i"
fi

echo

read -r -p '10. What grep option displays matching line numbers?  > ' answer

if [ "$answer" = "-n" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: -n"
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
elif [ "$score" -ge 8 ]; then
    echo "Nice work!"
else
    echo "You may want to review the File Content section before continuing."
fi

echo
echo "You've finished the File Content section."
echo
echo "When you're ready for Redirection 1, type:"
echo
echo "    ./next"
echo
echo "============================================================"

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection1.sh" > "$HOME/cli-course/redirection1.sh"
bash "$HOME/cli-course/redirection1.sh"
HELPER

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content_test.sh" > "$HOME/cli-course/file_content_test.sh"
bash "$HOME/cli-course/file_content_test.sh"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/file_content_test.sh" > "$HOME/cli-course/file_content_test.sh"
bash "$HOME/cli-course/file_content_test.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/next" "$COURSE_DIR/resetlesson"

cd "$COURSE_DIR"
