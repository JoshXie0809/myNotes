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
using namespce std;

int main() {
    // Defines four strings:
    string prompt("What is your name? > "),
           name,
           line(40, "-"), // "-" x 40 = 
                          // "--....--", length 40
            total = "Hello, ";
            
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


















































