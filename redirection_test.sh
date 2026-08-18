#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

# Clean up files from the Redirection section,
# but keep the current redirection_test.sh script.
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "redirection_test.sh" ]; then
        rm -rf "$item"
    fi
done

printf '\033[H\033[2J\033[3J\n'

echo "============================================================"
echo "REDIRECTION TEST"
echo "============================================================"
echo
echo "This is a short check of what you have learned."
echo
echo "Type your answers exactly as requested."
echo

score=0
total=9

read -r -p '1. What is the normal output from a command called?  > ' answer

if [ "$answer" = "standard output" ] || [ "$answer" = "stdout" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The answer is: standard output"
fi

echo

read -r -p '2. Which symbol redirects output and overwrites a file?  > ' answer

if [ "$answer" = ">" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: >"
fi

echo

read -r -p '3. Which symbol appends output to a file?  > ' answer

if [ "$answer" = ">>" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: >>"
fi

echo

read -r -p '4. Type the command to write Hello into message.txt using echo.  > ' answer

if [ "$answer" = 'echo "Hello" > message.txt' ] || [ "$answer" = "echo Hello > message.txt" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo 'Not quite. One correct answer is:'
    echo '    echo "Hello" > message.txt'
fi

echo

read -r -p '5. Type the command to append Goodbye to message.txt using echo.  > ' answer

if [ "$answer" = 'echo "Goodbye" >> message.txt' ] || [ "$answer" = "echo Goodbye >> message.txt" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo 'Not quite. One correct answer is:'
    echo '    echo "Goodbye" >> message.txt'
fi

echo

read -r -p '6. Which symbol redirects a file into a command as input?  > ' answer

if [ "$answer" = "<" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: <"
fi

echo

read -r -p '7. What is the error stream called?  > ' answer

if [ "$answer" = "standard error" ] || [ "$answer" = "stderr" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The answer is: standard error"
fi

echo

read -r -p '8. Which operator redirects standard error and overwrites a file?  > ' answer

if [ "$answer" = "2>" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: 2>"
fi

echo

read -r -p '9. Which operator appends standard error to a file?  > ' answer

if [ "$answer" = "2>>" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The correct answer is: 2>>"
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
    echo "You may want to review the Redirection section before continuing."
fi

echo
echo "You've finished the Redirection section."
echo
echo "When you're ready for Piping 1, type:"
echo
echo "    ./next"
echo
echo "============================================================"

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/piping1.sh" > "$HOME/cli-course/piping1.sh"
bash "$HOME/cli-course/piping1.sh"
HELPER

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection_test.sh" > "$HOME/cli-course/redirection_test.sh"
bash "$HOME/cli-course/redirection_test.sh"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/redirection_test.sh" > "$HOME/cli-course/redirection_test.sh"
bash "$HOME/cli-course/redirection_test.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/next" "$COURSE_DIR/resetlesson"

cd "$COURSE_DIR"
