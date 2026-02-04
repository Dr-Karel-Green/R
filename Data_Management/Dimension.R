data <- 1:28
table <- matrix(data, nrow=4, ncol=7, byrow=TRUE, dimnames=list(letters[1:4], LETTERS[1:7]))
print(table)

tier=table[2,] #Need the comma or it will just extract the second element, which is the number 8
print(tier)
cat("\n")
tier=table[2,,drop=FALSE] #keeps the row name
print(tier)