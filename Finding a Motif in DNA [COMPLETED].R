# Finding a Motif in DNA
# Name: Mellanie Martin
# Summary: The following solves the "Finding a Motif in DNA" Rosalind Challenge
# in the Bioinformatics Stronghold
# Status: COMPLETE

input <- readLines("input.txt", warn = FALSE) # Load data

DNAseq <- input[1] # line 1 of data file is DNA string
substring <- input[2] # line 2 of data file is the substring being searched for

print(DNAseq)     #
print(substring)  # Test commands to make sure the lines are being assigned to the variables correctly

gregexpr(paste0("(?=", substring, ")"), DNAseq, perl=TRUE)
# kind of works...? Prints a mess after results