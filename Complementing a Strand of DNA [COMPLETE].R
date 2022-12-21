# Complementing A Strand of DNA/taking the reverse compliment
# Name: Mellanie Martin
# Summary: The following solves the "Complementing a Strand of DNA" 
# Rosalind Challenge in the Bioinformatics Stronghold
# Status : COMPLETE

Reverse <- function(DNAseq) {
 splitSeq <- strsplit(DNAseq, "") [[1]]
 reverseChars <- rev(splitSeq) # Reverses the string
 reversedSeq <- paste(reverseChars, collapse = "") # Puts the split string of vectors back into a single string
 }

Compliment <- function(DNAseq) {
  DNAseq <- chartr("ATCG", "TAGC", DNAseq)
}

Sequence <- paste(readLines("rosalind_revc.txt", warn = FALSE), collapse = "\n")

print(Compliment(Reverse(Sequence)))

