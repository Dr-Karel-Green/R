sex <- rep(c("Female", "Male"), each=500)

height <- c(rnorm(500, 65), rnorm(500, 69))

frame <- data.frame(sex, height)

qplot(height, data=frame, geom="histogram", fill=sex, bins=40, alpha=I(0.8),
      ylab="Frequency", xlab="Height in Inches", main="Average Height", 
      xlim = c(60, 72.5))+
  scale_fill_manual(values=c("Female"="pink", "Male"="lightblue"))
