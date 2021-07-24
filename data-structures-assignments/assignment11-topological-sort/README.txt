Assignment 11. Topological Sorting

There is a directed graph, the vertices are enumerated
from 0 to 9. It is represented as an adjacency lists. 
You can check, if it is a DAG (i.e. there is no loop).


Part 1: Use the adjacency lists to draw a graph with nodes
and edges as arrows. 

Part 2: Add new edges (and preserve the DAG property). 
(There is a pre-defined topology order 
{0,3,6,9} -> {1,4,7} -> {2,5,8}. 
and we want to add something from 1st to 2nd group; 
from 2nd to the 3rd group; and from the 1st to the 3rd group) 

Part 3: Run the DFS algorithm - mark the 
discovery and finish timestamps.

Part 4: Run the topological sorting. List the vertices in 
their topological sorting order. 