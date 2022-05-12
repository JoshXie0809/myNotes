### all:  Are All Values True?
>  向量元素皆為TRUE?

```diff

@@ Description @@ 

Given a set of logical vectors, are all of the values true?
+ 輸入一個布林向量, 全部為 TRUE 嗎?
example1


@@ Usage @@
all(..., na.rm = FALSE)


@@ Arguments @@

...  zero or more logical vectors. Other objects of zero length are ignored, 
     and the rest are coerced to logical ignoring any class.

+ 所有輸入的資料型態都會被強制轉換為邏輯值


na.rm 	logical. If true NA values are removed before the result is computed.
+ 是否刪除 NA, TRUE 刪除 
example2
```

### example1
```r
x <- c(T, F, F, T)
all(x)
# FALSE

x <- c(1, 2, 4, 5, 10)
all(x > 0)
# TRUE

a0 <- 1
a1 <- 2
a2 <- 3
all(a0 < 4, a1 > 5, a2 > 2)
# FALSE


all(logical(0))
# TRUE
```

### example2
```r
all(NA)
# NA

all(NA, na.rm = T)
# T
```
