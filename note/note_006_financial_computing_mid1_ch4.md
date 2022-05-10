<h1 id="index.top"> Index </h1>

* [CH1](https://github.com/JoshXie0809/myNotes/blob/main/note/note_003_financial_computing_mid1_ch1.md#ch1) 
* [CH2](https://github.com/JoshXie0809/myNotes/blob/main/note/note_004_financial_computing_mid1_ch2.md#ch2)
* [CH3](https://github.com/JoshXie0809/myNotes/blob/main/note/note_005_financial_computing_mid1_ch3.md#ch3)
* [CH4](#ch4)
---
[<h3 id="ch4">Ch4</h3>](#index.top)

```r

# observed time serive Y with length t
# Y = c(Y1, Y2, Y3, ... Yt)

# strictly stationary is
# joint probability density function is identical
# pdf(Y1, Y2, Y3, ... Yt+1) = pdf(Ya, Ya+1, ... Ya+t)
# if {Yt} is strictly stationary, {Y^2_t) is also strictly stationary

# since strictly stationary is so strict
# we use covariance(weakly) stationary for alternative
# if {Yt} is weakly stationary
# E(Yt) = constant mu
# var(Yt) = constant variance
# cov(Yt, Y_t-k) is only correlate to time log k

# simple time series model
# MA(q) model
# Yt = mu + epsilon_t + theta_t-1 + epsilon_t-1 + .... theta_t-q elsilon_t-q, elsilon ~ GWN(0, var)
# E(Yt) = mu
# Var(Yt) = { 1^2 + theta_t-1 ^ 2 + ... + theta_t-q ^2 } * var
# Cov(Yt, Yt+1) = Cov( mu +                         epsilon_t + theta_t-1 + epsilon_t-1 + ............................ + theta_t-q elsilon_t-q,
#                      mu + epsilon_t+1 + theta_t-1 epsilon_t + theta_t-2 + epsilon_t-1 + .... theta_t-q elsilon_t-q+1

# if Cov(Yt, Yt+k), k > q, Cov = 0

```
