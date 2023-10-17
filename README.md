# Factorials
Four different implementations of factorial function in Red

I tried four imlementations of a factorial function:
- Iterative
- Optimized iterative, taken from Pharo 9.0 method
- Recursive
- Memoized

Here are the results of timing 100000 function calls with argument 12: 
(Red is currently 32-bit and 12 is the greatest integer for which factorial does not lead to number overflow )

Iterative   | 0:00:00.445996
Iterative-2 | 0:00:00.541998
Recursive   | 0:00:01.43899
Memoized    | 0:00:00.101999
