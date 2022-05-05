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
    latest = function(...) { .self$cycle[length(.self$cycle)] },
    print = function(...) { 
      cat( paste(c(.self$cycle, .self$cycle[1]), collapse = ' -> '), '\n' ) 
    }
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


# what is the newest element in cycle2?
cycle1$latest()
# [1] 23

# print cycle1
cycle1$print()
# 2 -> 23 -> 2




# deal with process  
# input a array which is after permutation
listCycle <- function ( afterPermuation ) {
    
  # if afterPermutation(ap) is c(4, 2, 1, 3)
  # we know it come from c(1, 2, 3, 4)
  init <- 1:length(afterPermuation)
  
  # result
  res <- list()
  
  
  # ap   is c(4, 2, 1, 3)
  # init is c(1, 2, 3, 4)
  # if length(init) == 0 is true, we return res
  
  # we create a cycle begin with 1 (init[1])
  # next we get ap 1st place is 4
  # check 4 in this cycle?
      # true: this cycle close, return cycle,
      # false: add 4 in this cycle,
  # then, answer is false, add 4
  
  # next, ap 4th place is 3
  # check 3 in this cycle? 
  # add 3 in this cycle
  
  # next, ap 3rd place is 1
  # check 1 in this cycle?
  # true, return cycle.
  
  process <- function( container ) {
      if( container$check( afterPermuation[ container$latest() ] ) ) {
          return( container )
      } 

      container$add( afterPermuation[ container$latest() ] )
      return( process( container ) ) 
  }
  
  # init is c(1, 2, 3, 4)
  # 1st proce return cycle: 1 -> 4 -> 3 -> 1
  # setdiff(init, 1st cycle) = 2
  # go next time process
  # until init = c(), length == 0 is true
  
  while ( length(init) > 0 ) {
      cyc <- Container(cycle = init[1] )
      res[[length(res)+1]] <- process(cyc)
      init <- setdiff(init, cyc$cycle)
  }

  return( res )
}


# try

set.seed(1)
ap <- sample(1:10, size = 10)
ap

# ap must be: 
# [1]  9  4  7  1  2  5  3 10  6  8

# the answer of cycle:
# 1 -> 9 -> 6 -> 5 -> 2 -> 4 -> 1
# 3 -> 7 -> 3 
# 8 -> 10 -> 8

res <- listCycle(ap)
for( i in res) {
    i$print()
}
# 1 -> 9 -> 6 -> 5 -> 2 -> 4 -> 1 
# 3 -> 7 -> 3 
# 8 -> 10 -> 8 
