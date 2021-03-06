
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
                        
                        cost: maximum number/fraction of match cost 
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

+ “相似”是一個需要被定義的概念, max.distance 便是定義“相似”的參數
+ 他定義“相似”運作的方法, 便是限制修改次數。

+ 如 "appl" 與 "apple", "appl" 轉換為 "apple" 便是在字串
+ 最後添加 "e", 故需要一次修改，若我們定義 max.distance = 3, 
+ 代表 3 次修改內我們都認為相似, 故此時 "appl" 與 "apple" 
+ 我們認為他們是相似的。 若我們定義 max.distance = 0, 
+ 因為 0 < 1, 故我們認為他們不是相似的。 

+ max.distance 可以輸入 int or double,
+ int : x 中字串可以調整『整數』次。
+ double : 輸入介於 0 - 1 的小數,  代表 pattern 字串長度的百分之幾
+ 看 example2


@@ ignore.case @@ :    if FALSE, the pattern matching is case sensitive 
                       and if TRUE, case is ignored during matching.

+ TRUE : 忽略大小寫的差異


@@ value @@ :    if FALSE, a vector containing the (integer) indices of 
                 the matches determined is returned and if TRUE, a vector 
                 containing the matching elements themselves is returned.
                 
+ TRUE :  回傳 x 中相似的字串, 而非位置


@@ fixed @@ :   logical. If TRUE (default), the pattern is matched literally 
                (as is). Otherwise, it is matched as a regular expression.
                
+ TRUE : pattern 使用字面來使用
+ FALSE : regex  來時使用

@@ useBytes @@ :    logical. in a multibyte locale, should the comparison be character-by-character (the default) or byte-by-byte.

+ TRUE : 使用 byte 對照
- FALSE: 使用 char 對照

```

### example1

```r
x <- c("appl", "aplle", "apple", "banana")

agrep("apple", x)
# return is 1, 2, 3

agrepl("apple", x)
# return is TRUE  TRUE  TRUE FALSE

# agrepl is agrep with logical return
```


### example2 
```r
agrep("laysy", c("1 lazy", "1", "1 LAZY"), max.distance = 1L )
# interger(0)

agrep("laysy", c("1 lazy", "1", "1 LAZY"), max.distance = 0.9 )
# 1 2 3

agrep("laysy", c("1 lazy", "1", "1 LAZY"), max.distance = 1.01 )
# 1
```
