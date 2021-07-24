require(gmp)

total <- 0
Z2 <- as.bigz(2)
for (m in 1:64) {
  for (n in 1:64) {
    aa <- Z2^m + 1
    bb <- Z2^n - 1
    cc <- gcd(aa,bb)
    if (cc > 1) {
      c <- as.numeric(cc %% 1000000)
      print(sprintf("(%d,%d) = %d", m,n,c))
      total <- total +1
    }
  }
}
