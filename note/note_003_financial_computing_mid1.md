* [CH1](#ch1) 
  * [Compounding](#compounding)



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













