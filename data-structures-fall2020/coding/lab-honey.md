# Honey: An Uninterrupted Experience

**Memory limit**: 4 MB  
**Time limit**: 0.2 second  
**Input file**: `honey-in01.txt`  
**Output**: `honey-out01.txt`

---

## Description

Winnie-the-Pooh has $n$ jars placed on a long branch. They 
are all arranged in a single line. Every jar contains some amount of honey
expressed as a positive integer number of ounces (one ounce (oz) is $28.349523125$ grams 
or $1/16$ of a pound).

He intends to eat exactly $m$ ounces of honey. He can do this by emptying a single jar or any number of consecutive jars.
You should count the total number of ways to do this and for each way 
find the starting and and the ending jar
(their numbers start from $1$). Different ways may overlap.
<!--
[Source of Inspiration](https://practice.geeksforgeeks.org/problems/subarray-with-given-sum/0).
https://www.geeksforgeeks.org/must-do-coding-questions-for-companies-like-amazon-microsoft-adobe/
-->

**Input:**  
An input file consists of two lines:  
The first line of an input file is two positive integers $n$ and $m$, where $m$ is the number of jars and $m$ is the required amount of honey.
The second line is an (unsorted) sequence $A[1]\,\ldots\,A[n]$ of exactly $n$ space-separated integers denoting the amounts of honey in the jars.

**Output:**  
On the first line output a non-negative integer $W$: the number of possibilities. 
If it is impossible, output just the number $0$. If $W>0$, then $W$ more lines should follow. 
Every line shows the starting and ending positions (indexing from $1$, both endpoints are included).

**Constraints:**

* $1 \leq n \leq 10^7$,
* $1 \leq A[i] \leq 10^{10}$, for all $i \in [1,n]$. 

### Example 1

The content of input file `honey-in01.txt`:

```
5 13
1 2 4 7 6
```

The content of output file `honey-out01.txt`:

```
2
2 4
4 5
```

### Example 2

The content of input file `honey-in02.txt`:

```
10 15
1 2 3 4 5 6 7 8 9 10
```

The content of output file `honey-out02.txt`:

```
3
1 5
4 6
7 8
```
