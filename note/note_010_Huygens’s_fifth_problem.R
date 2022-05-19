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
        while( player0 > 0 && player1 > 0 ) {
            if( runif(1)[0] <= p ) {
                // player0 win
                player0 += 1; 
                player1 -= 1;
            }else{
                // player1 win
                player1 += 1; 
                player0 -= 1;
            }
        }
        if(player0 > player1) return 0;
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








