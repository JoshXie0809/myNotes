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
      cat( paste(c(.self$cycle, .self$cycle[1]), collapse = '->'), '\n' ) 
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
cycle$latest()
# [1] 23

# print cycle2
cycle2$print()
# 2->23->2




# process a 

listCycle <- function ( afterPermuation ) {
  
  init <- 1:length(afterPermuation)
  res <- list()
  
  process <- function( container ) {
    if( container$check( afterPermuation[ container$latest() ] ) ) {
      return( container )
    } 
    
    container$add( afterPermuation[ container$latest() ] )
    return( process( container ) ) 
  }
  
  while ( length(init) > 0 ) {
    cyc <- Container(cycle = init[1] )
    res[[length(res)+1]] <- process(cyc)
    init <- setdiff(init, cyc$cycle)
  }
  
  return( res )
  
}



