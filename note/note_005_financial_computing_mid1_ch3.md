<h1 id="index.top"> Index </h1>

* [CH1](https://github.com/JoshXie0809/myNotes/blob/main/note/note_003_financial_computing_mid1_ch1.md#ch1)
* [CH2](https://github.com/JoshXie0809/myNotes/blob/main/note/note_004_financial_computing_mid1_ch2.md#ch2)
* [CH3](#ch3)

---
[<h3 id="ch3">Ch3</h3>](#index.top)
---

### Bivariate R.V.

|     |       |       |   `Y`    |         |
|:---:|:-----:|:-----:|:--------:|:-------:|
|     |  \    |    0  |    1     | Pr(`X`) |
|`X`  |  0    |  1/8  |    0     |  1/8    |
|     |  1    |  2/8  |   1/8    |  3/8    |
|     |  2    |  1/8  |   2/8    |  3/8    |
|     |  3    |    0  |   1/8    |  1/8    |
|     |Pr(`Y`)|   4/8 |   4/8    |  1      |

---

> `conditional probability`
>  
```diff
Pr( X = 1 ) = 3/8 
Pr( X = 1 | Y = 1 ) = 1/8 
```
> 
> `convariance`
```diff
Cov(X, Y) = E( X - EX ) ( Y - EY )
-         = E(X Y - X EY  - Y EX + EX EY ) 
-         = E(X Y) - E(X) EY - E(Y) EX + EX EY
-         = E(X Y) - EX EY   - EY EX   + EX EY
+         = E(X Y) - EX EY


!  if X and Y are independent. COV(X,Y) = 0
```
> `correlation`
```diff
@@   Corr(X, Y) = Cov(X, Y) / SD X / SD Y    @@
```


