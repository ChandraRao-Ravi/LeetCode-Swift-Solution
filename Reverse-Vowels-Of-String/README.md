# Reverse Vowels in a String (Swift)

This project contains a Swift implementation of a function that reverses only the vowels in a given string while keeping all other characters in their original positions.

## Problem Statement

Given a string `s`, reverse only all the vowels in the string and return the resulting string.

- Vowels are: `a, e, i, o, u` (both lowercase and uppercase).
- Consonants and other characters remain in the same position.
- The relative order of vowels is reversed.

**Example**

- Input: `s = "hello"`
- Output: `"holle"`

- Input: `s = "leetcode"`
- Output: `"leotcede"`

## Approach

The solution uses a **two-pointer** technique:

1. Convert the input string into an array of characters for in-place modification.
2. Define a `Set<Character>` containing all vowels (both lowercase and uppercase) for O(1) lookup.
3. Use two indices:
   - `left` starting from the beginning of the array.
   - `right` starting from the end of the array.
4. Move `left` forward until it points to a vowel.
5. Move `right` backward until it points to a vowel.
6. When both `left` and `right` point to vowels and `left < right`, swap them.
7. Continue until `left >= right`.
8. Convert the character array back to a `String` and return it.

This runs in:

- Time complexity: **O(n)** — each character is visited at most once.
- Space complexity: **O(n)** — for the character array (in-place relative to that).
