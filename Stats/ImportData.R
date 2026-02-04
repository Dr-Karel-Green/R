frame <- read.csv("./Stats/Data/people-10000.csv")

print(nrow(frame))
print(ncol(frame))
print(head(frame))#by default returns the top 6 rows of the data frame
print(tail(frame))#by default returns the bottom 6 rows of the data frame
print(summary(frame))

cat("\nRow#1, Column#2:", colnames(frame)[2], frame[1,2],"\n")
cat("\nRow#6, Column#9:", colnames(frame)[9], frame[6,9],"\n")

subset1 <- frame[c(1,7,9)] #columns 1, 7 and 9 of full frame
subset2 <- frame[1:4] #columns 1-3 of full frame
subset3 <- frame[4,] #row 4 of full frame