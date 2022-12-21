# Computing GC Content
# Name: Mellanie Martin
# Summary: The following solves the "Computing GC Content" Rosalind Challenge
# in the Bioinformatics Stronghold

input <- readLines("rosalind_gc.txt", warn = FALSE)

GCcontent <- function(inputFile) {
  
  inputFile <- gsub(">", "", inputFile) # removes > from input file
  
  FASTAfile <- data.frame(
    IDs = inputFile[seq(1, length(inputFile), 2)], # from line 1 to EOF (length(input)), take every other line
    DNAstrings = inputFile[seq(2, length(inputFile), 2)] # from line 2 to EOF (length(input)), take every other line
  )
  
  dataCollected <- data.frame(
    rosalindID = c(),
    gcPercentage = c()
  )
  
  totNucs <- 0
  gcCount <- 0
    
    for (i in FASTAfile$DNAstrings) {
      splitString <- strsplit(i, "")[[1]]
      
      for (k in splitString) {
        totNucs <- totNucs + 1 # counts the number of nucleotides in DNA string
        nucFreq <- as.data.frame(table(splitString))
        gcCount <- nucFreq[2, "Freq"] + nucFreq[3, "Freq"] # C is at row 2, G is at row 3
      }
      
      GCP <- gcCount/totNucs*100 # Get percentages
      
      # Append IDs and GCP to dataCollected
      dataCollected <- rbind(dataCollected, data.frame(
        rosalindID = FASTAfile$IDs[FASTAfile$DNAstrings == i],
        gcPercentage = GCP
      ))
      
      # Reset values for next iteration
      GCP <- 0
      totNucs <- 0
      gcCount <-0
      
    }
  
  # Find out which DNA string has the highest GC Content
  maxGCP <- max(dataCollected$gcPercentage)
  maxID <- dataCollected$rosalindID[dataCollected$gcPercentage == maxGCP]
  
  # Print results
  print(maxID)
  print(maxGCP)
  
}

GCcontent(input)