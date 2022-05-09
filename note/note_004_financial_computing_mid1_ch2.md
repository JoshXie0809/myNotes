<h1 id="index.top">Index</h1>

* [CH1](https://github.com/JoshXie0809/myNotes/blob/main/note/note_003_financial_computing_mid1_ch1.md#ch1)
* [CH2](#ch2)
* [CH3](https://github.com/JoshXie0809/myNotes/blob/main/note/note_005_financial_computing_mid1_ch3.md#ch3)
* [CH4](https://github.com/JoshXie0809/myNotes/blob/main/note/note_006_financial_computing_mid1_ch4.md#ch4)
---
[<h2 id="ch2"> Ch2 </h2>](#index.top)
---


> `cdf(x) = Pr( X < x)`

> `Expected Value `

x | prob
--|----
a |  p1
b |  p2
c |  p3

<span>&mu;</span> = `a*p1 + b*p2 + c*p3`

> `Variance` = \
(a - <span>&mu;</span> ) ^ 2 * p1 + \
(b - <span>&mu;</span> ) ^ 2 * p2 + \
(c - <span>&mu;</span> ) ^ 2 * p3

> `Standard deviation` = sqrt( `Variance` )

---

### The normal distribution is more appropriate for cc returns

simple return | cc return
:------------:|:---------:
`R_t` | `r_t`

> r_t = log ( 1 + R_t ) \
> R_t = exp( r_t ) - 1

---
 
[<h3>Skewness : the test of symmetric</h3>](#index.top)
 
> `mu`, the mean of a random variable X\
> `sd`, the standard deviaiton of a random variabe X\
>  let g(x) = ((X-mu) / (sd))^3\
>  `Skewness` = E ( g(x) )\
>  the usage of `Skewness` is testing the symmetric of r.v. X

Skew(X) < 0  | Skew(X) = 0   | Skew(X) > 0
:-----------:|:-------------:|:-----------:
 `skew to left`| `symmetric` | `skew to right`
 `median < mu` | ... | `median > mu`
 `has long tail to the left` | ... | `has long tail to the right`
 

 ---
 
[<h3> kurtosis : the measuremet of extreme events </h3>](#index.top)
 
> `mu`, the mean of a random variable X\
> `sd`, the standard deviaiton of a random variabe X\
> let g(x) = ((X-mu) / (sd))^4\
> `Kurtosis` = E ( g(x) )

> `Kurtosis` measure the area far from mean, \
> so the higer value of `Kurtosis` represent there's\
> a high probability for extreme events.
 
Normal distrution's `Kurtosis` | `Excess Kurtosis`
:-----------------------------:|:----------------:
`3`                            | `Kurt(X) - 3`

> `Excess Kurtosis` use normal dist. as standard 

---

[<h3> Some examples </h3>](#index.top)

#### Q1
```r
# W0 = $10000
# a project has simple return R ~ N( mean = 0.05, var = (0.1)^2)
# W1 = W0 * ( 1 + R ), what is the distribution of W1?
# W1 = 10000 + 10000 * R
# W1 = 10000 + N( mean = 10000 * 0.05, var = (10000) ^ 2 * (0.1)^2 )
# W1 = N ( mean = 10500, var = ( 1000 ) ^ 2 )
curve(dnorm(x, mean = 10500, sd = 1000), 
      from = 5000, to = 16000,
      xlab = "W1", ylab = " pdf(w1) ", 
      bty = 'l', main = "probability density function of W1" ) 
```

#### Q2 Value-at-Risk ( `VaR` )
 
 > when you invest some stocks, you must want to figure out how much danger \
 > you have to risk? \
 > So we use `VaR` to measure the danger

```r
# from previos Question
# we know W1 ~  N ( mean = 10500, var = ( 1000 ) ^ 2 )
# we set risk at 5%
qnorm( 0.05, mean = 10500, sd = 1000 )
# 8855.146

# it means there is 5% pobabitlity your W1 less than $8855.146
# or

qnorm( 0.05, mean = 10500, sd = 1000 ) - 10000
# -1144.854
# you have 5% probability at least loss $1144.854

# sicne the second way is commonly loss $money
# so VaR is the number you must loss at condition
# at this example VaR at 5% is 1144.854
```

### Q3 `cc Returns' VaR`

> We can also use VaR conception in cc Returns

```r
# suppose you invest in a project with W0 = 10000
# this project has monthly cc return r ~ N(mean = 0.05, var = (0.1)^2 )
# what is the VaR at 5% in one month?

# first, find cc return at 0.05
(r_cc_0.05 <- qnorm(0.05, mean = 0.05, sd = 0.1))
# -0.1144854
# it means you have 5% probability to have cc return less tha -0.1144854

# second, from ch1 we know, cc return can transform to simple return
# exp(r_cc_0.05) = 1 + r_simple_0.05
( r_simple_0.05 <- exp(r_cc_0.05) - 1 )
# -0.108175

( VaR_0.05 <- -r_simple_0.05 * 10000 )
# 1081.75
# you have 0.05 probability at least loss 1081.75

```

```r
# now suppose you invest in this project a year
# what is your year VaR at 0.01
# suppose each month is indetically independent distributed 

# first, calculate year cc return dist.
# ry = r1 + r2 + r3 + ... + r12, ri = N(0.05, 0.1^2)
# ry = N( mean = 12*0.05, var = 12 * 0.1^2 )

# so ry_cc_0.01 is
(ry_cc_0.01 <- qnorm(0.01, mean = 12*0.05, sd = sqrt(12 * 0.1^2) ) )
# -0.2058705

# second transform to simple return
( ry_simple_0.01 <- exp(ry_cc_0.01) - 1 )
# -0.1860616

( year_VaR_0.01 <- -ry_simple_0.01 * 10000 )
# 1860.616
# you have 0.01 probability to loss at least $ 1860.616

# we can do some simulations to varify
set.seed(1)
res <- replicate(50000, {
    r_month_cc_array <- rnorm(12, mean = 0.05, sd = 0.1)
    # e(r1) * e(r2) * e... * e(r12) = e(r1 + r2 + ... + r12) = e(year cc return)
    r_year_cc <- sum( r_month_cc_array )
    r_year_simple <- exp(r_year_cc) - 1
    # now we have this year interset
    r_year_simple * 10000
})

plot(density(res), bty='l', xlab = '$', ylab = "prob", main = '')
abline(v = c(quantile(res, .01), -1860.616), 
       col = c("blue", "red"), lwd = c(1, 4), lty = c(1, 2) )

# you must find two lines are close
# blue line is simulation result
# red  line is theory result

```
















 
 

