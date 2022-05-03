`%^%` <- function(K, n) {
  I <- diag(ncol(K))
  power <- function(A, n) {
    if( n %/% 2 >= 1 ) {
      B <- ifelse( A %% 2 == 1, A, I)
      A <- A %*% A
      return(B %*% power(A, n %/% 2))
    }else{
      return(A)
    }
  }
  return(power(K, n))
}

K <- matrix(
  c(1/5, 2/5, 2/5,
    0, 0, 1,
    1/2, 0, 1/2), ncol = 3, byrow = T
)

K %^% 1000

