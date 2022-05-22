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









