require(gmp)
a <- as.bigz(c(4,-7))
for (i in 3:15) {
  ai <- a[i-1]*a[i-2] - 1
  a <- c(a,ai)
}

