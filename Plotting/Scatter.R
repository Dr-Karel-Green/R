x <- 1:10
y <- x^2

qplot(x,y, geom=c("point", "line"), color=I("green"))

frame <- read.csv("plotting/data/car_dataset.csv")

print(frame)

qplot(Fuel_Economy_MPG, Weight_kg, data = frame, geom=c("point", "line"))
qplot(Fuel_Economy_MPG, Weight_kg, data = frame, size=Fuel_Economy_MPG, color=I("green"))

eng_tpe <- factor(frame$Engine_Type)

qplot(Fuel_Economy_MPG, Weight_kg, data = frame, shape=eng_tpe, size=I(5),
      color=eng_tpe, xlab="Miles Per Gallon", ylab="Weight (Kg)", main="Car Comparison")

