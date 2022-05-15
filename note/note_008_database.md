[<h3 id="top">sqlite 語法</h3>](#sqlite)

### 在 r 使用 sqlite

首先使用 `DBI` package

```r
library(DBI)
```

---
### 新增 sqlite 資料庫 

使用 RSQLite package 中 SQLite() 呼叫 sqlite 語言\
並設定路徑 `"./my-db.sqlite"`\
使用完後, 使用 dbDisconnect 中斷資料庫連結

```r
mydb <- dbConnect(RSQLite::SQLite(), "./my-db.sqlite")
dbDisconnect(mydb)
```

若要創立暫時的資料庫
```r

# option 1 ""
mydb <- dbConnect(RSQLite::SQLite(), "")

# option 2 ":memory:"
# mydb <- dbConnect(RSQLite::SQLite(), ":memory:")

# option 3 "file::memory:"
# mydb <- dbConnect(RSQLite::SQLite(), "file::memory:")
dbDisconnect(mydb)
```
---

### 將在 r 上的資料寫入 sqlite database
> 使用 `dbWriteTable() ` 將資料寫入 sqlite database\
> `dbWriteTable() ` ( _寫入目標資料庫_ ), ( _table 名字_ ), ( _r 上資料名字_ )\
> 使用 `dbListTable()`   將資料庫中存在的 table 列出

```r
mydb <- dbConnect(RSQLite::SQLite(), "" )
dbWriteTable(mydb, "mtcars", mtcars)
dbWriteTable(mydb, "iris", iris)
dbListTables(mydb)
# "iris"   "mtcars"
dbDisconnect(mydb)
```

### 查詢在 db 中的資料: 須搭配 sqlite 語法使用
>  查詢 `dbGetQuery` ( _查詢資料庫_ ), ( _sqlite查詢指令_ ) 
```r
mydb <- dbConnect(RSQLite::SQLite(), "" )
dbWriteTable(mydb, "mtcars", mtcars)
dbWriteTable(mydb, "iris", iris)
dbListTables(mydb)
# "iris"   "mtcars"

dbGetQuery(mydb, 'SELECT * FROM mtcars LIMIT 5')

#    mpg cyl disp  hp drat    wt  qsec vs am gear carb
# 1 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# 2 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# 3 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
# 4 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
# 5 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2

dbGetQuery(mydb, 'SELECT * FROM iris WHERE "Sepal.Length" < 4.6' )

#   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
# 1          4.4         2.9          1.4         0.2  setosa
# 2          4.3         3.0          1.1         0.1  setosa
# 3          4.4         3.0          1.3         0.2  setosa
# 4          4.5         2.3          1.3         0.3  setosa
# 5          4.4         3.2          1.3         0.2  setosa

# using variable len
dbGetQuery(mydb, 'Select * From iris WHERE "Sepal.Length" < :len', 
           params = list(len = 5))

dbDisconnect(mydb)
```

[<h3 id="sqlite">SQLite 語法筆記</h3>](#top)

> SQLite is a public-domain software package. \
> provides `relational database management system` or **`RDBMS`**.

```diff
@@ RDBMS @@ 是一套被用在儲存大量用戶自定義資料的系統
+ 他可以進行深入且結合多資料庫的查詢指令，並進行簡單的資料統計。
```

[step 1, create /or open](#top)
```diff
當你下載完成 sqlite 後, 可以打開終端機, 並輸入

sqlite3 test.db

若終端機路徑上有 test.db 這個檔案, 便會讀取該檔案, 
若檔案並不存在, 便會開啟新檔

可以用 sqlite 進行簡單的運算, 輸入以下指令會得到答案
! 注意要以 “;” 結尾

select 3*4, 12, 21+2;

結果應該如下

+ 12|12|23

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

為了方便閱讀輸入以下指令
! 注意以 “.” 開頭的指令不用以 “;” 結尾

.header on
.mode column
select 3*4, 12, 21+2;

結果應該如下

+ 3*4  12  21+2
+ ---  --  ----
+ 12   12  23  


@@ 我們完成了 sqlite 的初步使用 @@

```




