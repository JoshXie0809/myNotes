# Huygens's second problem is
# n players draw a ball with replacement in a bag in order
# bag contains a white balls, b black balls
# the first one who draws white ball is winner
# succeed rate is a / (a+b)


# use Rcpp
library(Rcpp);

cpptxt <- "
    int winner( int playerNum, double succeedRate) {
        while(1) {
            for( int p = 0; p < playerNum; p++ )
                // runif(1) return a vector
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


# do simulation 
# -----------------------------------------------------------

# url <- "https://raw.githubusercontent.com/JoshXie0809/myNotes/main/note/note_009_Huygens%E2%80%99s_second_problem.R"
# source(url)

## 2 player with succeedRate 0.5
# table(simu(2, succeedRate = .5))

## 4 player with 2 white balls, 5 black balls
# table(simu(4, a = 2, b = 5))




# theory
# ----------------------------------------------------------
# suppose beta = b / (a+b)
# the first player win rate is (1 - beta ) / (1 - beta^n) 
# the nth player win rate is  beta^(n-1) * ( (1 - beta ) / (1 - beta^n) )

# set.seed(1)
# prop.table(table(simu(3, a = 1, b = 2, B = 1e5)))

#       0       1       2 
# 0.47614 0.31284 0.21102

# beta <- 2 / 3
# (1 - beta) / (1 - beta^3) * beta^(0:2)
# 0.4736842 0.3157895 0.2105263



















