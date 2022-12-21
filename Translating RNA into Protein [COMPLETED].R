# Translating RNA into Protein
# Name: Mellanie Martin
# Summary: The following solves the "Translating RNA into Protein" Rosalind Challenge
# in the Bioinformatics Stronghold
# Status: COMPLETE

# Load the biostrings package
library(Biostrings)

# Read the RNA sequence from a file
rna_sequence <- RNAString(readLines("rosalind_prot.txt"))

# Translate the RNA sequence to a protein using the translate function from the biostrings package
protein <- translate(rna_sequence)

# Write the protein sequence to a file
writeLines(as.character(protein), "output.txt")