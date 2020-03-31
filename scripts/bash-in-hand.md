Bash is a Unix shell written by [Brian Fox][] for the GNU Project as a free software replacement for the [Bourne shell](https://en.wikipedia.org/wiki/Bourne_shell). It was released in 1989 and has been distributed as the Linux and macOS default shell for a long time.

In this handbook, I'm going to describe the most important concepts in bash with examples. I hope this compendium will be helpful to you.

# Shells and modes

The user bash shell can work in interactive and non-interactive login shells.

1. **interactive login shell:** You log into a remote computer via, for example `ssh`. Alternatively, you drop to a tty on your local machine (Ctrl+Alt+F1) and log in there.
2. **interactive non-login shell:** Open a new terminal.
3. **non-interactive non-login shell:** Run a script. All scripts run in their own sub shell and this shell is not interactive. It only opens to execute the script and closes immediately once the script is finished.
4. **non-interactive login shell:** This is extremely rare, and you're unlikely to encounter it. One way of launching one is `echo command | ssh server`. When `ssh` is launched without a command (so `ssh` instead of `ssh command` which will run `command` on the remote shell) it starts a login shell. If the `stdin` of the `ssh` is not a tty, it starts a non-interactive shell. This is why `echo command | ssh server` will launch a non-interactive login shell. You can also start one with `bash -l -c command`.

# Comments

Scripts may contain _comments_. Comments are special statements ignored by the `shell` interpreter. They begin with a `#` symbol and continue on to the end of the line.

For example:

```bash
#!/bin/bash
# This script will print your username.
whoami
```

> **Tip**: Use comments to explain what your script does and _why_.

# Variables

Like in most programming languages, you can also create variables in bash.

Bash knows no data types. Variables can contain only numbers or a string of one or more characters. There are three kinds of variables you can create: local variables, environment variables and variables as _positional arguments_.

## Local variables

**Local variables** are variables that exist only within a single script. They are inaccessible to other programs and scripts.

A local variable can be declared using `=` sign (as a rule, there **should not** be any spaces between a variable's name, `=` and its value) and its value can be retrieved using the `$` sign. For example:

```bash
username="knoldus"  # declare variable
echo $username          # display value
unset username          # delete variable
```

We can also declare a variable local to a single function using the `local` keyword. Doing so causes the variable to disappear when the function exits.

```bash
local local_var="I'm a local value"
```

## Environment variables

**Environment variables** are variables accessible to any program or script running in current shell session. They are created just like local variables, but using the keyword `export` instead.

```bash
export GLOBAL_VAR="I'm a global variable"
```

There are _a lot_ of global variables in bash. You will meet these variables fairly often, so here is a quick lookup table with the most practical ones:

| Variable  | Description                                                  |
| :-------- | :----------------------------------------------------------- |
| `$HOME`   | The current user's home directory.                           |
| `$PATH`   | A colon-separated list of directories in which the shell looks for commands. |
| `$PWD`    | The current working directory.                               |
| `$RANDOM` | Random integer between 0 and 32767.                          |

# Arrays

Like in other programming languages, an array in bash is a variable that allows you to refer to multiple values. In bash, arrays are also zero-based, that is, the first element in an array has index 0.

When dealing with arrays, we should be aware of the special environment variable `IFS`. **IFS**, or **Input Field Separator**, is the character that separates elements in an array. The default value is an empty space `IFS=' '`.

## Array declaration

In bash you create an array by simply assigning a value to an index in the array variable:

```bash
fruits[0]=Apple
fruits[1]=Pear
fruits[2]=Plum
```

Array variables can also be created using compound assignments such as:

```bash
fruits=(Apple Pear Plum)
```

Individual array elements are expanded similar to other variables:

```bash
echo ${fruits[1]} # Pear
```

The entire array can be expanded by using `*` or `@` in place of the numeric index:

```bash
echo ${fruits[*]} # Apple Pear Plum
echo ${fruits[@]} # Apple Pear Plum
```

Array slice

Besides, we can extract a slice of array using the _slice_ operators:

```bash
echo ${fruits[@]:0:2} # Apple Desert fig
```

In the example above, `${fruits[@]}` expands to the entire contents of the array, and `:0:2` extracts the slice of length 2, that starts at index 0.

## Adding elements into an array

Adding elements into an array is quite simple too. Compound assignments are specially useful in this case. We can use them like this:

```bash
fruits=(Orange "${fruits[@]}" Banana Cherry)
echo ${fruits[@]} # Orange Apple Desert fig Plum Banana Cherry
```

The example above, `${fruits[@]}` expands to the entire contents of the array and substitutes it into the compound assignment, then assigns the new value into the `fruits` array mutating its original value.

## Deleting elements from an array

To delete an element from an array, use the `unset` command:

```bash
unset fruits[0]
echo ${fruits[@]} # Apple Desert fig Plum Banana Cherry
```

# Streams, pipes and lists

Bash has powerful tools for working with other programs and their outputs. Using streams we can send the output of a program into another program or file and thereby write logs or whatever we want.

Pipes give us opportunity to create conveyors and control the execution of commands.

It is paramount we understand how to use this powerful and sophisticated tool.

## Streams

Bash receives input and sends output as sequences or **streams** of characters. These streams may be redirected into files or one into another.

There are three descriptors:

| Code | Descriptor | Description          |
| :--: | :--------: | :------------------- |
| `0`  | `stdin`    | The standard input.  |
| `1`  | `stdout`   | The standard output. |
| `2`  | `stderr`   | The errors output.   |

Redirection makes it possible to control where the output of a command goes to, and where the input of a command comes from. For redirecting streams these operators are used:

| Operator | Description                                  |
| :------: | :------------------------------------------- |
| `>`      | Redirecting output                           |
| `&>`     | Redirecting output and error output          |
| `&>>`    | Appending redirected output and error output |
| `<`      | Redirecting input                            |
| `<<`     | [Here documents](http://tldp.org/LDP/abs/html/here-docs.html) syntax |
| `<<<`    | [Here strings](http://www.tldp.org/LDP/abs/html/x17837.html) |

Here are few examples of using redirections:

```bash
# output of ls will be written to list.txt
ls -l > list.txt

# append output to list.txt
ls -a >> list.txt

# all errors will be written to errors.txt
grep da * 2> errors.txt

# read from errors.txt
less < errors.txt
```

## Pipes

We could redirect standard streams not only in files, but also to other programs. **Pipes** let us use the output of a program as the input of another.

In the example below, `command1` sends its output to `command2`, which then passes it on to the input of `command3`:

    command1 | command2 | command3

Constructions like this are called **pipelines**.

In practice, this can be used to process data through several programs. For example, here the output of `ls -l` is sent to the `grep` program, which  prints only files with a `.md` extension, and this output is finally sent to the `less` program:

    ls -l | grep .md$ | less

The exit status of a pipeline is normally the exit status of the last command in the pipeline. The shell will not return a status until all the commands in the pipeline have completed. If you want your pipelines to be considered a failure if any of the commands in the pipeline fail, you should set the pipefail option with:

    set -o pipefail

## Lists of commands

A **list of commands** is a sequence of one or more pipelines separated by `;`, `&`, `&&` or `||` operator.

If a command is terminated by the control operator `&`, the shell executes the command asynchronously in a subshell. In other words, this command will be executed in the background.

Commands separated by a `;` are executed sequentially: one after another. The shell waits for the finish of each command.

```bash
# command2 will be executed after command1
command1 ; command2

# which is the same as
command1
command2
```

Lists separated by `&&` and `||` are called _AND_ and _OR_ lists, respectively.

The _AND-list_ looks like this:

```bash
# command2 will be executed if, and only if, command1 finishes successfully (returns 0 exit status)
command1 && command2
```

The _OR-list_ has the form:

```bash
# command2 will be executed if, and only if, command1 finishes unsuccessfully (returns code of error)
command1 || command2
```

The return code of an _AND_ or _OR_ list is the exit status of the last executed command.

------

------

**Working with the file system:**

| Primary       | Meaning                                                      |
| :-----------: | :----------------------------------------------------------- |
| `[ -e FILE ]` | True if `FILE` **e**xists.                                   |
| `[ -f FILE ]` | True if `FILE` exists and is a regular **f**ile.             |
| `[ -d FILE ]` | True if `FILE` exists and is a **d**irectory.                |
| `[ -s FILE ]` | True if `FILE` exists and not empty (**s**ize more than 0).  |
| `[ -r FILE ]` | True if `FILE` exists and is **r**eadable.                   |
| `[ -w FILE ]` | True if `FILE` exists and is **w**ritable.                   |
| `[ -x FILE ]` | True if `FILE` exists and is e**x**ecutable.                 |
| `[ -L FILE ]` | True if `FILE` exists and is symbolic **l**ink.              |
| `[ FILE1 -nt FILE2 ]` | FILE1 is **n**ewer **t**han FILE2.                   |
| `[ FILE1 -ot FILE2 ]` | FILE1 is **o**lder **t**han FILE2.                   |

**Working with strings:**

| Primary        | Meaning                                                     |
| :------------: | :---------------------------------------------------------- |
| `[ -z STR ]`   | `STR` is empty (the length is **z**ero).                    |
| `[ -n STR ]`   |`STR` is not empty (the length is **n**on-zero).             |
| `[ STR1 == STR2 ]` | `STR1` and `STR2` are equal.                            |
| `[ STR1 != STR2 ]` | `STR1` and `STR2` are not equal.                        |

**Arithmetic binary operators:**

| Primary             | Meaning                                                |
| :-----------------: | :----------------------------------------------------- |
| `[ ARG1 -eq ARG2 ]` | `ARG1` is **eq**ual to `ARG2`.                         |
| `[ ARG1 -ne ARG2 ]` | `ARG1` is **n**ot **e**qual to `ARG2`.                 |
| `[ ARG1 -lt ARG2 ]` | `ARG1` is **l**ess **t**han `ARG2`.                    |
| `[ ARG1 -le ARG2 ]` | `ARG1` is **l**ess than or **e**qual to `ARG2`.        |
| `[ ARG1 -gt ARG2 ]` | `ARG1` is **g**reater **t**han `ARG2`.                 |
| `[ ARG1 -ge ARG2 ]` | `ARG1` is **g**reater than or **e**qual to `ARG2`.     |

Conditions may be combined using these **combining expressions:**

| Operation      | Effect                                                      |
| :------------: | :---------------------------------------------------------- |
| `[ ! EXPR ]`   | True if `EXPR` is false.                                    |
| `[ (EXPR) ]`   | Returns the value of `EXPR`.                                |
| `[ EXPR1 -a EXPR2 ]` | Logical _AND_. True if `EXPR1` **a**nd `EXPR2` are true. |
| `[ EXPR1 -o EXPR2 ]` | Logical _OR_. True if `EXPR1` **o**r `EXPR2` are true.|

Sure, there are more useful primaries and you can easily find them in the [Bash man pages](http://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html).

## Using an `if` statement

`if` statements work the same as in other programming languages. If the expression within the braces is true, the code between `then` and `fi` is executed.  `fi` indicates the end of the conditionally executed code.

```bash
# Single-line
if [[ 1 -eq 1 ]]; then echo "true"; fi

# Multi-line
if [[ 1 -eq 1 ]]; then
  echo "true"
fi
```

Likewise, we could use an `if..else` statement such as:

```bash
# Single-line
if [[ 2 -ne 1 ]]; then echo "true"; else echo "false"; fi

# Multi-line
if [[ 2 -ne 1 ]]; then
  echo "true"
else
  echo "false"
fi
```

Sometimes `if..else` statements are not enough to do what we want to do. In this case we shouldn't forget about the existence of `if..elif..else` statements, which always come in handy.

Look at the example below:

```bash
if [[ `uname` == "Adam" ]]; then
  echo "Do not eat an apple!"
elif [[ `uname` == "Eva" ]]; then
  echo "Do not take an apple!"
else
  echo "Apples are delicious!"
fi
```

## Using a `case` statement

If you are confronted with a couple of different possible actions to take, then using a `case` statement may be more useful than nested `if` statements. For more complex conditions use `case` like below:

```bash
case "$extension" in
  "jpg"|"jpeg")
    echo "It's image with jpeg extension."
  ;;
  "png")
    echo "It's image with png extension."
  ;;
  "gif")
    echo "Oh, it's a giphy!"
  ;;
  *)
    echo "Woops! It's not image!"
  ;;
esac
```

Each case is an expression matching a pattern. The `|` sign is used for separating multiple patterns, and the `)` operator terminates a pattern list. The commands for the first match are executed. `*` is the pattern for anything else that doesn't match the defined patterns. Each block of commands should be divided with the `;;` operator.

# Loops

Here we won't be surprised. As in any programming language, a loop in bash is a block of code that iterates as long as the control conditional is true.

There are four types of loops in Bash: `for`, `while`, `until` and `select`.

## `for` loop

The `for` is very similar to its sibling in C. It looks like this:

```bash
for arg in elem1 elem2 ... elemN
do
  # statements
done
```

During each pass through the loop, `arg` takes on the value from `elem1` to `elemN`. For example, if we need to move all `.bash` files into the `script` folder and then give them execute permissions, our script would look like this:

```bash
#!/bin/bash

for FILE in $HOME/*.bash; do
  mv "$FILE" "${HOME}/scripts"
  chmod +x "${HOME}/scripts/${FILE}"
done
```

## `while` loop

The `while` loop tests a condition and loops over a sequence of commands so long as that condition is _true_. A condition is nothing more than a [primary](#primary-and-combining-expressions) as used in `if..then` conditions. So a `while` loop looks like this:

```bash
while [[ condition ]]
do
  # statements
done
```

Just like in the case of the `for` loop, if we want to write `do` and condition in the same line, then we must use a semicolon before `do`.

A working example might look like this:

```bash
#!/bin/bash

# Squares of numbers from 0 through 9
x=0
while [[ $x -lt 10 ]]; do # value of x is less than 10
  echo $(( x * x ))
  x=$(( x + 1 )) # increase x
done
```

## `until` loop

The `until` loop is the exact opposite of the `while` loop. Like a `while` it checks a test condition, but it keeps looping as long as this condition is _false_:

```bash
until [[ condition ]]; do
  #statements
done
```

## `select` loop

The `select` loop helps us to organise a user menu. It has almost the same syntax as the `for` loop:

```bash
select answer in elem1 elem2 ... elemN
do
  # statements
done
```

The `select` prints all `elem1..elemN` on the screen with their sequence numbers, after that it prompts the user. Usually it looks like `$?` (`PS3` variable). The answer will be saved in `answer`. If `answer` is the number between `1..N`, then `statements` will execute and `select` will go to the next iteration — that's because we should use the `break` statement.

A working example might look like this:

```bash
#!/bin/bash

PS3="Choose the package manager: "
select ITEM in npm gem pip
do
  echo -n "Enter the package name: " && read PACKAGE
  case $ITEM in
    npm)   npm   install $PACKAGE ;;
    gem)   gem   install $PACKAGE ;;
    pip)   pip   install $PACKAGE ;;
  esac
  break # avoid infinite loop
done
```

This example, asks the user what package manager {s,he} would like to use. Then, it will ask what package we want to install and finally proceed to install it.

If we run this, we will get:

```
$ ./my_script
1) bower
2) npm
3) gem
4) pip
Choose the package manager: 2
Enter the package name: bash-handbook
<installing bash-handbook>
```



# Functions

In scripts we have the ability to define and call functions. As in any programming language, functions in bash are chunks of code, but there are differences.

In bash, functions are a sequence of commands grouped under a single name, that is the _name_ of the function. Calling a function is the same as calling any other program, you just write the name and the function will be _invoked_.

We can declare our own function this way:

```bash
my_func () {
  # statements
}

my_func # call my_func
```

We must declare functions before we can invoke them.

Below is a function that takes a name and returns `0`, indicating successful execution.

```bash
# function with params
greeting () {
  if [[ -n $1 ]]; then
    echo "Hello, $1!"
  else
    echo "Hello, unknown!"
  fi
  return 0
}

greeting Manas  # Hello, Manas!
greeting        # Hello, unknown!
```



For more info run the man page of bash. 

