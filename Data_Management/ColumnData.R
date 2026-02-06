frame <- read.csv("Data_Management/data/people-10000.csv")

#function to output the title and first two lines of a data frame
display <- function(title){
  cat("\n", title, "\n")
  print(head(frame, n=2))
}

display("Original Columns")

female_all <- frame[frame$Sex=="Female",] #need comma or it doesn't work
cat("Female data")
print(female_all)

female <- frame[frame$Sex=="Female"& frame$Date.of.birth=="1921-08-17",] #two filters 
cat("Female data")
print(female)

#changing the name of a column
colnames(frame) <- c("ID")

display("Renamed Columns") #All but the first columns now do not have names
