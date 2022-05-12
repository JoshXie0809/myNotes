### aList : Lists – Generic and Dotted Pairs

> R 創造資料 List  

```diff
@@ Description @@

Functions to construct, coerce and check for both kinds of R lists.

+ 使用 list() 創造 list 變數 

@@ Usage @@

list(...)
pairlist(...)

as.list(x, ...)
## S3 method for class 'environment'
+ 將 environment 轉換為 list

as.list(x, all.names = FALSE, sorted = FALSE, ...)
as.pairlist(x)

is.list(x)
is.pairlist(x)
+ 變數 x 是否為 list 資料型態

alist(...)

@@ Arguments @@


@@ ... @@   objects, possibly named.

+ list 內的元素, 搭配命名使用
example1


@@ x @@    object to be coerced or tested.

+ 在 as.list, is.list 需要被檢查或轉換的變數


@@ all.names @@	  a logical indicating whether to copy all values or (default) 
                  only those whose names do not begin with a dot.
                  

@@ sorted	@@    a logical indicating whether the names of the resulting 
                list should be sorted (increasingly). Note that this is 
                somewhat costly, but may be useful for comparison of 
                environments.
                
+ list 內變數依名字排序
```


### example1
```r
list(x = c(1, 3, 5), y = 20, zz = 200)
# $x 
# 1 3 5
# $y
# 20
# $z
# 200
```




