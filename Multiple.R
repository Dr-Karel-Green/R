alphabet <- c("Alpha", "Bravo", "Charlie")
print(alphabet)

print(paste("2nd element", alphabet[2]))
print(paste("Vector Length", length(alphabet)))
alphabet[5] <- "Echo"
print(paste("New vector length:", length(alphabet)))
print(paste("Is alphabet a vector? ", is.vector(alphabet)))