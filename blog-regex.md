

# Python - Regular Expressions

A *regular expression* is a special sequence of characters that helps you match or find other strings or sets of strings, using a specialised syntax held in a pattern. Regular expressions are widely used in UNIX world. For example,

```
^a...s$
```

**Library used in Python for Regular Expression is re (`import re)`**

The `re` module offers a set of functions that allows us to search a string for a match:

| Function | Description                                                  |
| :------- | :----------------------------------------------------------- |
| findall  | Returns a list containing all matches                        |
| search   | Returns a Match object if there is a match anywhere in the string |
| split    | Returns a list where the string has been split at each match |
| sub      | Replaces one or many matches with a string                   |

## Metacharacters

Metacharacters are characters with a special meaning:

| Character | Description                                                  | Example        |
| :-------- | :----------------------------------------------------------- | :------------- |
| []        | A set of characters                                          | "[a-m]"        |
| \         | Signals a special sequence (can also be used to escape special characters) | "\d"           |
| .         | Any character (except newline character)                     | "he..o"        |
| ^         | Starts with                                                  | "^hello"       |
| $         | Ends with                                                    | "world$"       |
| *         | Zero or more occurrences                                     | "aix*"         |
| +         | One or more occurrences                                      | "aix+"         |
| {}        | Exactly the specified number of occurrences                  | "al{2}"        |
| \|        | Either or                                                    | "falls\|stays" |
| ()        | Capture and group                                            |                |

------

## Special Sequences

A special sequence is a `\` followed by one of the characters in the list below, and has a special meaning:

| Character | Description                                                  | Example           |
| :-------- | :----------------------------------------------------------- | :---------------- |
| \A        | Returns a match if the specified characters are at the beginning of the string | "\AThe"           |
| \b        | Returns a match where the specified characters are at the beginning or at the end of a word | r"\bain" r"ain\b" |
| \B        | Returns a match where the specified characters are present, but NOT at the beginning (or at the end) of a word | r"\Bain" r"ain\B" |
| \d        | Returns a match where the string contains digits (numbers from 0-9) | "\d"              |
| \D        | Returns a match where the string DOES NOT contain digits     | "\D"              |
| \s        | Returns a match where the string contains a white space character | "\s"              |
| \S        | Returns a match where the string DOES NOT contain a white space character | "\S"              |
| \w        | Returns a match where the string contains any word characters (characters from a to Z, digits from 0-9, and the underscore _ character) | "\w"              |
| \W        | Returns a match where the string DOES NOT contain any word characters | "\W"              |
| \Z        | Returns a match if the specified characters are at the end of the string | "Spain\Z"         |

------

## Sets

A set is a set of characters inside a pair of square brackets `[]` with a special meaning:

| Set      | Description                                                  |
| :------- | :----------------------------------------------------------- |
| [arn]    | Returns a match where one of the specified characters (`a`, `r`, or `n`) are present |
| [a-n]    | Returns a match for any lower case character, alphabetically between `a` and `n` |
| [^arn]   | Returns a match for any character EXCEPT `a`, `r`, and `n`   |
| [0123]   | Returns a match where any of the specified digits (`0`, `1`, `2`, or `3`) are present |
| [0-9]    | Returns a match for any digit between `0` and `9`            |
| 0-5      | Returns a match for any two-digit numbers from `00` and `59` |
| [a-zA-Z] | Returns a match for any character alphabetically between `a` and `z`, lower case OR upper case |
| [+]      | In sets, `+`, `*`, `.`, `|`, `()`, `$`,`{}` has no special meaning, so `[+]` means: return a match for any `+` character in the string |

## Match Object

A Match Object is an object containing information about the search and the result.

**Note:** If there is no match, the value `None` will be returned, instead of the Match Object.

The Match object has properties and methods used to retrieve information about the search, and the result:

`.span()` returns a tuple containing the start-, and end positions of the match.
`.string` returns the string passed into the function
`.group()` returns the part of the string where there was a match