
## How it Works (Step-by-Step)
1. **Convert** the input strings `word1` and `word2` into arrays of characters to allow for indexed access.
2. **Initialize** two pointers, `i` and `j`, both starting at 0, and an empty `result` string.
3. **Iterate** using a `while` loop that runs as long as either pointer is within the bounds of its respective array.
4. **Append from word1**: If the pointer `i` is less than the count of `array1`, append the character at `array1[i]` to `result` and increment `i`.
5. **Append from word2**: If the pointer `j` is less than the count of `array2`, append the character at `array2[j]` to `result` and increment `j`.
6. **Return** the final `result` string once both arrays have been exhausted.

## Example
**Input:** `word1 = "abc"`, `word2 = "pqr"`

1. `i = 0, j = 0`: Append 'a', Append 'p'. `result = "ap"`
2. `i = 1, j = 1`: Append 'b', Append 'q'. `result = "apbq"`
3. `i = 2, j = 2`: Append 'c', Append 'r'. `result = "apbqcr"`
4. **Return:** `"apbqcr"`


Content Summary
The .md file includes:
• Problem Description: Explains the alternating merge logic and handling different string lengths.
• Complexity Analysis: Details the linear O(n + m) time and space complexity.
• Swift Implementation: The code you provided, clean and formatted.
• How it Works (Step-by-Step): A clear, numbered logic walkthrough.
• Example Case: A trace of the pointers and the building of the result string.
