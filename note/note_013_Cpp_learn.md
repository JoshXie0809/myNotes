<h1 id="top">Index</h1>
  
---
  
  
### C++ foundation

```diff
C++ = C + OOP + Extension

C :   - universal (大部分)
      - efficient (效率)
      - close to machine (接近機器才看得懂的語言)
      - portable
      
      
OOP :     - data abstracttion
          - data hiding
          - inherutance
          - polymorphism
          
Extension :      - exception handling
                 - templates
                 

Cpp 繼承了 C 大部分的特點,
所以 C 發展多年的 code 都可以直接使用

data abstraction :
    that is, the creation of classes to 
    describes objects.
    使用者能自定義 class
    
data encapsulation :
    for controlled access to object data

inheritance :
    by creating derived classes


OOP 好處 :
過去方法直接寫 functions, 然後再運用在 datas 上,
若 data 有做修改, 如增加 column, 很可能就要修改
function 的內容

OOP 是將 function 定義在 data 上的, 省去了重複
修改 function 的問題, data 共用的 function 也
可以透過繼承的方式省去重複編寫

OOP 中 
    data ( properties )
    data's functions (capcities )
    可以看出 OOP 基於資料

C++ 程式開發流程

1. 在 text editor 中寫出 source file
2. 編譯器 編譯你所寫出的程式碼
  a. 編譯 main() 所在的 source file
  b. 加入 header file 標頭檔
  c. 編譯出 object file
  d. 透過 linker 連接 standard library
                連接 other library
                連接 other object files
                
  e. 變成可執行 executable file, windows' .exe

```

example : beginner's cpp program

```cpp
#include <iostream>
using namespace std;

int main () {
    cout << "Enjoy your first Cpp program" << endl;
    return 0;
}
```
---

### Data Type 

Skip

---

### [Using Function and Classes](#top)
* declare and call standard functions and
* use the standard classes

```diff

long func ( int, double ) { ... }

@@ long @@ : the type of value this function will return
             回傳值的 type

@@ func @@ : this function's name is "func"
             這個 function 的名字是 "func"

@@ int, double @@ : the args type
                  : 呼叫 function 需要參數, int, double 
                  分別是第一個, 和第二個參數的 type

```

**`Mathematical standard functions`**

```diff
double sin (double);              // Sine
double cos (double);              // Cosine
double tan (double);              // Tangent
double atan (double);             // Arc Tangent
double cosh (double);             // Heperbolic Cosine
double sqrt (double);             // Square Root
double pow (double, double);      // Power Function a^x
double exp (double);              // Exponential Function e^x
double log (double);              // Natural Lofarithm

使用上述的 functions, 需要
#include <cmath>

// note :
pow // function
pow() // 呼叫 function

```
**`Sample program`**
抽樣方法

```diff

首先需要
#include <cstdlib>  // Prototypes of srand(), rand():

設定 seed 
void srand( unsig int seed )

抽取隨機值
int rand ( void )
uniformly select a value from 0 ~ 32767
```
example 

```cpp

// Outputs three random numbers

#include <iostream> // Declaration of cin and cout
#include <cstdlib>  // Prototypes of srand(), rand():
                    // void srand( unsigned int seed );
                    // int rand( void );
using namespace std;

int main() {
    unsigned int seed;
    int z1, z2, z3;
    cout << " --- Random Numbers --- \n" << endl;
    
    cout << "To initialize the random number generator, "
         << "\n please enter an integer value: ";

   cin >> seed;  // Input an integer
   srand( seed); // and use it as argument for a
                 // new sequence of random numbers.
    
    z1 = rand(); // Compute three random numbers.
    z2 = rand();
    z3 = rand();
    cout << "\nThree random numbers: "
         << z1 << " " << z2 << " " << z3 << endl;
    return 0;
}
```
**`Header Files`**
標頭檔

```diff
在你的 cpp 檔案中, 
你會 #include 一些之前寫過的程式碼

// source.cpp
#include <iostream>       // standard library 的 include
#include "./myheader.h"   // 自己的程式碼

! < ... > : 在 include folder 尋找 .h
! " ... " : 在 當前目錄        尋找 .h

@@ Header files of the C++ standard library @@
c++ 標準函式庫

algorithm       ios         map         stack
bitset          iosfwd      memory      stdexcept
complex         iostream    new         streambuf
dequeue         istream     numeric     string
exception       iterator    ostream     typeinfo
fstream         limits      queue       utility
functional      list        set         valarray
iomanip         locale      sstream     vector

@@ Header files of the C standard library @@

assert.h        limits.h        stdarg.h        time.h
ctype.h         locale.h        stddef.h        wchar.h
errno.h         math.h          stdio.h         wctype.h
float.h         setjmp.h        stdlib.h
iso646.h        signal.h        string.h

c 的遺產, cpp 能很好的使用
#include <math.h>

```

**`using class string`**

example

```cpp
#include <iostream>
#include <string> // declaration of class "string"
using namespace std;

int main() {
    // Defines four strings:
    string prompt("What is your name? > "),
           name,
           line(40, '-'), // "-" x 40 = 
                          // "--....--", length 40
            total = " Hello, ";
            
    cout << prompt;        // Request for input.
    getline(cin, name);    // Inputs a name in one line
    
    total = total + name;  // Concatenates and
                           // assign strings
                           
    cout << line << endl // Outputs line and name
         << total << endl;
    
    cout << " Your name is " // Outputs length
         << name.length() << " characters long!" << endl;
         cout << line << endl;
    
    return 0;
}

```
```diff

string 指定內容方法
string s = "...."; or
string s = ("....")

! 注意
string line(40, '-'); 是用 [''], 非 [""]

!string class' capabilities
s.length(); 取得字串長度

```

---

### [Input and Output with Streams](#top)

如何使用 iostream

```diff

cin : object of class istream to control standard input
cout : object of class ostream to control standard output
cerr : object of class ostream to control unbuffered error output
clog : object of class ostream to control buffered error output

istream class is used to reading streams
ostream class is used to writing streams

! the operator ">>" is defined in istream
! the operator "<<" is defined in ostream

! iostream inherent istream and ostream,
! so has both library functions.

```

```cpp
#include <iostream>
#include<string>
using namespace std;

void line(void);

int main() {
    
    cout <<"cout << showpos << 123 << endl; "<< endl;
    line();
    cout << showpos << 123 << endl;
    // +123
    line();

    cout <<"cout << 22 << endl; "<< endl;
    line();
    cout << 22 << endl;
    // +22
    line();
    
    cout <<"cout << noshowpos << 123 << endl; "<< endl;
    line();
    cout << noshowpos << 123 << endl;
    // 123
    
    line();
    
    cout <<"cout << 22 << endl; "<< endl;
    line();
    cout << 22 << endl;
    // 22
    
    line();
    
    cout << "cout.setf(ios::showpos);" << endl
         << "cout << 125 << endl;" << endl;
    
    line();
    cout.setf(ios::showpos);
    cout << 125 << endl;
    //+125
    line();
    
    cout << "cout.unsetf(ios::showpos);" << endl
         << "cout << 125 << endl;" << endl;
    line();
    cout.unsetf(ios::showpos);
    cout << 125 << endl;
    // 125
    
    return 0;

}

void line(void) {
    string l(40, '-');
    cout << l << endl;
}
```

```diff
@@ Manipulators formatting integers @@
```

Manipulator|Effects
-:|:-
oct|八進位制
hex|十六進位制
dec|十進位制(預設)
showpos|正的數值型資料前面加上"+"
noshowpos|正的數值型資料前面不加上"+"(預設)
uppercase|十六進位制英文大寫
nouppercase|十六進位制英文小寫(預設)


```cpp

// Enters a character and outputs its
// octal, decimal, and hexadecimal code.
#include <iostream>
#include <iomanip>
#include <string>
using namespace std;
int main()
{
     int number ;
     // Declaration of cin, cout
     // For manipulators being called
     // with arguments.
     cout << "the number is: ";
     cin >> number;
     cout << "octal\t\tdecimal\t\thexadecimal\n";
     cout << oct << number << "\t\t" 
          << dec << number << "\t\t"
          << hex << number << endl;
     return 0;
}

```

```diff
@@ Manipulators formatting floating-point numbers @@
```

Manipulator|Effects
-:|:-
showpoint| cout 1`.` 這樣的數值
noshowpoint| 若無小數後數值則省略(預設)
fixed|output in fixed point notation, 1`.0000` 小數點後幾位由設定的 precision 決定
scientific|output in scientific notation
int precision( int );|set float precision
int precision( ) const; | return used precision

example

```cpp

#include <iostream>
using namespace std;

int main() {
    double x = 12.0;
    cout.precision(3);

    cout << "default     : " << x << endl;
    cout << "showpoint   : " << showpoint << x << endl;
    cout << "noshowpoint : " << noshowpoint << x << endl; 
    cout << "fixed       : " << fixed << x << endl;
    cout << "scientific  : " << scientific << x << endl;
    cout << "the precision is " << cout.precision() << endl;
    
    return 0;
}

// output

// default     : 12
// showpoint   : 12.0
// noshowpoint : 12
// fixed       : 12.000
// scientific  : 1.200e+01
// the precision is 3

```

```diff
@@ Element functions for output in fields @@
```

Method|Effects
-:|:-
int width( ) const; | Returns the minimum field width used
int width( int n ); | Sets the minimum field width to n
int fill( ) const;  | Returns the fill character used
int fill( int ch ); | Sets the fill character to ch


Manipulator|Effects
-:|:-
setw(int n)|Sets the minimum field width to n
setfill(int ch)|Sets the fill character to ch
left|Left-aligns output in fields
right|Right-aligns output in fields
internal|Left-aligns output of the sign and right-aligns output of the numeric value

examples

```cpp
#include <iostream>
#include <iomanip>
// setw & setfill declaration in iomanip
using namespace std;
void line (void);

int main() {
    line();
    // example 1:
    cout << "|" << setw(6) << "X|" << endl;
    // |    X|
    // fields with 6 spaces
    line();

    // example 2:
    cout << fixed << setprecision(3) << setw(10)
         << 123.4 << endl
         << 1234567890 << endl;        
    //    123.400
    // 1234567890
    line();

    // example 3:
    cout << setfill('>') << setw(10) << setprecision(2) 
         << 123.4567 << endl;
    // >>>>123.46
    line();

    // example 4:
    cout << setfill('0') << setw(10) << setprecision(2) 
         << internal << 123.4 << endl
         << setfill('0') << setw(10) << setprecision(2) 
         << internal << -123.4 << endl;
    // 0000123.40
    // -000123.40
    line();

    return 0;

}

void line(void) {
    cout << "------------------------------" << endl;
}
```

sample
```cpp
#include <iostream>
#include <iomanip>
#include <string>
using namespace std;

int main() {
    string label;
    double price;

    cout << "\nPlease Enter an article label : " ;
    
    // Input the label (15 characters maximum):
    cin >> setw(16) ;
    cin >> label;
    cin.sync(); // Clears the buffer and resets
    cin.clear(); // any error flags that may be set

    cout << "\nEnter the price of the article: ";
    cin >> price;
    // Controlling output:
    cout << setprecision(6)
         << "\nArticle:"
         << "\n Label: " << label
         << "\n Price: " << price << endl;
    
    return 0;
}
```

```diff
@@ Note @@

The input buffer is cleared and error flags are reset 
by calling the sync() and clear() methods. This ensures 
that the program will wait for new input for the price, 
even if more than 15 characters have been entered for 
the label.
```

```diff
@@ Input Fields @@

">>" 是定義在 <istream> 中
會考慮 number base && field width flags

number base : oct(8), dec(10), hex(16)
field width flags : setw(...)

```

sample

```cpp
// Reads a text with the operator >>
// and the function getline().

#include <iostream>
#include <string>
using namespace std;

string header =
" --- Demonstrates Unformatted Input ---";

int main() {
    string word, rest;
    cout << header 
         << "\n\nPress <Enter> to go on\n\n";
    
    cin.get(); // get a line input without store

    cout << "Please input a sentence with several words" << endl
         << "End with <!> and <Enter>." << endl;
    cin >> word; 
    getline(cin, rest, '!');
    
    cout << "\nThe first word: " << word
         << "\nRemaining text: " << rest << endl;
    return 0;
}
```

### [Operators for Fundamental Types](#top)

```diff
@@ Binary operator and operands @@

剛好需要兩個參數的 function

a + b,

`+` is a function
double `+`( double a, double b ) # return sum

other : +, - *, /, %(remainde)

```

a|+|b
:-:|:-:|:-:
`Left` operand|operator|`Right` operand



```diff
@@ Unary operator and operands @@
需要一個參數的 function
```

Operator | Significance
|:--:|:--|
 `+` | 給定正號
 `-` | 給定負號
 `++`| 把參數值 + 1, 並指定回參數
 `--` | 把參數值 - 1, 並指定回參數

優先度|Operators
:-:|:-
1| `++`, `--` (postfix)
2| `++`, `--` (prefix), `+`, `-` (sign)
3| `*`, `/`, `%`
4| `+`, `-`


```difff
@@ ++i @@

i is incremented first and the new value of i is then applied,


@@ i++ @@ 

the original value of i is applied before i is incremented.

```

```cpp

#include <iostream>
using namespace std;

int main() {

    int i(2);
    cout << i++ << endl; // output: 2
    cout << i << endl; //output: 3
    cout << ++i << endl; //output: 4
    cout << i << endl; // output: 4

    cout << 1 + i++ << endl; // output: 5
    cout << i << endl; // output : 5

    cout << 1 + ++i << endl; // output : 7
    cout << i << endl; // output : 6
    return 0;
}

```


```diff
@@ The relational operators @@
邏輯運算優先度一定低於數學運算
```
|優先度|Operator
| :-:|:-
| 1|  先前部分的數學運算式
| 2| `<`, `<=`, `>=`, `>` 
| 3| `==`, `!=`
| 4|assignment operator

### [control flow](#top)

* loop with `while`, `do-while`, `for`
* selections with `if-else`, `switch`
* jumps with `goto`, `continue`, `break`


```cpp
#include <iostream>
using namespace std;

void line( void );

int main() {
    // comma operator
    // a*b is assign to x
    line();
    int x, a, b;
    x = (a = 12, b = 22, a*b );
    cout << x << endl;
    // output is 264
    line();

    // conditional operator
    // [ logical ? true : false]
    // a is 12, b is 22
    x = a > b ? 1 : 0;
    cout << x << endl;
    // out put is 0;
    line();

    // use like if else
    a > b ? cout << 1 << endl : cout << 2 << endl;
    line();

    // switch
    int command;
    cout << "command from 1 to 4: ";
    cin >> command;
    switch (command) {
        case 1:
        case 2:
            cout << "command <= 2\n";
            break;
        case 3:
        case 4:
            cout << "command > 2, is 3 or 4\n";
            break;
        default:
            cout << '\a' << flush << "command not in 1~4\n";
            break;
    } 
    line();


    x = 0;
    for(int i = 0; i < 100; i++) {
        if( i > 50 ) goto iLarger50;
        x = i;
    }
    // this part is not print
    cout << "x is before label" << endl;

iLarger50: // in for-loop i > 50, jum here 
    cout << "i is larger than 50" << endl;
    cout << "x is " << x << endl;
    line();

    return 0;
}

void line (void) {
    cout << "--------------------------" << endl;
}
```

#### goto example

```cpp
#include <iostream>
#include <string>
using namespace std;

int main() {
    int count = 0;

iIs0:
    cout << "i is 0\n";

iIs1:
    cout << "i is 1\n";


    for(int i = 0; i < 3; i++) {
        if(count > 0) goto end;
        ++count;
        if( i == 0 ) goto iIs0; 
        if( i == 1 ) goto iIs1;
    }
end:
    cout << "count is " << count << endl;
    cout << "press <Enter> to end" << endl;
    cin.get();
    return 0;
}

```
### [Sybolic Constants and Macros](#top)


```diff
@@ a @@
```
example

```cpp
#include <iostream>
using namespace std;


// define a macros called SQUARE
// using parameter [a]
#define SQUARE(a) ( (a) * (a) )
#define SQUARE2(a) ( a * a )

// when using
// example :
// z = SQUARE(x+1);
// z = (x+1) * (x+1);

int main() {
    int z, x = 9;
    cout << "using macro SQUARE( x+1 ) : " 
         << SQUARE(x+1) << endl;
    // output : using macro SQUARE( x+1 ) : 100
    
    cout << "using macro SQUARE2( x+1 ) : " 
         << SQUARE2(x+1) << endl;
    // using macro SQUARE2( x+1 ) : 19
    // 9 + 1 * 9 + 1 = 19
    
    return 0;
}
```

```diff
@@ WORKING WITH THE #define DIRECTIVE @@

in file prog.h :
  
  Classes
  and other type
  definitions
  
  prototype 
  of global function
 

in Source file1
  #include "proj.h"

in Source file2
  #include "proj.h"

.....

in Source filen
  #include "proj.h"

! 要使用 #define 定義 macro
! 可以隨意放置 #define 地方
! 但是要在第一次使用前 #define

但是還是推薦放在最 source file
前面, 方便管理

如果你要在多個文件中使用同個 macros
可以使用 .h 來統一管理 macros

上述得例子 macro 有點像 function,
但是最大的不同在於, macro　呼叫時
不會創造新空間處理, 所以速度會快點

```

```diff
@@ Multiple inclusions of header files @@
source file #include 多個 .h

in layer [1] header file: basis.h
#ifndefine _BASIS_H // if not define
#define _BASIS_H

// contect

#endif

in layer [2] heafer file: statist.h
#include <iostream>
#include "basis.h"

in layer [2] heafer file: graph.h
#include <iostream>
#include "basis.h"

in layer [3] source file: application.cpp
#include "statist.h"
#inclide "graph.h"

int main() {
  // ....
  return 0;
}

```


### [string class](#top)

```diff
@@ define and assign string @@
創造 string type variable

string message = "Good morning!";
['G', 'o', 'o', ..... ,  'g', '!']
length: 13

@@ initialize @@

初始化, 即宣告變數,需要給予變數名, 
但不需要指派用到多少空間, string
會隨著變數儲存的字串不同, 自動調整
所需要的空間這是改善 C 字串容易犯
錯的問題

如果變數初始化時, 沒有給值, 那麼
將會生成一個長度為 0 的 string

+ example

string message("good morning!")
cout << message.length()
// output is 13

@@ string assignment @@

當你指派新的字串給 string type
的變數時, 新的字串將會取代變數原
先儲存的字串, string 也會自動
根據新字串的大小動態調整記憶體空間

```
example

```cpp

#include <iostream>
#include <string>
using namespace std;

string prompt("please enter some text\n"),
       line(50, '-');

int main() {
    prompt += "Terrminate the imput with an empty line.\n";
    cout << line << endl
         << prompt
         << line << endl;
    
    string text, nline;
    while(true) {
        getline(cin, nline);
        if(nline.length() == 0) {
            break;
        }

        text = nline + '\n' + text;
    }
    
    cout << line << endl
         << "your input in reverse order\n"
         << line << endl
         << text << endl;

    return 0;
}

```

```diff

string 提供了字串比較方法
@@ == @@ : 兩個變數儲存的字串完全相同;

string s1, s2;
getline(cin, s1);
getline(cin, s2);
if(s1 == s2) cout << "true"" << endl;

@@ Inserting a string @@
在字串中插入字串
string s1("Hello, Josh");
H e l l o , ' ' J o s  h
0 1 2 3 4 5  6  7 8 9 10

s1.insert(7, "Mr.");
cout << s1 << endl;
// output: Hello, Mr.Josh

now string s1 change to

H e l l o , ' ' M r .  J  o  s  h
0 1 2 3 4 5  6  7 8 9 10 11 12 13

@@ erase the char from string @@

s1.erase(5, 13-5+1); // start 5, quantities 9
// output: Hello

now string s1 change to

H e l l o
0 1 2 3 4

s1.erase(1);
// delete char from 1 to end
// output: H

@@ searching @@
在 string type 變數中尋找 字串

string youth("Bill is so young, so young");
int first = youth.find("young");
// first is 11

第一個找到 "young" 的地方是 11
也可以用 .rfind right find, 找最後一個 young

int last = youth.rfind("young");
// last is 21

@@ replace @@
erase and insert

```

### [function](#top)

```diff

@@ General form of a function @@

[type] name([declaration_list]) // Function header
{ 
                                // Beginning
                                .
                                .
                                What will be done // Function block
                                .
                                .

}                               // End 

@@ definition @@

[type] 這個 function 會回傳什麼 type 的資料
[naem] 這個 function 叫什麼名字

[declaration_list] 這個 function 會使用哪些
                   參數, 給定參數名及 type

@@ 呼叫 function @@
// prototype
void func (int a, int b);

// called
int x = 1, y = 2;
int z = fnuc(x, y)

// when calling func
// 參數 a giving x value
// 參數 b giving y value 

@@ passing by value @@

這種方式叫做 passing by value,
指傳遞值, 會新創立變數來複製值

除了 passing by value 這種方法,
c++ 還有 passed by reference

@@  passed by reference @@

這種方法不像 by value 是把 x, y
的值傳給 a, b, 而是直接把 x, y
傳入 function 內, 因此 function
可以直接修改 x, y的值

實施的方法是傳遞 x, y 變數的記憶體位置

example

time( &sek );

在使用 time function 時, 我們傳入了 sek
變數的記憶體位置, 可以想成一般電腦資料儲存的
方式, 我們會知道檔案具體在哪顆硬碟的 C:/ or 
D:/ ..., 然後會知道檔案在哪個資料夾, 最後我
們會看到檔案的名字, 可以發現變數名好像對應了
檔案名, 記憶體位置對應路徑, 然後變數值是儲存
在檔案內的資料。

@@ Jump to sub-Routines @@

當在 main 中呼叫 function 時,
會創造另一個空間來執行這個被呼叫
的 function, 

首先, 會將 funtion 需要用到的參
數從最後一個參數值放到 stack 中,然
後依序往前放置參數資料, 最後把在
哪個記憶體位置呼叫此 function 的
記憶體位置也放入 stack, 作為回傳值
存入的地址, 然後在依序放入此 function
中創造的變數, 然後當 function 執行完
後由後往前消滅變數 ( LIFO, last in 
first out ), 確保 function 額外創造 
的變數不會污染到 main 的空間, 因為
function 創造的變數一定早於其他被消滅

可以發現 function 並沒有被多次寫入
程式中, 而是在每一次被呼叫時, 將資料
連接到 function, 這樣可以省去記憶體
空間, 但是執行時間卻會因此被延長


c++ 提供 inline function
來解決多次呼叫問題

@@ inline function @@

在編譯時, 在每一個呼叫 function 的地方
可以想成在 text editor 中將每一個 function
的程式碼複製貼上, 然後直接執行, 省去呼叫的時間
但是可以想見, 記憶體位置一定被塞爆

@@ inline Definition @@

example 

inline int max( int x, int y ) {
    return (x >= y ? x : y);

}


@@ overloading @@

在寫程式時需要避免相同命名, 但若是功能相同,
僅因為需要傳入的變數, 和 return 的 type 
不同, 就要想不同命名實在麻煩

example

int     int_max( int x, int y);
double  dbl_max( double x, double y);

面對這樣的情形, c++ 允許他們使用相同名字 max

int     max( int x, int y);
double  max( double x, double y);

c++ 的 compiler 會自動偵測你放的變數值 type,
來判斷對應的呼叫 function, 但是這會拖慢執行效率,
還有可能會使該放入什麼變數造成疑惑, 因此分開命名
比較推薦這樣做。

```

### [Storage Classes and Namespaces](#top)

```diff

@@ storage class @@
在 c++ 中, 可以使用的 storage classes 有

extern  static  auto  register

當一個變數被宣告時, 不只確定了變數名及變數 type,
同樣也決定了儲存的 class type

storage 決定了變數的生存時間, 也決定了, 一個
programe 中哪些片段的程式碼可以調用這個變數,
變數能被使用的片段被稱為 scope, 也就是能被看到
的地區, 最常用的 scope 便是我們只能在變數宣告
後調用這個變數, 在宣告前的程式碼是不能使用未宣告
變數的
```

scope 有分為 3 級

scope|可視範圍
-:|:-
block scope| 在一個 { 可視範圍 }, 當程序執行離開 { } 後無法使用 
file scope| 一個編譯 cpp 檔案後的 module, 只有在這個 modiule 的 function 才可以使用
program scope| 所有在 program 中的片段都能呼叫, 又被稱為 Global 變數


```diff
@@ Global scope @@
```
example

```cpp
// file cutline1.cpp
#include <iostream>
#include <string>
using namespace std;

void cutline( void );
void sep(void);

string line; // Global variable


int main() {
    
    while (getline(cin, line)) {
        sep();
        cout << "before cutline size is "<< line.size() << endl;
        cutline();
        sep();
        cout << "after cutline size is "<< line.size() << endl;
        sep();
        cout << line << endl;
        sep();
        cout << endl << endl << endl;
    }
    

    return 0;
}

void sep( void ) {
    string s(50, '-');
    cout << s << endl;
}

```

```cpp

// cutline2.cpp

#include <string>
using namespace std;

extern string line;

void cutline(void) {
    int i = line.size();
    while( i-- >= 0)         
        if( line[i] != ' ' && 
         line[i] != '\t') break;
    
    line.resize(++i);
}

```

complie file or makefile

```bash
g++ -o cutline.o cutline*.cpp
```

```
@@ definition of global object @@

當一個 function 所使用的變數並沒有定義在
function 的 scope 中, 便是 global object 

global object 屬於 extern storage class, 
若此 global object 沒有被指定 const, 那麼
program 所有角落的 code 的可以接觸並修改它

external extern object 因此可以幫助 function 傳遞
資料並不用指派變數, 但也增加不經意修改資料得可能

external : { x }; int a; a 沒有被 {} 括住

@@ Using Global Objects @@

要使用它就要在 file 一開始如同宣告一般變數一樣
給予 type, name, value, 在整個 program 中
只能定義一次

其他檔案要加上 extern 代表 import object 
from other source file

```

```diff
@@ static @@

static 變數如同宣告一般變數

static int count;

static 變數與 extern 變數一樣,都是統一存放在 program 
data 中不像一般得變數當 block { } 執行結束就跟著 stack 
一起消滅, 而是會一直保存, 所以當 static int count; 
已經宣告過, program 存在這個變數, 下一次在遇到這指令
會跳過, 不再初始化這個變數, 這也是 static (永久) 意義

而與 extern class object 相比, static class object
在能使用的 scope 上有所限制

1. external static object
不被任何 { } 括住的宣告, 以 module 為單位, module 中
任何位置都能使用該變數, 但是在不同 module, 即使命名相同
的 static object, 也是不一樣的變數

2. interal static object 
亦即 static 宣告位置有被 { } 括住, 因此這個 static
變數只有在 { } 中才能使用

```

```diff
@@ THE SPECIFIERS auto AND register @@

@@ auto @@

我們一般宣告變數時, ( 在 { } 中宣告 )
int a = 1; // 其實等同於 auto int a = 1;

當程序讀取到第一個 auto 時, 會創造 stack 來存放
{ } 中所有 auto 宣告的變數, 並且當 { } 程序執行
結束時, 把生成的 stack 及內部存放的資料都刪掉

@@ register @@
auto 變數是存放在記憶體中的 stack, 每當 cpu 處理
資料時需要調用資料時, 便會停下出去尋找資料, 這會拖慢
執行速度, 因此電腦硬體設計人員想出在 cpu 當中加入
高速記憶體, 這樣 cpu 需要資料時, 直接讀取不用停下
但是 register 大小有限, register 變數只能用 int 
大小的空間

register int a = 11;

```

```diff
@@ external function @@

function 宣告都被預設為 extern
所以想要使用別的 source file 的
function, 只要宣告即可

extern int functiin ( int a, int b );
extren 缺少也沒關係, 因為是預設 extern
但是若是 import from other source file
還是加上 extern 避免疑惑

這樣可能在一個 program 中, 不同的 
source file 卻含有相同的 function 
name, 這是大問題, 因此 static 請加
在沒有要 export 的 function 前
加上 static

```

```diff

@@ Defining namespaces @@

前面提到 global function 和 global variable
的使用十分危險, 一不小心就會修改值或造成 function
overlaoding, 因此 c++, 提供 namespace 來避免
命名衝突的問題, 在一個 namespace 中自然就不用擔心
與其他 name space 有衝突可能了

namespace myLib {
    int count;
    double calculate(double, int ...);
    // code ...
}

```

example 

```cpp

#include <string>

namespace MySpace {
    // extern varible mess in MySpace
    std::string mess = "Within namespace MySpace";
    
    // extern varible count in MySpace
    // MySpace::count
    int count = 0; 

    // extern function f in Myspace
    // prototype
    // MySpace::f
    double f(double);
}

namespace YourSpace {
    // extern varible mess in YourSpace
    std::string mess = "Within namespace YourSpace";

    void f(void) {
        mess += "!";
    }
}

// back to MySpace
namespace MySpace {
    int g (void); // prototype
    double f (double y) {
        return y / 10.0;
    }
}

int MySpace::g() {
    return ++count;
}

#include <iostream>

int main() {
    std::cout << "\ntesting namespaces\n\n"
              << MySpace::mess << std::endl;
    MySpace::g();

    std::cout << "\nreturn value g() : " << MySpace::g()
              << "\nreturn value f() : " << MySpace::f(1.234)
              << "\n--------------------------" << std::endl;
              
    std::cout << YourSpace::mess << std::endl;
    YourSpace::f();
    std::cout << YourSpace::mess << std::endl << std::endl;
    return 0;
} 

```

```diff

只要在 namespace MySpace {
    ....
    ....
} 中或是 MySpace::物體

using MySpace; 則可以不用在輸入 MySpace::
直接使用

```

### [References and Pointers](#top)


```diff

@@ set reference @@

float x = 1.23, &rx = x;

&rx 是另一種表達 x 的方式
rx 就是 x

rx++ // 跟 x++ 是一樣的
rx // 就是 x
&rx // 記憶體位置
&x // 記憶體位置, 數值會跟 &rx 相同

! reference 創造時就必須給予資料
! 且宣告後就不能修改


@@ define pointers @@

宣告 pointer, 只需要如同宣告一般變數時,
前方加上 *var, 就代表創造指標指向某 type

int *ptr

指標變數 ptr 需要的是, 我們想指向變數的地址
所以用 "&" 取得變數地址, 存入 ptr 中, 所以
我們生成的變數 ptr 內部存放的是 int type 變數
的記憶體位置, 當要取值或修改 "*" 

```
example 

```cpp

#include <iostream>
using namespace std;

int var, *ptr;

int main() {
    var = 100;
    ptr = &var;

    cout << "var " << var 
         << ", *ptr " << *ptr << endl;

    cout << "&var " << &var << 
            ", ptr " << ptr << endl;

    *ptr += 7314;

    cout << "var " << var 
         << ", *ptr " << *ptr << endl;

    return 0; 
}


// output
// var 100, *ptr 100
// &var 0x55b5e3809158, ptr 0x55b5e3809158
// var 7414, *ptr 7414

```

### [defining class](#top)

```diff

class 是 c++ 作為 OOP 語言中最重要的要素
class define, 需要定義 property 和 capability 

class scheme

class Demo {
  public: // can access externally
  -------------------------------------
  
  -------------------------------------
  
  private: // only can use intenally
  -------------------------------------
  
  -------------------------------------

! }; // 這裡要加 ; !!!!!!!!!


! class 預設所有的 member access 是 private 的

```
example account.h

```cpp

#ifndef _ACCOUNT_H  // 避免重複  define
#define _ACCOUNT_H

#include <iostream>
#include <string>
using namespace std;

class Account {

private:
    string name;
    unsigned long nbr;
    double balance;

public:
    bool initialize(const string&, unsigned long, double);
    void display();

};

#endif

```

example account.cpp

```cpp

#include "t15.h"
#include <iostream>
#include <iomanip>
using namespace std;

// seting function decalre in t15.h
// Account::... , 使用 Acoount member

bool Account::initialize(const string& i_name, 
                   unsigned long i_nbr,
                   double i_balance ) 
{
    if(i_name.size() < 1 ) return false;
    name = i_name;
    nbr = i_nbr;
    balance = i_balance;
    return true;
}

void Account::display()
{
    cout << fixed << setprecision(2)
    << "--------------------------------------\n"
    << "Account holder: " << name << '\n'
    << "Account number: " << nbr << '\n'
    << "Account balance: " << balance << '\n'
    << "--------------------------------------\n"
    << endl;
}

```
using class

```cpp

#include "t15.h"

int main() {
    
    // Account 就像 user define type, 像 int, double ...
    
    Account current1, current2;
     
    current1.initialize("Mr.Josh", 0, 1e6 + 0.3456);
    current1.display();
    
    // class member 只能接觸 public 的功能
    // 使用方式 : "."
    
    current2 = current1; // obj assigned is ok
    current2.display();

    current2.initialize("Jones, Tom", 3512347, 199.40);
    current2.display();
    
    Account& mtr = current1;
    mtr.display();
    
    Account *ptr = &current2;
    ptr->display();
    
    // ptr->display() == (*ptr).display()
    
    return 0;
}


```







































