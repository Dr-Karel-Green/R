#Law of large numbers
#Number should converge on 68.2% or 1sigma
qty <- 10
while(qty < 1000000){
  num <- 0
  for(i in rnorm(qty, mean=0, sd=1)){
    if((i>=-1)&&(i<=1))
      num <- (num+1)
  }
    num <- (num/(qty/100))
    cat("For", qty, "Generated Random Numbers:", num,"%\n")
    qty <- (qty*10)
}

#Number should converge on 95% or 2sigma
qty <- 10

while(qty < 1000000){
  num <- 0
  for(i in rnorm(qty, mean=0, sd=1)){
    if((i>=-2)&&(i<=2))
      num <- (num+1)
  }
  num <- (num/(qty/100))
  cat("For", qty, "Generated Random Numbers:", num,"%\n")
  qty <- (qty*10)
}

#Number should converge on 99% or 3sigma
qty <- 10

while(qty < 1000000){
  num <- 0
  for(i in rnorm(qty, mean=0, sd=1)){
    if((i>=-3)&&(i<=3))
      num <- (num+1)
  }
  num <- (num/(qty/100))
  cat("For", qty, "Generated Random Numbers:", num,"%\n")
  qty <- (qty*10)
}