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
 
### Skewness : the test of symmetric
 
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
 
### kurtosis : the measuremet of extreme events
 
> `mu`, the mean of a random variable X\
> `sd`, the standard deviaiton of a random variabe X\
> let g(x) = ((X-mu) / (sd))^4\
> `Skewness` = E ( g(x) )\
> `Kurtosis` measure the area far from mean, \
> so the higer value of `Kurtosis` represent there's\
> a high probability for extreme events.
 
Normal distrution's `Kurtosis` | `Excess Kurtosis`
:-----------------------------:|:----------------:
`3`                            | `Kurt(X) - 3`

> `Excess Kurtosis` use normal dist. as standard 

 
 
 
 
 
 

