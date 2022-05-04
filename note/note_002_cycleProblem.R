
# to simplify question a create a class to be a cycle container.

Container <- setRefClass(
    "Container", fields = list(cycle = "numeric"),
    methods = list( 
        add = function(newItem) { cycle <<- c(cycle, newItem) },
        check = function(Item) { Item %in% cycle } )
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




