
### agrep : Approximate String Matching (Fuzzy Matching)

> 大略配對字串方法

```diff
@@ Description @@

Searches for approximate matches to pattern (the first argument) 
within each element of the string x (the second argument) 

using the generalized Levenshtein edit distance
(the minimal possibly weighted number of insertions, 
deletions and substitutions needed to transform 
one string into another).

+ 依照傳入的 pattern (模式字串), 來比對 x 中是否有相似的字串？
+ 使用 generalized Levenshtein edit distance: 需要多少次修
+ 改才能使字串轉換為另一個字串
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@ Usage @@
agrep(pattern, x, max.distance = 0.1, costs = NULL,
      ignore.case = FALSE, value = FALSE, fixed = TRUE,
      useBytes = FALSE)

agrepl(pattern, x, max.distance = 0.1, costs = NULL,
       ignore.case = FALSE, fixed = TRUE, useBytes = FALSE)
       
```

#### example
