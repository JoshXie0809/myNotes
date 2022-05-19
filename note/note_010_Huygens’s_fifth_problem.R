# Huygens's fifth problem
# 2 players
# player0 has [a] coins, player1 has [b] coins
# player0 has probability p to win
# then player1 give 1 coin to player0
# vice versa, 
# player1 has 1-p chance to win 1 coin
# find the probability player0 is ruined
# ruined: player has 0 coin


library(Rcpp)

cpptxt <- "
    int winner(int player0, int player1, double p) {
        // when playerx == 0, xth player is ruined
        int total = player0 + player1;
        while( player0 > 0 && player0 < total ) {
            if( runif(1)[0] <= p ) {
                // player0 win
                player0 += 1; 
            }else{
                // player1 win
                player0 -= 1; 
            }
        }
        if(player0 > 0) return 0;
        return 1;
    }    
"
cppFunction(cpptxt)

simu <- function(player0, player1, prob, B = 1e4) {
    replicate(B,{
        winner(player0, player1, prob)
    })
}



# simu is find the winner

# set.seed(1234)
# prop.table(table(simu(3, 3, .4)))

#      0      1 
# 0.2202 0.7798 

# the win rate for player is 0.22
# so ruined rate is 0.78



# theory
# let 
# n = [a] + [b], the total coins
# p = probability player0 win
# 0 < p < 1, p!= 0.5

# R_x = the probability player0 now has x coins, 
#       and finally player0 win
# R_0 = 0, R_n = 1

# let A = (1-p) / p
# R_x = (1 - A^x) / (1 - A^n)


# from simu

# n <- 3 + 3
# p <- .4
# A <- (1-p) / p
# R_3 <- (1-A^3) / (1-A^n)
# R_3
# 0.2285714








