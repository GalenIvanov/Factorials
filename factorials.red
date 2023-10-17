Red [
    Title: "Factorial tests using different approaches"
    Author: "Galen Ivanov"
]

fact-iter: function [
    "Iterative implementation of factorial function"
    n [integer!]
][
    either n < 0 [
        return "Factorial of a negative number is undefined!"
    ][
        f: 1
        repeat i n [f: f * i]
        f
    ]    
]

; The following implementation of factorial function is taken from Pharo 9.0 method.
; It's presumably more effective for large numbers, because the number 
; of multiplications is twice less than the naive iterative implementation.  
; Slower here than fact-iter for n <= 12 (the limit of 32-bit integer)
  
fact-iter-2: function [
    "Alternative implementation of iterative function"
    n [integer!]
][
    if n < 3 [
        if n < 0 [return "Factorial of a negative number is undefined!"]
        return either n > 0 [n][1] 
    ]

    acc: nex: 2
    nexnext: 10
    
    loop n >> 1 - 1 [
        nex: nex + nexnext
        nexnext: nexnext + 8
        acc: acc * nex
    ]
    
    if odd? n [acc: acc * n]
    acc
]

fact-rec: function [
    "Recursive implementation of factorial function"
    n [integer!]
][
    either n < 0 [
        return "Factorial of a negative number is undefined!"
    ][
        either n < 2 [1][n * fact-rec n - 1]
    ]
]

fact-mem: function [
    "Memoized implementation of recursive factorial finction"
    n [integer!]
][
    either n < 0 [
        return "Factorial of a negative number is undefined!"
    ][
        m: #(0 1)
        any [m/:n m/:n: n * fact-mem n - 1]
    ]
]


print "Alternative Iterative version::"
repeat n 14 [print [pad/left n - 2 2 "->" fact-iter-2 n - 2 ]]
print ""

print "Results of 100000 function calls with argument 12: "
print ["Iterative   |" time-it [loop 100000 [fact-iter 12]]]
print ["Iterative-2 |" time-it [loop 100000 [fact-iter-2 12]]]
print ["Recursive   |" time-it [loop 100000 [fact-rec 12]]]
print ["Memoized    |" time-it [loop 100000 [fact-mem 12]]]