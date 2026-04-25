## How it Works (Step-by-Step)
### Concatenation check
Form str1 + str2 and str2 + str1.

If these two concatenations are not equal, then there is no common repeating base pattern, so return "" immediately.

### Length GCD idea
If a non-empty string x divides both str1 and str2, then both str1 and str2 are made by repeating x some number of times.

That implies the length of x must divide both len(str1) and len(str2), so len(x) must be the greatest common divisor (GCD) of the two lengths.

### Compute GCD of lengths
Compute g = gcd(len(str1), len(str2)) using the standard Euclidean algorithm on integers.

### Take the prefix
The candidate answer x is simply the prefix of str1 of length g, because str1 (and str2) are both repetitions of that base substring when the concatenation check passes.

### Return the result
Return this prefix as the greatest common divisor of the two strings. If the earlier concatenation check failed, you would have already returned "".

## Example Walkthrough
### Example 1
### Input:

str1 = "ABCABC"

str2 = "ABC"

### Step-by-step:

### Concatenation check:

str1 + str2 = "ABCABCABC"

str2 + str1 = "ABCABCABC"
→ equal, so a common base exists.

Lengths: len1 = 6, len2 = 3. Compute gcd(6, 3) = 3.

Take prefix of length 3 from str1: "ABCABC"[0..<3] = "ABC".

Output: "ABC".

