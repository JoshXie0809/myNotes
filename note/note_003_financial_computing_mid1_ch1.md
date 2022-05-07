<h1 id="index.top"> Index </h1>

* [CH1](#ch1) 
  * [Compounding](#compounding)
  * [Effective Annual Rate](#E.A.R)
  * [Simple Return](#simple.return)
    * [Portfolio Return](#portfolio.return)
  * [Adjusting for Dividends](#adj.for.dividends)
  * [Adjusting for Inflation](#adj.for.inflation)
  * [Annualizing Return](#annualizing.return)
  * [Average Returns](#average.returns)
  * [Contnuously Compounded (cc) Returns](#cc.return)
* [CH2](https://github.com/JoshXie0809/myNotes/blob/main/note/note_004_financial_computing_mid1_ch2.md#ch2)
* [CH3](https://github.com/JoshXie0809/myNotes/blob/main/note/note_005_financial_computing_mid1_ch3.md#ch3)
---

[<h2 id="ch1"> Ch1 </h2>](#index.top)

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
[<h3 id="compounding"> Compounding </h3>](#index.top)

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
[<h3 id="E.A.R"> Effective Annual Rate </h3>](#index.top)

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

[<h3 id="simple.return"> Simple Return </h3>](#index.top)

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

[<h3 id="portfolio.return">Portfolio Return</h3>](#index.top)

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

[<h3 id="adj.for.dividends"> Adjusting for dividends </h3>](#index.top)

> some companies will give thier share holders `dividends` \
> how to compute the `simple return with dividends` ? 

```r
# suppose dividends per share is d = 1
# we can think the sell price is actually p_2 + d
p_1 <- 10.11
p_2 <- 13.83
d <- 1

amount <- 10000 / p_1
# you have amount units of shares
# so the money you get from the company is amount * d
earning <- amount * p_2 + amount * d
# earning <- amount * (p_2 + d)
# we set p_2' = p_2 + d
# so the formula of dividends case is
# (p_2 + d) / p_1 - 1
```


> so formula is ` (p_t + d) / p_(t-1) - 1` \
>   =  `p_t / p_(t-1) - 1` + ` d / p_(t-1)` \
>   =  `capital gain return` + `dividend yield`

---

[<h3 id="adj.for.inflation">Adjusting for Inflation</h3>](#index.top)

> inflation is also a big issue \
> so we must to adjusting it

```r
# we can find CPI at each period
# then adjust each period
p_1 <- 10.11
CPI_1 <- 100.3

p_2 <- 13.83
CPI_2 <- 101.2

real_p_1 <- p_1 / CPI_1
real_p_2 <- p_2 / CPI_2

# then compute the process same as simple return
# we can get real_p2 / real_p1 - 1
#         = ( p_2 / CPI_2 ) / ( p_1 / CPI_1 ) - 1
#         = ( p_2 / p_1 ) * ( CPI_1 / CPI_2 ) - 1
```
[see Simple Return](#simple.return)

> the formula = `( real_p_t / real_p_(t-1) ) - 1` \
>             =  `( p_t / p_(t-1) ) * ( CPI_t / CPI_(t-1) ) - 1`



---
[<h3 id="annualizing.return">Annualizing Return</h3>](#index.top)
 
> similar to E.A.R sometimes you invest different stock \
> plan A simple return is 0.05 in 4 month \
> plan B simple return is 0.04 in 3 month \
> which plan is more efficiently? 

[see E.A.R](#E.A.R)

```r
# the concept of Annualizing is you think all situations are the same
# you can have the same efficiency to make or (loss) money
# so extend ( or compress ) the period to one year ( annualizing )

# plan A , 4 months, 0.05 simple return
# extent to, 12 months
(1 + 0.05) ^ ( 12 / 4 ) - 1
# 0.157625 
# not 0.05 * 3 (12 is 3 times for 4 months)

# plan B
(1 + 0.04) ^ ( 12 / 3 ) - 1
# 0.1698586
```
> plan B has higher efficiency to make money

plan A |🏆 plan B
-------|-------
0.1576 |0.1699

> formula is `( 1 + plan_return ) ^ ( 12 / plan_take_time_in_month ) - 1`

---

[<h3 id="average.returns">Average Returns</h3>](#index.top)

> you invest in 2 plans at June and December \
> June simple return is 0.07 \
> December simple return is 0.24 \
> what is your month average returns \
> or generally speaking, what is your efficiency to make money?

```r
r1 <- 0.07
r2 <- 0.24

# Arithmetic average (must be misleading)
( r1 + r2 ) / 2
# 0.155
# formula is ( r1 + r2 + ... + rn ) / n

# Geometric average (better measure of average return)
( ( 1 + r1 ) * ( 1 + r2 ) ) ^ ( 1 / 2 ) - 1
# 0.151868
```

> the first method is simple but must be misleading \
> the `concept of second method` is \
> if you has $1000 and invest in plan 1 and plan 2
>

```r
r1 <- 0.07
r2 <- 0.24

( earning <- 1000 * (1 + r1 ) * ( 1 + r2 ) )
# 1326.8

# simple return of 2 project is 
earning / 1000 - 1
# 0.3268
# so you use two month to have 0.3268 
# and what if you use only one month ?
# or what is your average month returns ? 

# we think there exists a average month returns
# and you extend it 2 month like annualizing method
# you get 0.3268 as 2 months returns
# (1 + average.month.returns) ^ 2 - 1 = 0.3268
# so average.month.retuens is
( 1 + 0.3268 ) ^ ( 1 / 2 ) - 1
# 0.151868
```

---

[<h3 id="cc.return">Continuous Compounded Returns</h3>](#index.top)

> we can transform simple return to average returns \
> and you must think how to transform to cc return?

```r
# suppose a one month project;s simple return is 0.08
r1 <- 0.08

# we need to find out what cc return has same efficiency
# e(r1.cc) = 1 + r1
# so, obviously we just need to take a log
# r1.cc = log(1 + r1)

log(1 + r1)
# 0.07696104


p_1 <- 10.11
p_2 <- 13.83

# cc.return of this period is

log( p_2 / p_1 )
# 0.3133151

# note: p_2 / p_1 = 1 + simple return
# log(p_2 / p_1) = log(p_2) - log(p_1)

# suppose we have p_3
p3 <- 14.27

# cc 2 month return is
#   log( (p_3 / p_2)   *   (p_2 / p_1) )
# = log(p_2 / p_1) +  log( p_3 / p_2)
#  cc_first_month_return + cc_second_month_return
# it is useful if we assume cc_month_return 
# is i.i.d normally distributed every month


# portfolio cc return
# first compute portfolio simple return
# ( x1*r1 + x2*r2 + x3*r3 + .... xn*rn )
# take log
# log( 1 + portfolio.simple return )


# real_return (with out inflation)
# log( ( p_2 / p_1 ) * ( CPI_1 * CPI_2) )
# = log( p_2 / p_1 ) +  log( CPI_1 / CPI_2 )
# = log( p_2 / p_1 ) - log ( CPI_2 / CPI_1 )
# = cc.return - cc.infation

```





