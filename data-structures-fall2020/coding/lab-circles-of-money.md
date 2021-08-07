# Circles of Prizes 

**Memory limit**: 4 MB  
**Time limit**: 0.2 second  
**Input file**: `honey-in01.txt`  
**Output**: `honey-out01.txt`

---

## Description

There are altogether $n$ money prizes arranged in a circle. 
Each prize is an integer number representing a gain or a loss
in euros (positive integers represent gains, negative ones represent losses). 

There are $n$ players vying for the prizes who make their moves in a predetermined order.
At every move some player removes some prizes: s/he must take 
at least one prize, or any larger number - as long as they form a contiguous 
arc on the circle without omissions. It is also possible to remove all the remaining prizes in 
a single move.

Every player wants to maximize the payoff (the total resulting from adding up the values
from all the taken prizes). After some player removes his prizes from the circle, 
some prizes that were not next to each other, may become neighbors (if everything that
separated them is removed). After the last prize is removed, the game finishes.

<!--
https://en.wikipedia.org/wiki/Maximum_subarray_problem
[Source of Inspiration](https://practice.geeksforgeeks.org/problems/kadanes-algorithm/0).
https://www.geeksforgeeks.org/must-do-coding-questions-for-companies-like-amazon-microsoft-adobe/
-->

**Input:**  
An input file consists of two lines:  
The first line has a single number $n$ - the number of prizes.
The second line is a sequence $A[1]\,\ldots\,A[n]$ of exactly $n$ space-separated integers - the values of the prizes
arranged counter-clockwise.

**Output:**  
The first line of the output is a positive integer $T$: how many moves were completed (how many players got any prize at all).
It is followed by $T$ more lines. Each line has two space-separated numbers: The first number shows the 
first number of the removed prize; the second number shows how many prizes were 
removed during that move. (The numbers of prizes are indexed from $1$, they do not change as the game progresses.)
If all prizes are removed, then the first number of the removed prize should be the smallest possible (i.e. 
in case of ambiguity, the prize counting starts from the smallest number).

**Constraints:**

* $n > 2$ and $n < 10^7$,
* $-10^{10} \leq A[i] \leq 10^{10}$, for all $i \in [1,n]$. 

### Example 1

The content of input file `circles-in01.txt`:

```
5
1 2 3 -2 5
```

The content of output file `circles-out01.txt`:

```
1
1 5
```

### Example 2

The content of input file `circles-in02.txt`:

```
4
-1 -2 -3 -4
```

The content of output file `circles-out02.txt`:

```
4
1 1
2 1
3 1
4 1
```

### Example 3

The content of input file `circles-in03.txt`:

```
9
-2 1 -3 4 -1 2 1 -5 4
```

The content of output file `circles-out02.txt`:

```
6
4 4
9 1
2 1
1 1
3 1 
8 1
```

