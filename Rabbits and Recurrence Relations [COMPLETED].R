# Rabbits and Recurrence Relations (Fibonacci Rabbits)
# Name: Mellanie Martin
# Summary: The following solves the "Rabbits and Recurrence Relations" 
# Rosalind Challenge in the Bioinformatics Stronghold
# Status: COMPLETE

# Define a function to compute the number of rabbit pairs after n months
rabbit_pairs <- function(n, k) {
  # Initialize an array to store the number of rabbit pairs after each month
  dp <- rep(0, n + 1)
  
  # Set the number of rabbit pairs after the first and second months
  dp[1] <- 1
  dp[2] <- 1
  
  # Iterate over the values of n from 3 to the given value of n
  for (i in 3:n) {
    # Use the recurrence relation to compute the number of rabbit pairs
    # after the i-th month
    dp[i] <- dp[i - 1] + k * dp[i - 2]
  }
  
  # Return the number of rabbit pairs after the n-th month
  return(dp[n])
}

# Test the function with the sample input
print(rabbit_pairs(34, 3)) # should print 19
