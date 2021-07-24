library(gmp)
xx <- rep(as.bigz(0), times=1000)
xx[1] <- as.bigz(1)
xx[2] <- as.bigz(1)

for (i in 3:1000) {
  xx[i] <- xx[i-2] + xx[i-1]
}


