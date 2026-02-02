data <- seq(1:32)

table <- matrix(data, nrow=4, ncol=8) #Puts values in column order
print(table)
print(is.matrix(table))

print(table[4,5])

table <- matrix(data, nrow=4, ncol=8,byrow=TRUE) #Puts values in row order
print(table)

print(t(table)) #transposed matrix
