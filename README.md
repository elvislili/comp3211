Part 1

Implement a Scheme function permute to print all permutations of a given list of any length.

For example:

(permute '(a e d))
(a e d)
(a d e)
(e a d)
(e d a)
(d a e)
(d e a)
#f
(permute '())
#f
(permute '(a))
(a)
#f

Notice that permute always returns #f. The permutations must be displayed to standard output, not returned. This is to avoid building enormous lists in memory (consider how many permutations there are of a list of length 10).

Part 2

Extend your Scheme function permute from Part 1, to implement a new function anagram that takes an additional argument consisting of a list of symbols representing legal words. Your new function will print all permutations of a given list of any length, such that appending the symbols in the permuted list gives a legal word.

For example:

(define dictionary '(a act ale at ate cat eat etc tea))
(anagram dictionary '(a e t))
(a t e)
(e a t)
(t e a)
#f
(anagram dictionary '(a t c))
(a c t)
(c a t)
#f
(anagram dictionary '(a))
(a)
#f
(anagram '() '(a e t))
#f


(Hint: You may wish to recall some potentially useful standard functions like symbol->string, string->symbol, string-append, etc.)

Notice that anagram always returns #f. The legal permutations must be displayed to standard output, not returned. This is to avoid building enormous lists in memory (consider how many permutations there are of a list of length 10).
