# ICD2O CLI Unit

A beginner-friendly command-line course for students.

This course runs entirely inside the terminal and is designed to teach basic Bash / CLI skills in very small, manageable steps.

The course is hosted in this GitHub repository and loaded using `curl`.

---

# How Students Start the Course

Students start with:

```bash
curl -s https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/introduction1.sh | bash && cd ~/cli-course
```

This:

1. Downloads the first lesson from GitHub.
2. Runs the lesson.
3. Creates the course environment inside:

```text
~/cli-course
```

4. Moves the student into that directory.

From that point forward, students normally use:

```bash
./next
```

to move through the course.

---

# Student Commands

Every lesson provides a few helper commands.

## Show the Lesson Again

```bash
./lesson
```

This clears the terminal and displays the current instructions again.

## Restart the Current Lesson

```bash
./resetlesson
```

For normal lessons, this downloads a fresh copy of the current lesson from GitHub and rebuilds the lesson environment.

For projects, `./resetlesson` restarts the **entire project from Part 1**.

## Continue

```bash
./next
```

This downloads and starts the next lesson, test, or project part.

---

# Course Structure

The course currently follows this sequence:

```text
Introduction
    introduction1.sh
    introduction2.sh
    introduction3.sh
    introduction_test.sh

Navigation
    navigation1.sh
    navigation2.sh
    navigation3.sh
    navigation4.sh
    navigation5.sh
    navigation6.sh
    navigation_test.sh

Files
    files1.sh
    files2.sh
    files3.sh
    files4.sh
    files5.sh
    files6.sh
    files_test.sh

Directories
    directories1.sh
    directories2.sh
    directories3.sh
    directories4.sh
    directories5.sh
    directories_test.sh

Organize Photos Project
    photo_project1.sh
    photo_project2.sh
    photo_project3.sh
    photo_project4.sh

Wildcards And Patterns
    wildcards_and_patterns1.sh
    wildcards_and_patterns2.sh
    wildcards_and_patterns3.sh
    wildcards_and_patterns4.sh
    wildcards_and_patterns5.sh
    wildcards_and_patterns_test.sh

File Content
    file_content1.sh
    file_content2.sh
    file_content3.sh
    file_content4.sh
    file_content5.sh
    file_content6.sh
    file_content7.sh
    file_content_test.sh

Redirection
    redirection1.sh
    redirection2.sh
    redirection3.sh
    redirection4.sh
    redirection5.sh
    redirection6.sh
    redirection_test.sh

Piping
    piping1.sh
    piping2.sh
    piping3.sh
    piping4.sh
    piping5.sh
    piping_test.sh

Log Analyzer Project
    log_analyzer_project1.sh
    log_analyzer_project2.sh
    log_analyzer_project3.sh
    log_analyzer_project4.sh
    log_analyzer_project5.sh

Final Screen
    congratulations.sh
```

The final course flow ends with:

```text
piping_test.sh
    ↓
log_analyzer_project1.sh
    ↓
log_analyzer_project2.sh
    ↓
log_analyzer_project3.sh
    ↓
log_analyzer_project4.sh
    ↓
log_analyzer_project5.sh
    ↓
congratulations.sh
```

---

# What Students Learn

## Introduction

Students learn:

```bash
echo
# comments
```

They are introduced to:

- the terminal
- commands
- arguments
- Bash comments

## Navigation

Students learn:

```bash
pwd
ls
cd
```

They also learn:

```text
.
..
~
/
```

and the difference between:

- absolute paths
- relative paths

## Files

Students learn:

```bash
touch
cat
cp
mv
rm
```

## Directories

Students learn:

```bash
mkdir
mkdir -p
cp -r
mv
rmdir
rm -r
```

## Wildcards And Patterns

Students learn:

```text
*
?
[ ]
```

Examples:

```bash
ls *.txt
ls file?.txt
ls file[1-3].txt
```

## File Content

Students learn:

```bash
head
tail
wc
sort
uniq
grep
```

Common options include:

```bash
head -n
tail -n
wc -l
wc -w
sort -n
sort -r
uniq -c
grep -i
grep -n
```

## Redirection

Students learn the three standard streams:

```text
stdin
stdout
stderr
```

and:

```bash
>
>>
<
2>
2>>
```

## Piping

Students learn:

```bash
|
```

and start combining commands:

```bash
cat names.txt | sort
sort names.txt | uniq
cat visitors.txt | sort | uniq | wc -l
cat server.log | grep "ERROR" | wc -l
```

---

# Projects

There are two larger projects.

## Organize Photos Project

Students receive a messy collection of files:

```text
beach.jpg
birthday.jpg
family.jpg
concert.jpg
soccer.jpg
hiking.jpg
todo.txt
```

They organize them into:

```text
family/
school/
activities/
```

This reinforces:

```bash
ls
mkdir
mv
rm
```

## Log Analyzer Project

Students receive:

```text
server.log
```

They progressively:

1. Inspect the log.
2. View parts of the log.
3. Filter ERROR entries.
4. Count errors using a pipeline.
5. Generate `report.txt`.

This combines skills from the entire course.

The final report contains the error count and the matching log entries.

---

# Design Philosophy

This course was intentionally designed for students who have very little or no terminal experience.

The main design principles are:

## Teach One Small Thing at a Time

Lessons introduce very few new ideas.

For example:

```text
pwd
```

gets its own lesson.

Then:

```text
ls
```

gets its own lesson.

Then:

```text
cd
```

gets its own lesson.

The goal is to avoid overwhelming beginners.

## Students Actually Use the Terminal

This is not a slideshow or simulated terminal.

Students type real commands into a real shell.

The filesystem itself becomes the learning environment.

## Immediate Practice

Most lessons follow this pattern:

```text
Explain
    ↓
Show an example
    ↓
Student tries it
    ↓
Small challenge
    ↓
Continue
```

## No Automatic Checking

The course deliberately does not automatically verify every student command.

Instead, students are taught to check their own work using commands such as:

```bash
ls
cat
pwd
```

This keeps the system simple and also teaches students how to inspect a filesystem themselves.

## Tests Are Separate From Lessons

Section tests have descriptive names such as:

```text
navigation_test.sh
files_test.sh
directories_test.sh
```

Tests are not numbered as normal lessons.

---

# How the Scripts Work

Most normal lessons follow the same architecture.

At the beginning:

```bash
COURSE_DIR="$HOME/cli-course"
mkdir -p "$COURSE_DIR"
```

The course always runs inside:

```text
~/cli-course
```

---

# Cleaning the Previous Lesson

Normal lessons clean the course directory before creating the new environment.

However, the script that is currently running must NOT delete itself.

The safe pattern is:

```bash
for item in "$COURSE_DIR"/*; do
    [ -e "$item" ] || continue

    if [ "$(basename "$item")" != "CURRENT_SCRIPT.sh" ]; then
        rm -rf "$item"
    fi
done
```

For example:

```bash
if [ "$(basename "$item")" != "navigation3.sh" ]; then
    rm -rf "$item"
fi
```

This is important.

Do **not** simply run:

```bash
rm -rf "$COURSE_DIR"
```

from a lesson script stored inside `~/cli-course`.

Doing so may delete the script while it is still running.

---

# The `./lesson` Helper

Normal lessons create:

```bash
cat > "$COURSE_DIR/lesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
cat "$HOME/cli-course/lesson.txt"
HELPER
```

This simply clears the screen and prints the current lesson instructions again.

---

# The `./resetlesson` Helper

A normal lesson looks approximately like:

```bash
cat > "$COURSE_DIR/resetlesson" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation3.sh" > "$HOME/cli-course/navigation3.sh"
bash "$HOME/cli-course/navigation3.sh"
HELPER
```

The important pattern is:

```text
download script
    ↓
save script
    ↓
bash script
```

---

# The `./next` Helper

The next lesson follows the same pattern:

```bash
cat > "$COURSE_DIR/next" <<'HELPER'
#!/bin/bash
printf '\033[H\033[2J\033[3J\n'
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/navigation4.sh" > "$HOME/cli-course/navigation4.sh"
bash "$HOME/cli-course/navigation4.sh"
HELPER
```

Then:

```bash
chmod +x "$COURSE_DIR/lesson" "$COURSE_DIR/resetlesson" "$COURSE_DIR/next"
```

---

# Clearing the Terminal

Use this exact command throughout the course:

```bash
printf '\033[H\033[2J\033[3J\n'
```

This clears both the visible terminal and scrollback properly in the environment where this course is being used.

---

# Lesson Instructions

Instructions are stored in:

```text
lesson.txt
```

They are normally created with a heredoc:

```bash
cat > "$COURSE_DIR/lesson.txt" <<'LESSON'

LESSON CONTENT HERE

LESSON
```

Then displayed using:

```bash
cd "$COURSE_DIR"
printf '\033[H\033[2J\033[3J\n'
cat "$COURSE_DIR/lesson.txt"
```

---

# Important `curl` Behaviour

The course is designed around the restricted version of `curl` available in the student environment.

Use:

```bash
curl -s
```

Do not depend on:

```bash
curl -L
```

because `-L` is not supported in the target environment.

GitHub raw URLs should therefore be used directly:

```text
https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/FILENAME.sh
```

---

# Important Interactive Test Behaviour

Tests use Bash:

```bash
read
```

There is an important limitation.

Do NOT execute an interactive test like this:

```bash
curl -s URL/test.sh | bash
```

When Bash receives the script through a pipe, standard input is already being used by the script itself.

That can prevent `read` from receiving keyboard input correctly.

Instead, interactive tests should be downloaded first:

```bash
curl -s "URL/test.sh" > "$HOME/cli-course/test.sh"
bash "$HOME/cli-course/test.sh"
```

This is why `./next` downloads tests into files before executing them.

---

# Project Scripts Are Different

Normal lessons rebuild their environment.

Projects should NOT.

For projects such as:

```text
photo_project1.sh
photo_project2.sh
photo_project3.sh
photo_project4.sh
```

the student's filesystem changes must persist between parts.

The same applies to:

```text
log_analyzer_project1.sh
...
log_analyzer_project5.sh
```

Therefore project parts only remove the previous project script.

For example:

```bash
rm -f "$COURSE_DIR/photo_project2.sh"
```

inside `photo_project3.sh`.

Do NOT do this:

```bash
rm -f "$COURSE_DIR/photo_project3.sh"
```

inside `photo_project3.sh`.

That would delete the currently-running script.

This caused a bug during development and is worth remembering.

The pattern should be:

```text
Part 2 removes Part 1
Part 3 removes Part 2
Part 4 removes Part 3
```

The current script remains untouched.

---

# Restarting Projects

For a project, `./resetlesson` intentionally returns students to Part 1.

Example:

```bash
curl -s "https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/photo_project1.sh" > "$HOME/cli-course/photo_project1.sh"
bash "$HOME/cli-course/photo_project1.sh"
```

Part 1 then rebuilds the original project environment.

This makes it easy for students to completely restart if they accidentally move or delete the wrong files.

---

# Naming Convention

Scripts use descriptive section names.

Examples:

```text
introduction1.sh
navigation4.sh
files3.sh
directories5.sh
```

Multi-word sections use underscores:

```text
wildcards_and_patterns1.sh
file_content1.sh
photo_project1.sh
log_analyzer_project1.sh
```

Tests use:

```text
SECTION_test.sh
```

For example:

```text
navigation_test.sh
file_content_test.sh
redirection_test.sh
```

Projects use:

```text
PROJECT_NAME1.sh
PROJECT_NAME2.sh
...
```

---

# Adding a New Lesson

To add another normal lesson:

1. Copy an existing lesson script.
2. Rename it.
3. Update the cleanup exception.
4. Update `resetlesson`.
5. Update `next`.
6. Replace the lesson environment.
7. Replace `lesson.txt`.
8. Update the previous lesson so its `./next` points to the new file.

For example, if adding:

```text
example3.sh
```

make sure the cleanup says:

```bash
if [ "$(basename "$item")" != "example3.sh" ]; then
```

The reset URL should point to:

```text
example3.sh
```

and the next URL should point to:

```text
example4.sh
```

---

# Testing a Lesson Directly

You can start from any normal lesson using:

```bash
curl -s https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/FILENAME.sh | bash && cd ~/cli-course
```

For example:

```bash
curl -s https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/directories5.sh | bash && cd ~/cli-course
```

For interactive tests, download first instead of piping:

```bash
curl -s https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/directories_test.sh > ~/directories_test.sh
bash ~/directories_test.sh
cd ~/cli-course
```

---

# Testing the Full Course

The best full test is to start from:

```bash
curl -s https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/introduction1.sh | bash && cd ~/cli-course
```

Then move through the course only using:

```bash
./next
```

Things to verify:

- Each lesson immediately displays its instructions.
- `./lesson` redisplays the instructions.
- `./resetlesson` correctly rebuilds the lesson.
- `./next` loads the correct next script.
- Section tests accept keyboard input.
- Normal lessons clean previous files.
- Project files persist between project stages.
- Project reset returns to Part 1.
- No script deletes itself while running.
- The Log Analyzer project ends at `congratulations.sh`.

---

# Final Course Screen

The final script is:

```text
congratulations.sh
```

There is intentionally no `./next` after this.

The student's final Log Analyzer files are preserved:

```text
server.log
report.txt
```

Students can view the final report using:

```bash
cat report.txt
```

---

# Why This Course Was Built This Way

The course was inspired by the pacing of interactive terminal-learning platforms, particularly the idea of introducing CLI concepts in tiny increments.

However, the lessons, examples, projects, filesystem environments, wording, and scripts in this repository were created specifically for this course.

The main goal was to build something that:

- works in a restricted browser-based terminal
- requires almost no setup
- uses real Bash commands
- is easy for students to restart
- is easy for a teacher to maintain
- introduces concepts gradually
- gives students lots of hands-on practice
- eventually teaches students to combine simple commands into useful workflows

The architecture is intentionally simple.

Each `.sh` file is both:

1. the lesson setup script
2. the mechanism that creates the student's learning environment

GitHub acts as the source of truth.

The terminal downloads each stage only when the student reaches it.

---

# GitHub Repository

Repository:

```text
02fentym/icd2o-cli-unit
```

Raw lesson URL pattern:

```text
https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/FILENAME.sh
```

---

# Quick Reference for Future Me

Start the course:

```bash
curl -s https://raw.githubusercontent.com/02fentym/icd2o-cli-unit/main/introduction1.sh | bash && cd ~/cli-course
```

Reload instructions:

```bash
./lesson
```

Restart lesson/project:

```bash
./resetlesson
```

Continue:

```bash
./next
```

Course directory:

```text
~/cli-course
```

Clear screen:

```bash
printf '\033[H\033[2J\033[3J\n'
```

Normal lesson rule:

```text
Delete everything except the currently-running script.
```

Project rule:

```text
Preserve the project world.
Remove only the previous project script.
Never delete the currently-running script.
```

Interactive test rule:

```text
Download the test to a file first, then run it with bash.
Do not pipe an interactive test directly into bash.
```

Final file:

```text
congratulations.sh
```

---

# Future Ideas

Possible improvements later:

- Add more mini-projects.
- Add an optional challenge track.
- Add teacher documentation for expected answers.
- Add screenshots/GIFs showing how to begin.
- Add a troubleshooting section for students.
- Add a course map showing student progress.
- Add GitHub Actions or another automated check that validates every `./next` URL.
- Add a script that checks the repository for broken lesson transitions.
- Add optional advanced sections after the core course.

For now, the course intentionally ends after the Log Analyzer Project so students finish with a practical example of combining the CLI skills they learned.
