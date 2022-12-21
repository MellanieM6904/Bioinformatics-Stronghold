# Consensus and Profile
# Name: Mellanie Martin
# Summary: The following solves the "Consensus and Profile" Rosalind Challenge
# in the Bioinformatics Stronghold
# Status: INCOMPLETE

# libraries
library(dplyr)
# libraries

input <- readLines("input.txt", warn = FALSE) # Pulls data file

consensusProfile <- function(input) {
  
  # input file modification
  noIDs <- gsub("^>Rosalind_\\d+$", "", input) # Removes IDs
  writeLines(noIDs, "input.txt")
  noBlankLines <- readLines("input.txt")
  cat(grep("^$", noBlankLines, invert = TRUE, value = TRUE),
      file = "input.txt", sep = "\n")
    # cat; writes to output.txt
    # grep; "^$" removes all blank lines, invert keeps all lines that DO NOT 
    # match the pattern, value makes it return the lines themselves instead 
    # of the indices
  # Input file in useable form; file now ONLY contains DNA strings
  cleanedInput <- readLines("input.txt", warn = FALSE)
  stringLen <- length(strsplit(cleanedInput[1], "")[[1]]) # Get length of DNA strings
  # in this challenge, all DNA strings are the same length
  
  # Make empty data frame to create the profile
  profile <- data.frame()
  for (j in 1:4) { # create 4 rows in the data frame to represent A C G T
    profile <- rbind(profile, c(j, j))
  }
  
  
  for (n in 1:stringLen) { # create as many data columns as there are letters in the DNA strings
    concatenated <- c() # create empty vector to hold concatenated string
    for (i in cleanedInput) { # iterate through each DNA string
      splitSeq <- strsplit(i, "")[[1]] # split i so each letter is a vector item
      # combine each letter of index n from all DNA strings
      concatenated <- c(concatenated, paste(splitSeq[n], collapse = ""))
      # Set up data frame; the values in concatenated column will be 
      # A C G T, and all values in the Freq column will be set to 0.
      # Freq values are changed later, so setting them to 0 does not
      # permanently make them 0
      f <- factor(c("A", "C", "G", "T"), levels = c("A", "C", "G", "T"))
      nucCount <- data.frame(concatenated = f, Freq = 0)
      
      ACount <- 0
      CCount <- 0 # initialize values to count the frequency of each nucleic acid
      GCount <- 0
      TCount <- 0
      
      for (k in concatenated) {
        if (k == "A") { # if nucleic acid is A, add to the frequency of A
          ACount <- ACount + 1
        }
        if (k == "C") {
          CCount <- CCount + 1
        }
        if (k == "G") {
          GCount <- GCount + 1
        }
        if (k == "T") {
          TCount <- TCount + 1
        }
      }
      
      nucCount[1, 2] <- ACount # replace Freq value with ACount
      nucCount[2, 2] <- CCount
      nucCount[3, 2] <- GCount
      nucCount[4, 2] <- TCount
      
      for (m in n) { # make a column in profile for each concatenated string 
        profile[, paste0("Freq", m)] <- nucCount[, "Freq"]
      }
    }
  }
  
  # rename rows for profile
  rowLabels <- c("A:", "C:", "G:", "T:")
  row.names(profile) <- rowLabels
  profile <- select(profile, -X1L, -X1L.1) # Remove excess columns made when 
  # rows were added to the data frame
  return(profile)
}

consensusProfile(input)