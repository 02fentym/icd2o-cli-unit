#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the Piping section,
# but keep the current piping_test.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "piping_test.sh" ]; then
        rm -rf "$item"
    fi
done

printf '\033[H\033[2J\033[3J\n'

echo "============================================================"
echo "PIPING TEST"
echo "============================================================"
echo
echo "This is a short check of what you have learned."
echo
echo "Type your answers exactly as requested."
echo

score=0
total=8

read -r -p '1. What symbol creates a pipe?  > ' answer

if [ "$answer" = "|" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: |"
fi

echo

read -r -p '2. What does a pipe connect? Type: output to input  > ' answer

if [ "$answer" = "output to input" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. A pipe connects output to input."
fi

echo

read -r -p '3. Type the command to read names.txt and pipe it into sort.  > ' answer

if [ "$answer" = "cat names.txt | sort" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is:"
    echo "    cat names.txt | sort"
fi

echo

read -r -p '4. Type the pipeline to sort names.txt and remove duplicate lines.  > ' answer

if [ "$answer" = "sort names.txt | uniq" ] || [ "$answer" = "cat names.txt | sort | uniq" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. One correct answer is:"
    echo "    sort names.txt | uniq"
fi

echo

read -r -p '5. Which command should usually come before uniq: sort or wc?  > ' answer

if [ "$answer" = "sort" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: sort"
fi

echo

read -r -p '6. Type the pipeline to list files and keep only lines containing .txt.  > ' answer

if [ "$answer" = 'ls | grep ".txt"' ] || [ "$answer" = "ls | grep .txt" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo 'Not quite. One correct answer is:'
    echo '    ls | grep ".txt"'
fi

echo

read -r -p '7. Type the pipeline to count lines in server.log containing ERROR.  > ' answer

if [ "$answer" = 'cat server.log | grep "ERROR" | wc -l' ] || [ "$answer" = "cat server.log | grep ERROR | wc -l" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo 'Not quite. One correct answer is:'
    echo '    cat server.log | grep "ERROR" | wc -l'
fi

echo

read -r -p '8. Does data flow through a pipeline from left to right? Type yes or no.  > ' answer

if [ "$answer" = "yes" ] || [ "$answer" = "Yes" ] || [ "$answer" = "YES" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: yes"
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
elif [ "$score" -ge 7 ]; then
    echo "Nice work!"
else
    echo "You may want to review the Piping section before continuing."
fi

echo
echo "You've finished the Piping section."
echo
echo "When you're ready for the Log Analyzer Project, type:"
echo
echo "    ./next"
echo
echo "============================================================"

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/log_analyzer_project1.sh" > "$HOME/cli-course/log_analyzer_project1.sh"
bash "$HOME/cli-course/log_analyzer_project1.sh"
HELPER

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping_test.sh" > "$HOME/cli-course/piping_test.sh"
bash "$HOME/cli-course/piping_test.sh"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping_test.sh" > "$HOME/cli-course/piping_test.sh"
bash "$HOME/cli-course/piping_test.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/next" "$COURSE_DIR/resetlesson"

cd "$COURSE_DIR"
