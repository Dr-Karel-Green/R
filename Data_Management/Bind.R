#You can bind vectors to combine multiple data from different sources

start <-LETTERS[1:10] 
finish <-LETTERS[17:26] 
numeric <- seq(1:10)

table_row <- rbind(start, finish, numeric)
cat("\nBind Rows:\n\n")
print(table_row)

table_col <- cbind(start, finish, numeric)
cat("\nBind Columns:\n\n")
print(table_col)