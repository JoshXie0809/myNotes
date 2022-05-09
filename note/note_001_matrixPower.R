
# My thought:

#   K^100
# = (K^2)^50
# = (K^4)^25
# = (K^4)^1 %*% (K^8)^12
# = (K^4)^1 %*% (K^16)^6
# = (K^4)^1 %*% (K^32)^3
# = (K^4)^1 %*% (K^32)^1 %*% (K^64)^1


`%^%` <- function(K, n) {
  power <- function(A, n) {
    
    if( n %/% 2 >= 1 ) {
      B <- diag(ncol(A))
      if( n %% 2 == 1 ) B <- A
      A <- A %*% A
      return(B %*% power(A, n %/% 2))
    }else{
      return(A)
    }
  } 
  return(power(K, n))
}

# # create a matrix which cannot be diagonalized
# # if a matrix K = P %*% D %*% P.inv
# # use K^n = P %*% D^n %*% P.inv

# K <- matrix( c(1/5, 2/5, 2/5,
#                  0, 0, 1,
#                  1/2, 0, 1/2), ncol = 3, byrow = T)

# # and compute with power 100
# K %*% K %*% K ...... (100 times) ...
# K %^% 100


