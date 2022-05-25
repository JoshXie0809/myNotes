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

```






















