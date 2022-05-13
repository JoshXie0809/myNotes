### 在 r 使用 sqlite

首先使用 `DBI` package

```r
library(DBI)
```

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
