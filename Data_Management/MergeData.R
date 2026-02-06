orgs <- read.csv("Data_Management/data/organizations-1000.csv")
prod <- read.csv("Data_Management/data/products-1000.csv")

new <- merge(orgs, prod, by.x="Index", by.y="Index")
