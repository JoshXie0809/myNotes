# flip a coin with probability p to have a head
# write head = 1, number = 0
# what is the expected value
# when head appears countinuouslly n times
# for n = 3,
# 111, 3 times to have "111"
# 0111, 4 times to have "111"
# 100111, 6 times to have "111"

library(Rcpp)

cpptxt <- '
    int allOne( int oneNum, double prob ) {
        int count = 0, trial = 0;
        while( count < oneNum ) {
           if(runif(1)[0] <= prob ) {
                count++;
           } else {
                count = 0;
           }
           trial++;
        }
        return trial;
    }
'
cppFunction(cpptxt)

simu <- function(oneNum, prob, B = 1e4) 
    replicate(B, allOne(oneNum, prob))


# to have "11", p = 0.5
# mean(simu(2, .5))



