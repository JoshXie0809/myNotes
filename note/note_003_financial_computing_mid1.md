* [CH1](#ch1) 
  * [Compounding](#compounding)
  * [Effective Annual Rate](#E.A.R)
  * [Simple Return](#simple.return)
    * [Portfolio Return](#portfolio.return)



<h2 id="ch1"> Ch1 </h2>

---


> Time Value : \
> Face value (after n year) = initial * ( 1 +  year interest )^n

```r
V <- 1000
yr <- 0.03
n <- 10

(FV <- V * (1 + yr) ^ n)
# 1343.916
```

> from this example we know if you invest a stock in $1000 dollars, and have \
> constant year interest is 3%, after 10 years you must have $1943.91 dollars. \
> and you can extand this formula, 
> 
> `V `   ( initial value ) \
> `FV`  ( face value ) \
> `yr`  ( year interest ) \
> `n `   ( after n year )
> 
> 1. FV = V * ( 1 + yr )^n
> 2. V = FV / ( 1 + yr )^n
> 3. yr = ( FV / V ) ^( 1/n ) - 1
> 4. n = log( FV / V ) / log ( 1 + yr )
---
<h3 id="compounding"> Compounding </h3>

```r
# if compounding 12 times in a year 
# month compounded
# year interset is 0.03

V <- 1000
yr <- 0.03
m <- 12
n <- 10

(FV <- V * (1 + yr / m ) ^ (m * n) )
# 1349.354
```

> this FV is higher than previos one, and what if `m -> inf` ? \
> from calculus we know, if `m->inf`, (1 + 1/m)^m = e \
> So, V * (1 + yr / m)^(m * n)  = V * e ^ ( yr * n ) \
> this is `Continuous compounding`
```r
# m -> inf

V <- 1000
yr <- 0.03
n <- 12

(FV <- V * exp(yr*n) )
# 1349.859
```
---
<h3 id="E.A.R"> Effective Annual Rate </h3>

> if you want to invest, you must compute the gain \
>  you must ask A or B, which is higher

   A  |  B
------|--------------
`yr = 0.05` | `yr = 0.04` `compound 12 times ` 

> so we need to transform A and B to same standard for comparison

```r
# A yr = 0.05
# B yr = 0.04, m = 12

# A E.A.R is
(1 + 0.05 / 1 ) ^ 1 - 1
# 0.05

# B E.A.R is
( 1 + 0.04 / 12) ^ 12 - 1
# 0.040742
```
> now we have
 
 `E.A.R`
 🏆A |       B
------|---------
`0.05`|`0.040742`

---

<h3 id="simple.return"> Simple Return </h3>

> the concept if simple return is what we gain in the period \
> for example I use $10000 dollars to buy a stock with price p_1 = 10.11 \
> after several months p_2 = 13.83, what is the gain (interest)

```r
# in simple way
# first we compute the how many stocks we buy
(amount <- 10000 / 10.11)
# 989.1197

# and after several month, price changes to 13.83
# suppose you sell these stocks
# yo have
(earning <- amount * 13.83)
# 13679.53

# finally we compute the interset in this period
( earning / 10000 - 1)
# 0.3679525
# so the interest rate in this period is 0.3679525
# and rewrite the formula, 
# we get p_2 / p_1 - 1 is the simple return's formula
```
> simple return = `p_t / p_(t-1)  - 1`

<h3 id="portfolio.return">Portfolio Return</h3>

> it is common to split your money to invest in serval different shares \
> how to compute this investing portfolio intest rate? \
> suppose you invest 3 companies C1, C2, C3 \
> first we can think if you invest all your money in C1 \
> the intest rate formula is same as simple return. \
> now suppose you only give `x1` ratio of your money invest in stock market  ( 0 < x1 < 1 ) \
> other put under your bed \
> your `whole` money interest rate is `x1 * r1 + (1-x1) * 0` \
> the `section x1` money contribute the portfolio return with `x1 * r1` \
> other section `1-x1` is put under your bed, so give `zero contribute` \
> we can easily extend the portfolio return is \
> `x1 * r1 + x2 * r2 + x3 * r3`, 0 < x1 + x2 + x3 < 1
---











