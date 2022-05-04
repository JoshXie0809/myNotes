
# to simplify question a create a class to be a cycle container.

Container <- setRefClass(
    "Container", fields = list(cycle = "numeric"),
    methods = list( add = function(newItem) { cycle <<- c(cycle, newItem) } )
)

# create a cycle with initial value
Cycle1 <- Container(cycle = 2)
Cycle1

# add next
Cycle1$add(23)
Cycle1
