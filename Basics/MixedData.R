data <- list(dozen=12, pi=3.14159, user="Jane", flag=TRUE)
print(paste("Length of data", length(data)))
print(paste("Is data a list?", is.list(data)))

print(data[3]) #prints element key and value
print(data$user) #only prints element value

print(data[2])
print(data$pi)

print(names(data))#prints all the keys

print(unlist(data)) #prints all the keys and the values
