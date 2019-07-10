x <- (1:8)^2

for (i in 0:255) {
  y <- rep(0,times=8)
  ii <- i
  for (j in 1:8) {
    if (ii %% 2 == 0) {
      y[j] <- -1
    } else {
      y[j] <- 1
    }
    ii <- ii %/% 2
  }
  
  if (sum(x*y) == 0) {
    print(y)
  }
}

