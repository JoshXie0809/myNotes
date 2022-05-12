
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
+ 改才能使字串轉換為另一個字串, 使用此方法作為判斷是否相似的依據。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@ Usage @@
agrep(pattern, x, max.distance = 0.1, costs = NULL,
      ignore.case = FALSE, value = FALSE, fixed = TRUE,
      useBytes = FALSE)

agrepl(pattern, x, max.distance = 0.1, costs = NULL,
       ignore.case = FALSE, fixed = TRUE, useBytes = FALSE)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@ Arguments @@
@@ pattern @@ :    a non-empty character string to be matched. 
                   For fixed = FALSE this should contain an 
                   extended regular expression. 
                   Coerced by as.character to a string if possible.
            
+ 一個不為空的字串, 作為 x 比對的標準。
+ 當 fixed = FALSE 時, pattern 將被視為 regex (正規表達式)
+ 每次呼叫 agrep / agrepl 時 pattern 都會被使用 as.character()


@@ x @@ :     character vector where matches are sought. 
              Coerced by as.character to a character vector if possible.
              
+ 一個不為空的字串向量, 在其中找尋是否存在相似 pattern 的存在。
+ 每次呼叫 agrep / agrepl 時 x 中字串元素都會被使用 as.character()


@@ max.distance @@ :    Maximum distance allowed for a match. 
                        Expressed either as integer, or as a 
                        fraction of the pattern length times 
                        the maximal transformation cost (will 
                        be replaced by the smallest integer not 
                        less than the corresponding fraction), 
                        or a list with possible components

+ “相似”是一個需要被定義的概念, max.distance 便是定義“相似”的參數

+ 他定義“相似”運作的方法, 便是限制修改次數。

+ 如 "appl" 與 "apple", "appl" 轉換為 "apple" 便是在字串
+ 最後添加 "e", 故需要一次修改，若我們定義 max.distance = 3, 
+ 代表 3 次修改內我們都認為相似, 故此時 "appl" 與 "apple" 
+ 我們認為他們是相似的。 若我們定義 max.distance = 0, 
+ 因為 0 < 1, 故我們認為他們不是相似的。 


@@ cost @@ :    cost: maximum number/fraction of match cost 
                      (generalized Levenshtein distance)
                              
                all:  maximal number/fraction of all transformations 
                      (insertions, deletions and substitutions)
                              
                insertions: maximum number/fraction of insertions
                        
                deletions: maximum number/fraction of deletions
                        
                substitutions: maximum number/fraction of substitutions
                        
                If cost is not given, all defaults to 10%, 
                and the other transformation number bounds 
                default to all. The component names can be 
                abbreviated.
```

#### example

```r
x <- c("appl", "aplle", "apple", "banana")

agrep("apple", x)
# return is 1, 2, 3

agrepl("apple", x)
# return is TRUE  TRUE  TRUE FALSE

# agrepl is agrep with logical return
```
