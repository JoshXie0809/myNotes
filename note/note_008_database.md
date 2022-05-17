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

---

[<h3 id="sqlite">SQLite 語法筆記</h3>](#top)

> SQLite is a public-domain software package. \
> provides `relational database management system` or **`RDBMS`**.

```diff
@@ RDBMS @@ 是一套被用在儲存大量用戶自定義資料的系統
+ 他可以進行深入且結合多資料庫的查詢指令，並進行簡單的資料統計。
```
---

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

---

[step 2, the SQL language](#top)
> SQL : Structured Query Language

```diff
@@ create table @@ : 新增資料表
@@ insert @@ : 新增資料到某個 table
@@ select @@ : 查詢資料

! 大小寫對 sqlite 是一樣的, 所以指令可以是 select 或 SElECT 或 SeLeCT
! 註解可以用 -- 或 /*  */

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


@@ cross-database queries @@

[[ database_name. ] table_name. ] column_name

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@ 3-Valued logic @@

sqlite 的邏輯值 有三個

True, False, NULL

! 值得注意的是 NULL 的相反仍是 NULL
+ 在 AND 中 FALSE > NULL > TRUE
+ 在 OR  中 TRUE > NULL > FALSE
```

Value | NOT Value
|:-:|:-:|
True|False
False|True
`NULL`|`NULL`

使用 `AND`

`AND` | TRUE | FALSE | NULL
|:-:|:-:|:-:|:-:|
TRUE| T | F | N
FALSE| F | F | F
NULL | N | F | N

使用 `OR`

`OR` | TRUE | FALSE | NULL
|:-:|:-:|:-:|:-:|
TRUE| T | T | T
FALSE| T | F | N
NULL | T | N | N

```diff
@@ simple operater @@

1.) -, + : 正號, 負號

2.) NOT : 邏輯值的相反

3.) || : 字串合併

4.) +, -, *, /, % : 加, 減, 乘, 除, 取餘數

5.) <, <=, >=, > : 小於, 小於等於, 大於等於, 大於

6.) =, ==, !=, <> : 等於, 等於, 不等於, 不等於

7.) and, or : 邏輯值提件

appendix 8.) 進階學習: IN, LIKE, GLOB, MATCH, REGEXP

```

---

[step 3, SQL data languages](#top)
> SQL 指令可以分為 4 個種類

```diff

1.) Data Definition Language ( DDL )

+ which refer to commands that define the structure
+ of table, views, indexs, and other data containers 
+ and objects within the database. 

定義 table 等資料庫的結構


2.) Data Manipulation Language ( DML )

+ insert, update, delete, query ...

使用關於資料庫數據的指令


3.) Transaction Control language : 還沒看懂 

4.) Data Control Language : 設定資料權限, 誰能碰觸資料的指令
sqlite 沒有這一個部分

```

```diff
@@ DDL @@

簡單來說 DDL 就像 C/C++ 的標頭檔,
先定義了資料庫的長相, 如某一個欄位
必須是整數值, 要介於某個區間, 該欄
的名字是... 等都屬於 DDL.

the basis : create table

+ create table example_table (
+    column_1_name  colum_1_type,
+    column_2_name  colum_2_type,
+    column_3_name  colum_3_type,
+    column_4_name  colum_4_type
+     ...
+ );

! 當 column_type 定義好後, 往後新增的資料
! 都需要符合當出定義時的型態, 否則會出現錯誤

@@ sqlite3 的資料種類 @@

1.) NULL : 別問, 問就是 NULL, 

基本上就是為了 NULL 才成立這個類別


2.) Integer : 整數

範圍介於 -9,223,372,036,854,775,808 ~ 9,223,372,036,854,775,807


3.) Float: 實數, 小數, C++ 的 double


4.) Text: 文字 ( UTF-8, UTF-16BE, UTF-16LE )


5.) BLOB: hexadecimal text string, begin with x'....'


@@ sqlite3 column_type 設定 @@

1.) Text :  

若 column_type 設定為 “Text” 後, 往後新增資料,
只能在此 column 放入 
sqlite3 資料型態 NULL, Text, BLOB,
! 若放入 ( float, integer ) 會強制轉換為字串


2.) Numeric

可以放入 sqlite 全部 5 種資料型態,
但只有 integer, float, BLOB, NULL 會直接儲存,
text 資料 sqlite 會先嘗試轉換為 integer 或是
float 型態儲存, 若轉換失敗, 便以 text 儲存


3.) Integer

該欄只可以放入 sqlite integer 資料型態, 
其他資料型態除了 float 都會錯誤,
! 而 float 會刪去小數部分, 變成 integer 


4.) Flaot

! 運作方式與 numeric 相同
! 唯一區別是輸入 integer 會轉換成 float


5.) None

該欄不限制資型態, 
所有資料都會以輸入時的型態儲存

@@ SQLite 欄資料型態運作 Rule @@

1.) 若創造 data object 時, 沒有給定 column_type
    則自動設定 None 作為該欄 column_type
    
2.) 資料型態不一定要輸入全名, 如 "INT" 會被認定為
    integer, 因此輸入字串的縮寫即可
 
3.) 若創造時字串含有 "CLOB" "CHAR" "TEXT", 會設定該欄
    為 Text column_type

4.) 若字串含有 "BLOB", 會設定該欄為 None column_type


5.) 若創造時字串含有 "REAL" "FLOA" "DOUB", 會設定該欄
    為 float column_type

6. ) 如果字串沒有找到符合的 column_type, 會設定該欄
    為 numeric column_type

```
> SQLite 添加額外欄限制

```diff

+ create table example_table (
+    column_1_name  colum_1_type column_1_constraint,
+    column_2_name  colum_2_type column_2_constraint,
+    column_3_name  colum_3_type column_3_constraint,
+   column_4_name  colum_4_type column_4_constraint
+    ...
+ );

+ example

CREATE TABLE parts
(
    part_id INTEGER PRIMARY KEY,
    stock INTEGER DEFAULT 0 NOT NULL,
    desc TEXT CHECK( desc != '' ) -- empty strings not allowed
);

```

```diff

1.) 設定排序規則:  "collate" "排序規則的名字" 

2.) 設定預設值 :   "default" "預設值",
!   事實上各欄的預設值為 NULL

3.) 設定紀錄時間格式 :
    a.) current_date
    b.) current_time
    c.) current_timestamp
    
4.) 設定不可為空 : not NULL

5.) 設定每一列值不可相同 : unique

6.) 設定規則 : check()
    如字串欄 "user_name" 不允許值 "坂井泉水", check( user_name != "坂井泉水" )

7.) primary keys 的設定: primary key
!   每個 table 只允許 1 個 primary key
!   integer primary key -> 該欄會被認為是 rowid

有時候會有設定 primary key 的但是值是重複的困擾
可以用 cross column primary key 解決
結合 room_number 和 building_number 就是一個 uniuqe 的值

CREATE TABLE rooms
+ (
+    room_number INTEGER NOT NULL,
+    building_number INTEGER NOT NULL,
+    [...,]
+ 
+    PRIMARY KEY( room_number, building_number )
+ );


8.) 可以以現有的 table 為範本來創造 table
+ CREATE [TEMP] TABLE table_name AS SELECT query_statement;

9.) 修改欄名或增加新欄 :  "alter" "column_name" ...
!   alter 不允許刪除欄


10.) 刪除現有 table : "drop table" "table_name"


11.) 建立一個只允許讀取的 table
CREATE [TEMP] VIEW view_name AS SELECT query_statement

12.) 刪除現有的 view table : "drop view" "view_table_name"

13.) indexes 使用
CREATE [UNIQUE] INDEX index_name ON table_name ( column_name [, ...] );
DROP INDEX index_name;

```

[step 4, DML](#top)

```diff
@@ Data Manipulation Language @@

@@ DML @@

DML 是指將資料存入或取出的指令, 當你使用 DDL 指令創造
Table 之後, 便是使用 DDL 的時機

@@ DML 種類 @@

1.) update 種類

指令有 update, insert, delete
+ update: 修改現有 row 資料
+ insert: 增加新 row
+ delete: 刪除現有 row


2.) query 種類
指令有 select

太複雜了, 所以後面討論

```

```diff

1.) insert 用法: 在某一個 table 中新增資料
+ INSERT INTO table_name (column_name [, ...]) VALUES (new_value [, ...]);

example: 在 parts 中新增一列, 依據 name, stock, status 順序給值
+ INSERT INTO parts ( name, stock, status ) VALUES ( 'Widget', 17, 'IN STOCK' );

column_name_list 是不一定要放的, 但若是沒放的話
便是依照 column 的順序擺放資料, 同時這代表你無法
使用預設值功能, 包括 integer primary key 欄, 
所以建議還是要加入明確的 column_name_list


若一次要新增大量筆數資料, 唯一得方法
+ INSERT INTO table_name (column_name, [...]) SELECT query_statement;

若輸入的資料有重複, 想要取代舊有資料,
可以用 replace 指令
+ INSERT OR REPLACE ...


2.) update 用法: 更新現有 row 資料
+ UPDATE table_name SET column_name=new_value [, ...] WHERE expression

example: 對於 parts table 中資料 part_id = 454 的列,
         更新 price 為 4.54, stock = 75
+ UPDATE parts SET price = 4.25, stock = 75 WHERE part_id = 454;


3.) delete 用法: 刪除現有 row 資料
+ DELETE FROM table_name WHERE expression;

example: 刪除 parts 中 part_id 為 385 的列
+ DELETE FROM parts WHERE part_id = 385;

example: 刪除 parts 中 part_id 大於等於 43 並且 
         part_id 小於等於 246 的列們
+ DELETE FROM parts WHERE part_id >= 43 AND part_id <= 246;

example: 刪除所有 row
+ DELETE FROM parts WHERE 1; 


 4.) select 用法: sqlite 中最複雜的指令
+ SELECT output_list FROM input_table WHERE row_filter;

範例:

.mode column
.header on

CREATE TABLE tbl ( a, b, c, id INTEGER PRIMARY KEY );
INSERT INTO tbl ( a, b, c ) VALUES ( 10, 10, 10 );
INSERT INTO tbl ( a, b, c ) VALUES ( 11, 15, 20 );
INSERT INTO tbl ( a, b, c ) VALUES ( 12, 20, 30 );


example: 全選, * 代表全部 column
select * from tbl;

+ a   b   c   id
+ --  --  --  --
+ 10  10  10  1 
+ 11  15  20  2 
+ 12  20  30  3 


example: 取出所有 row 的 a, b column, 
         並以 b, a 排序
select b, a from tbl;

+ b   a 
+ --  --
+ 10  10
+ 15  11
+ 20  12


example: 取出 id = 2 row  所有 column
select * from tbl where id = 2;

+ a   b   c   id
+ --  --  --  --
+ 11  15  20  2 


@@ TCL @@
像是 github 中上傳資料遇到衝突的設定
但是有點複雜, 留給以後看, 先跳過

```

---

[step 5, select 詳細解說](#top)
> 當想要從 table 得到資訊, 都需要 select 指令
```diff

SQL 中最常用的資料型態是 table
創造 table 的指令是 create table

一個 table 包含 
@@ heading of a body @@

heading 定義了欄的名字和 column_type,
也定義了 column 的排序, 這些都是被固定的


@@ body @@

body 包含所有的 row, 每一個 row 中
依序儲存著 column 的資料

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

@@ select format @@

select 的 pipeline ( 工作流 )

SELECT [DISTINCT] select_heading 
    FROM source_tables
    
    WHERE filter_expression
    
    GROUP BY grouping_expressions
             HAVING filter_expression 
             
    ORDER BY ordering_expressions 
    
    LIMIT count
    
    OFFSET count


1.) from source_tables
指定一個或多個 tables 
並合併成為一個暫時的 working table

2.) where filter_expression
根據 filter_expression 找出
working table 中符合條件的 rows

3.) group by grouping_expressions
把 rows 中依照條件, 將他們分組

4.) 依照 select select_heading
把想要的 column 取出並依照 select_heading
中的順序排列

5.) having filter_expression
因為有 3.) 的分組,
在每個組中依照條件挑出 row

6.) [DISTINCT]
刪除重複的 row


7.) order by order_expressions
row 依照指示來排序


8.) offset count
將此時的 working table 從頭到 count 個 row 刪除  

9.) limit count
限制輸出 row 數

``` 

#### from 詳細解說

```diff

from 可以有數個資料 tables 
他們會暫時合併

合併的方法為使用 join 指令

join 有數個種類: cross join, inner join, outer join

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.mode column
.header on
create table t1(A, B);
create table t2(C, D);

insert into t1 (A, B) values (1, "a");
insert into t1 (A, B) values (2, "b");
insert into t1 (A, B) values (3, "c");
insert into t1 (A, B) values (4, "d");

insert into t2 (C, D) values (10, 1.2);
insert into t2 (C, D) values (20, 6.4);

select * from t1;

+ A  B
+ -  -
+ 1  a
+ 2  b
+ 3  c
+ 4  d

select * from t2;

+ C   D  
+ --  ---
+ 10  1.2
+ 20  6.4

@@ cross join @@
t1: 有 m rows, x columns
t2: 有 n rows, y columns

將會有 working table:
m*n row, x+y columns

select * from t1 cross join t2;

+ A  B  C   D  
+ -  -  --  ---
+ 1  a  10  1.2
+ 1  a  20  6.4
+ 2  b  10  1.2
+ 2  b  20  6.4
+ 3  c  10  1.2
+ 3  c  20  6.4
+ 4  d  10  1.2
+ 4  d  20  6.4

! t1 第一個 rows 要將 t2 所有 rows 複製一遍

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


.mode column
.header on
create table t1(A, B);
create table t2(C, D);

insert into t1 (A, B) values (3, "a");
insert into t1 (A, B) values (1, "f");
insert into t1 (A, B) values (1, "q");
insert into t1 (A, B) values (4, "e");
insert into t1 (A, B) values (9, "r");

insert into t2 (C, D) values (1, 7.4);
insert into t2 (C, D) values (3, 2.3);
insert into t2 (C, D) values (9, 8.6);


@@ inner join @@
select ... from t1 join t2 on conditional_expression ...
會依照條件配對 row 並合併 column

example: 如果 A = C
select * from t1 join t2 on A = C;
從 t1 row 1 開始, 比對 t2 所有 row 符合 A column = C column,
就在 working table 新增這一個 row

+ A  B  C  D  
+ -  -  -  ---
+ 3  a  3  2.3
+ 1  f  1  7.4
+ 1  q  1  7.4
+ 9  r  9  8.6

example: 如果 1
select * from t1 join t2 on 1;
因為一直是 true, 效果同 cross join

+ A  B  C  D  
+ -  -  -  ---
+ 3  a  1  7.4
+ 3  a  3  2.3
+ 3  a  9  8.6
+ 1  f  1  7.4
+ 1  f  3  2.3
+ 1  f  9  8.6
+ 1  q  1  7.4
+ 1  q  3  2.3
+ 1  q  9  8.6
+ 4  e  1  7.4
+ 4  e  3  2.3
+ 4  e  9  8.6
+ 9  r  1  7.4
+ 9  r  3  2.3
+ 9  r  9  8.6

! 若兩個 table 間有同 columns 想要以此為 inner join 的標準
! 使用 select ... from t1 join t2 using( col1, ... )
! 但是 using( col1, ... ) 慢慢指定太慢啦 ~~
! 可以使用 select ... from t1 natural join t2 ...


@@ outer join @@
outer join 是 inner join 的擴充
@@ SQL 標準 @@ 定義了 left, right, full outer join
但是 SQLite 僅提供 left outer join 方法

在上面 inner join A = C 的範例我們可以注意到,
有一個 t1 row 有 A = 4, 但是因為它沒有在 t2
找到任一 row 符合 A = C 這個條件, 因此最終 result
是被刪除的, 但是若使用 left outer join 他會把
C, D 設為 NULL 存到 result table

select * from t1 left outer join t2 on A = C;

# A  B  C  D  
# -  -  -  ---
# 3  a  3  2.3
# 1  f  1  7.4
# 1  q  1  7.4
# 4  e        
# 9  r  9  8.6

```
















































































