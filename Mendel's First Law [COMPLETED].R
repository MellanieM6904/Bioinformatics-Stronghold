# Mendel's First Law
# Name: Mellanie Martin
# Summary: The following solves the "Mendel's First Law" Rosalind Challenge
# in the Bioinformatics Stronghold
# Status: COMPLETE

# source aid: http://saradoesbioinformatics.blogspot.com/2016/06/mendels-first-law.html

k <- 26                                                        
m <- 23                                                       
n <- 27                                                      
population <- k + m + n                                               
probability <- (4*(k*(k-1)+2*k*m+2*k*n+m*n)+3*m*(m-1))/(4*population*(population-1))
print(probability)                                                   