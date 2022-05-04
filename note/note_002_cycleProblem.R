# cycle problem
# How many cycles?

# initial :
#  1  2  3  4
# after permutation
#  3  1  2  4
#  there are 2 cycles
#  1 -> 3 -> 2 -> 1;   4 -> 4

# first cycle is:
#  1st place changes to 3, 
#  3rd place changes to 2,
#  2nd place changes to 1, 1st -> 1, close this cycle

# second cycle is:
# 4th place change to 4, 4th -> 4, close this cycle, 
# this situation is also called fix point.
# does not change place after permutation.

# initial :
#  1  2  
# after permutation
#  2  1
#  there is 1 cycle
#  1 -> 2 -> 1


# initial :
#  1  2  
# after permutation
#  1  2
#  there are 2 cycles
#  1 -> 1;   2 -> 2


# to simplify question a create a class to be a cycle container.

Container <- setRefClass(
    "Container", fields = list(cycle = "numeric"),
    methods = list( 
            add = function(newItem) { cycle <<- c(cycle, newItem) },
            check = function(Item) { Item %in% .self$cycle },
            len = function(...) { length(.self$cycle)} 
        )
)

# create a cycle with initial value
cycle1 <- Container(cycle = 2)
cycle1

# add next
cycle1$add(23)
cycle1

# check 3 in this cycle?
cycle1$check(3)
# > FALSE

# check 2 in this cycle?
cycle1$check(2)
# > TRUE

# get this contained cycle's length
cycle1$len()

