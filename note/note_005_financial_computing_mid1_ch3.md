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
> 
```diff
@@   Corr(X, Y) = Cov(X, Y) / SD X / SD Y    @@
```


>**`linear conbination`** \
> **Z** = aX + bY
> 
```diff
! E(Z) = E(aX + bY)
!      = E(aX) + E(bY)
+      = aE(X) + bE(Y)


! Var(Z) = Var(aX + bY)
!        = E( aX + bY - aEX - bEY )^2
!        = E( a(X - EX) + b(Y - EY)^2
!        = E[ a^2 (X - EX)^2 + 2ab (X - EX)(Y -EY) + b^2 (Y - EY)^2 ]
+        = a^2 Var(X) + b^2 Var(Y) + 2ab Cov(X, Y)

```

### Portfolio

```r
# x1, x2, x3 is the portfolio ratio of 3 stocks
# x1 + x2 + x3 = 1

# S.vec = c(S1, S2, S3)
# stocks expected value
# E( S.vec ) = c( mu1, mu2, mu3)

# stocks var-covariance matrix
# VAR.COV <- matrix(
#  c(var.1, cov.1.2, cov.1.3,
#    cov.1.2, var.2, cov.2.3,
#    cov.1.3, cov.2.3, var.3 ), ncol = 3, byrow = T
# )

# let portfolio R1 = x1 S1 + x2 S2 + x3 S3
# E(R1) = E( x1 S1 + x2 S2 + x3 S3 ) = sum( c(x1, x2, x3) * c(mu1, mu2, mu3) )

# Var( R1 ) = Cov( R1, R1 )
#           = E ( { t(x.vec) %*% ( S.vec - ES.vec ) }   %*%  t( { t(x.vec) %*% ( S.vec - ES.vec ) } )
#           = E (  t(x.vec) %*% { ( S.vec - ES.vec ) %*% t(( S.vec - ES.vec ))  } %*% x.vec )
#           = t(x.vec) %*% VAR.COV %*% x.vec 


# let portfolio R2 = y1 S1 + y2 S2 + y3 S3
# Cov(R1, R2) = E ( { t(x.vec) %*% ( S.vec - ES.vec ) }   %*%  t( { t(y.vec) %*% ( S.vec - ES.vec ) } )
#             = E (  t(x.vec) %*% { ( S.vec - ES.vec ) %*% t(( S.vec - ES.vec ))  } %*% y.vec )
#             = t(x.vec) %*% VAR.COV %*% y.vec
#             = t(y.vec) %*% VAR.COV %*% x.vec
#             = # Cov(R2, R1)
```














