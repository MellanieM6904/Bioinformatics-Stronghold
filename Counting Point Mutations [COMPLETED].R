# Counting Point Mutations
# Name: Mellanie Martin
# Summary: The following solves the "Counting Point Mutations" Rosalind Challenge
# in the Bioinformatics Stronghold
# Status: COMPLETE

input <- readLines("rosalind_hamm.txt", warn = FALSE)

string1 <- input[1]
string2 <- input[2]

countingPointMutations <- function(DNAstring1, DNAstring2) {
  split1 <- strsplit(DNAstring1, "")[[1]]
  split2 <- strsplit(DNAstring2, "")[[1]]
  
  hammingDistance <- sum(split1 != split2)
  
  print(hammingDistance)
}

countingPointMutations(string1, string2)