Matrix path finder 
=============

Currently a matrix is hardcoded in the file like this: 
```
[
    [1,1,1,1],
    [0,1,1,0],
    [0,1,0,1],
    [0,1,0,1],
    [1,1,1,1],
    [1,0,0,0],
    [1,1,1,9]
]

```

Just run `ruby main.rb`

#### This code is based in the following rules

Given the following 2d matrix (this is a sample input, you should consider alternative inputs):

```
[[1,1,1,1],
[0,1,1,0],
[0,1,0,1],
[0,1,9,1],
[1,1,1,1]]
```

Create a virtual robot, that can walk up, right, left and bottom. The robot cannot leave the borders.

Find the shortest path to `9`. `1` is a walkable place. `0` is a hole, and you must avoid it.

Your initial position is `0x0`, the `9` position is `2x3`.
