# Huygens's second problem is
# n players draw a ball with replacement in a bag in order
# bag contains a white balls, b black balls
# the first one who draws white ball is winner
# succeed rate is a / (a+b)


# use Rcpp
library(Rcpp);

cpptxt <- "
    int Winner( int playerNum, double succeedRate) {
        while(1) {
            for( int p = 0; p < playerNum; p++ )
                # runif(1) return a vector
                if( runif(1)[0] <= succeedRate)
                    return p;
        }
    }
"

cppFunction(cpptxt);

simu <- function(n, a = NULL, b = NULL, B = 1e4, succeedRate = 0.1) {
    if(!(is.null(a) || is.null(b)) ) succeedRate = a / (a+b);
    replicate(B, {
        winner(n, succeedRate);
    });
} 

# 2 player with succeedRate 0.5
# table(simu(2, succeedRate = .5))


# 4 player with 2 white balls, 5 black balls
# table(simu(4, a = 2, b = 5))





