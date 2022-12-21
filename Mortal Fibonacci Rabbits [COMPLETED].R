# Mortal Fibonacci Rabbits
# Name: Mellanie Martin
# Summary: The following solves the "Mortal Fibonacci Rabbits" Rosalind Challenge
# in the Bioinformatics Stronghold
# Status: COMPLETE

library(index0)

fib_rabbits <- function(n, m) {
  # Initialize an array to store the number of rabbit pairs at each month
  rabbits <- index_from_0(integer(n))
  
  # Set the initial number of rabbit pairs to 1
  rabbits[1] <- 1
  
  # Iterate through the months
  for (i in 2:n) {
    # If the current month is less than or equal to the lifespan of the rabbits (m),
    # then the number of rabbit pairs in the current month is the sum of the number
    # of rabbit pairs in the previous two months.
    if (i <= m) {
      rabbits[i] <- rabbits[i - 1] + rabbits[i - 2]
    } else {
      # If the current month is greater than the lifespan of the rabbits (m),
      # then the number of rabbit pairs in the current month is the sum of the
      # number of rabbit pairs in the previous two months minus the number of rabbit
      # pairs that have exceeded the lifespan (m) in the previous month.
      rabbits[i] <- rabbits[i - 1] + rabbits[i - 2] - rabbits[i - m - 1]
    }
  }
  
  # Return the number of rabbit pairs in the n-th month
  return(rabbits[n])
}
fib_rabbits(75, 21)
