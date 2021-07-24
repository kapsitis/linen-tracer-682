require(gmp)
lucas <- c(as.bigz(1),as.bigz(3))
fibonacci <- c(as.bigz(1),as.bigz(1))

for (i in 3:1000) {
  lucas <- c(lucas,lucas[i-1]+lucas[i-2])
  fibonacci <- c(fibonacci,fibonacci[i-1]+fibonacci[i-2])
}

stuff <- numeric(0)
for (i in 1:1000) {
  stuff <- c(stuff, as.numeric(lucas[i]^2 - 5*fibonacci[i]^2))
  
}

