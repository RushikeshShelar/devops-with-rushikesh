# Bash Scripting

## Section A: Introduction to Bash Scripting

### 1. What Are Scripts?
A **script** is a text file containing a sequence of commands executed by a shell interpreter.  
Scripts automate tasks, reduce manual effort, and ensure consistency—commonly used in DevOps, system administration, and automation workflows.

### 2. Types of Shells (bash, sh, zsh, etc.)

| Shell | Description | Key Features |
|-------|-------------|--------------|
| **sh** | Original Bourne Shell | Minimal, portable |
| **bash** | Bourne Again Shell (most used) | Arrays, history, better syntax |
| **zsh** | Feature-rich modern shell | Themes, plugins, autocomplete |
| **ksh** | KornShell | Enterprise systems, strong scripting |
| **fish** | User-friendly shell | Auto-suggestions, not POSIX compliant |

Key Differences:
- **bash** is more advanced than **sh**
- **zsh** is more interactive and customizable
- **sh** is more portable across Unix systems
- **bash/zsh** support enhanced syntax and arrays

### 3. Shebang and Comments

#### Shebang (`#!`)
Identifies which interpreter should run the script.

Examples:
```bash
#!/bin/bash
#!/usr/bin/env bash
#!/bin/sh
#!/bin/zsh
```

Comments:
```bash
# This is a comment
```

---

## Introduction to Bash Scripting
### 1. Variables
Variables in Bash do not require type declarations.
```bash
name="Rushikesh"
age=22
```
- No spaces around `=`
- Access using `$variable`

Quotes & Escaping

- Single quotes (' ') → literal text, no variable expansion
- Double quotes (" ") → variable expansion allowed
- Escape special characters with `\`

Example:
```bash
msg="Hello \$USER"
```

### 2. Command Line Arguments

| Symbol      | Meaning              |
| ----------- | -------------------- |
| `$0`        | Script name          |
| `$1 ... $9` | Positional arguments |
| `$@`        | All arguments        |
| `$#`        | Number of arguments  |

Example:
```bash
echo "First argument: $1"
echo "Total args: $#"
```

### 3. System Variables
- `$?` – The exit status of the most recently run process.  
- `$$` – The process ID of the current script.  
- `$USER` – The username of the user running the script.  
- `$HOSTNAME` – The hostname of the machine the script is running on.  
- `$SECONDS` – The number of seconds since the script was started.  
- `$RANDOM` – Returns a different random number each time it is referred to.  
- `$LINENO` – Returns the current line number in the Bash script.

### 4. Command Substitution
Store command output into variables.

**Method 1 (old)**:
```
files=`ls`
```
**Method 2 (modern, preferred)**:
```
files=$(ls)
```

Example:
```bash
count=$(ls /etc | wc -l)
echo "Total entries: $count"
```

### 5. Exporting Variables
a. Variables are not exported by default
```
var="Hello"
```
b. Exporting to child shells
```
export var="Hello"
```
c. User-level permanent variables
Add to:
```
~/.bashrc
~/.profile
```
d. System-wide (all users)
```
/etc/profile
```

---

## Section C: User Input
### 1. read
```
read name
```
### 2. read with prompt
```
read -p "Enter your name: " name
```
### 3. Silent read (passwords)
```
read -sp "Enter password: " password
```

---

## Section D: Conditionals (if / else / elif)
### 1. Basic if
```bash
if [ condition ]; then
    commands
fi
```
### 2. if-else
```bash
if [ condition ]; then
    commands
else
    other commands
fi
```
### 3. elif chain
```bash
if [ cond1 ]; then
    ...
elif [ cond2 ]; then
    ...
else
    ...
fi
```
### Test Operators
| Operator | Meaning                         |
| -------- | ------------------------------- |
| `!`      | NOT                             |
| `-f`     | File exists & is a regular file |
| `-d`     | Directory exists                |
| `-e`     | File/directory exists           |
| `-r`     | Readable                        |
| `-w`     | Writable                        |
| `-x`     | Executable                      |
| `-s`     | File size > 0                   |
| `-z`     | Empty string                    |
| `-n`     | Non-empty string                |
| `=`      | String equality                 |
| `!=`     | String not equal                |
| `-eq`    | Numeric equality                |
| `-gt`    | Numeric greater than            |
| `-lt`    | Numeric less than               |

**Difference between `=` and `-eq`**
- String comparison
```
[ "001" = "1" ]   # false
```
- Numeric comparison:
```
[ 001 -eq 1 ]     # true
```

--- 

## Section E: Loops
### 1. for Loop
```bash
for item in a b c; do
    echo "$item"
done
```
### 2. while Loop
```bash
while [ condition ]; do
    commands
done
```




