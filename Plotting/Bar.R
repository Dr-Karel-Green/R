nums <- sample(1:6, 3000, replace=TRUE)

qplot(nums, geom="bar", color=I("blue"), fill=I("lightblue"), xlab="Face",
      ylab="Frequency", main="3000 rolls of dice")+
  scale_x_continuous(breaks=1:6, labels = c("One", "Two",
                                            "Three", "Four", "Five", "Six"))

#Ensure "+" is on the same line as the end of the qplot for this to work