ny <- c(3.8,5.5,9.9,15.7,21.5,26.3)
la <- c(19.5,19.4,19.7,20.8,21.3,22.7)
fw <- c(13.7,15.4,20.0,24.6,28.5,32.7)

table <- cbind(ny, la, fw)
colnames(table) <- c("New York", "Los Angeles", "Fort Worth")
rownames(table) <- month.abb[1:6]

table.q1 <- table[1:3, c(1,3)] #First three rows, first three columns
print(table.q1)