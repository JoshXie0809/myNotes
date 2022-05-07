<h1 id="index.top">Index</h1>

* [CH1](https://github.com/JoshXie0809/myNotes/blob/main/note/note_003_financial_computing_mid1_ch1.md#ch1)
* [CH2](#ch2)

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
 
 > `mu`, the mean of a random variable X\
> `sd`, the standard deviaiton of a random variabe X\
> let g(x) = ((X-mu) / (sd))^4\
> `Skewness` = E ( g(x) )
 ---
 
[<h3> kurtosis : the measuremet of extreme events </h3>](#index.top)
 

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
      from = 9000, to = 12000,
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


















 
 

