#!/bin/bash

COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"

printf '\033[H\033[2J\033[3J\n'

echo "============================================================"
echo "INTRODUCTION TEST - LESSONS 1-3"
echo "============================================================"
echo
echo "This is a short check of what you have learned so far."
echo
echo "Type your answers exactly as requested."
echo

score=0
total=5

read -r -p '1. Type the command that displays: Hello CLI!  > ' answer

if [ "$answer" = 'echo "Hello CLI!"' ] || [ "$answer" = "echo 'Hello CLI!'" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo 'Not quite. A correct answer is: echo "Hello CLI!"'
fi

echo

read -r -p '2. In: echo "Hello", what is the COMMAND?  > ' answer

if [ "$answer" = "echo" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. The command is: echo"
fi

echo

read -r -p '3. In: echo "Hello", what is the ARGUMENT?  > ' answer

if [ "$answer" = '"Hello"' ] || [ "$answer" = "Hello" ] || [ "$answer" = "'Hello'" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo 'Not quite. The argument is: "Hello"'
fi

echo

read -r -p '4. What symbol begins a comment in Bash?  > ' answer

if [ "$answer" = "#" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. Bash comments begin with: #"
fi

echo

read -r -p '5. Type a Bash comment that says: This is a comment  > ' answer

if [ "$answer" = "# This is a comment" ] || [ "$answer" = "#This is a comment" ]; then
    echo "Correct!"
    score=$((score + 1))
else
    echo "Not quite. One correct answer is:"
    echo "    # This is a comment"
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
elif [ "$score" -ge 4 ]; then
    echo "Nice work!"
else
    echo "You may want to review Lessons 1-3 before continuing."
fi

echo
echo "When you're ready for Lesson 4, type:"
echo
echo "    ./next"
echo
echo "============================================================"

cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/lesson4.sh" | bash
HELPER

cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/test1.sh" > "$HOME/cli-course/test1.sh"
chmod +x "$HOME/cli-course/test1.sh"
"$HOME/cli-course/test1.sh"
HELPER

cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/test1.sh" > "$HOME/cli-course/test1.sh"
chmod +x "$HOME/cli-course/test1.sh"
"$HOME/cli-course/test1.sh"
HELPER

chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/next" "$COURSE_DIR/resetlesson"
