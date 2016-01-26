### Memoization

def fib(n)
  if n==1 || n==2
    return 1
  else
    return fib(n-1) + fib(n-2)
  end
end


### Radix Sort

We can think of sorting strings in alphabetical order. We create 26 buckets for all letters in the alphabet.

We start by putting our last letter in the correct order and construct our strings in backwards order into the buckets.

Time complexity: O(wn) where w is the number of buckets that we need in order to sort. Space complexity is very large.

### QuickSort (w/ pathological input)

You need to somehow pick your pivot at random or pick from the middle of the array, because if you are sorting an already sorted array using your first index as the pivot, you have terrible time complexity.

## Unsorted Array Time complexity
* Find => O(n)
* Insert => O(1) amortized
* Delete => O(n)

## Sorted Array Time complexity
* Find => O(log n)
* Insert => O(n)
* Delete => O(n)

## Min Heap Time complexity
* Find => O(n)
* Insert => O(log n)
* Delete => O(log n)

## Binary Search tree
- Left subtree needs to be smaller than the parent node
- Right subtree needs to be bigger than the parent node

### Operations for Binary Search tree (find)
- Start @ root
- In-order traversal left child
- Print node's value
- In-order traversal of right subtree

### Deletion rules for BST

Deletion is easy if a leaf has no children
Deletion is still easy if there is only one child
  -delete parent and promote child to parent's position

If we want to delete something with two children, we look at the max of the left
subtree and the min of the right subtree. Either one of these two nodes can take the place of the deleted element.
