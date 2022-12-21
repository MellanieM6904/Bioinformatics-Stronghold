# Caclulating Protein Mass
# Name: Mellanie Martin
# Summary: The following solves the "Calculating Protein Mass" Rosalind Challenge
# in the Bioinformatics Stronghold
# Status: COMPLETE

protein <- readLines("rosalind_prtm.txt", warn = FALSE)

proteinMass <- function(proteinSeq) {
  
  monoisotopicMassTable <- data.frame(
    aminoAcidAlphabet <- readLines("Amino Acid Alphabet.txt", warn = FALSE),
    weights <- readLines("Monoisotopic Masses.txt", warn = FALSE)
  )
  
  splitProtein <- strsplit(proteinSeq, "")[[1]]
  
  totalWeight <- 0
  
  for (i in splitProtein) {
    aaWeight <- monoisotopicMassTable$weights[
      monoisotopicMassTable$aminoAcidAlphabet == i]
    totalWeight <- totalWeight + as.numeric(aaWeight)
  }
  print(totalWeight)
  writeLines(as.character(totalWeight), "output.txt")
}

proteinMass(protein)
