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


# AR(p) 
# use AR(1) as example

# Yt = d + a Y_t-1 + epsilon_t , epsilon ~ GWN(0, var)
# E(Yt) = E( d +  a ( d + a Y_t-2 + epsilon_t-1 )
#       = E( d + ad + a^2 d + a^3 d + .......
#         + a^inf+1 Yt + epsilon .... )
#      = d / (1 - a), for -1 < a < 1

# Var(Yt)
# E( Yt Y_t-k ) = Cov(Yt, Y_t-k) + mu^2
# gamma_k = Cov(Yt, Y_t-k)

# first both sides multiple Yt and find expected value
# E(Yt Yt) = E(dYt + a Yt Y_t-1 + epsilon Y_t)
# gamma0 + mu^2 = d*mu + a*(gamma1 + mu^2) + var   
# gamma0 = var + {d*mu - (1 - a) mu^2} + a gamma1

# second, both sides multiple Y_t-1 and find expected value 
# E(Yt Y_t-1) = E(dYt + a Y_t-1 Y_t-1 + epsilon Y_t-1)
# gamma1 + mu^2 = d*mu + a*(gamma0 + mu^2) 
# gamma1 = {d*mu - (1-a) mu^2} + a gamma0

# go to previos step and replace gamma1
# gamma0 = var + {d*mu - (1 - a) mu^2} + a gamma1
#        = var + {d*mu - (1 - a) mu^2} + a ( {d*mu - (1-a) mu^2} + a gamma0 )
#        = var + {d*mu - (1 - a) mu^2} (1 + a) a gamma0
# (1-a) gamma0 = var + {d*mu - (1 - a) mu^2} (1+a)


# gamma0 = var / (1-a)    +       {d*mu - (1 - a) mu^2} * (1+a) / (1-a)
# gamma1 = {d*mu - (1-a) mu^2} + a gamma0

# gamma2
# E(Yt Y_t-2) = E( dY_t-2 + aY_t-1 Y_t-2 + epsilon Y_t-2 )
# gamma2 + mu^2 = d*mu + a*(gamma1 + mu^2)
#               = {d*mu - (1 - a) mu^2} + a gamma1
#               = {d*mu - (1 - a) mu^2} ( 1 + a) + a^2 gamma0

# gamma3
# E(Yt Y_t-3) = E( dY_t-3 + aY_t-1 Y_t-3 + epsilon Y_t-3 )
# gamma3 + mu^2 = d*mu + a*(gamma2 + mu^2)
#               = {d*mu - (1 - a) mu^2} + a gamma2
#               = {d*mu - (1 - a) mu^2} ( 1 + a + a^2) + a^3 gamma0

# gamma k
# {d*mu - (1 - a) mu^2} * (1 - a^k)  / (1 - a)    + a^k gamma0
```
