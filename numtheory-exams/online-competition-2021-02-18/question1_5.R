require(gmp)

ff <- prod(1:10)
total <- 0

primes <- c(11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97)

defects <- rep(0,times=100)

for (i in 1:100) {
  total <- total + gcd(ff,i)
  for (p in primes) {
    if (i %% p == 0) {
      defects[p] <- defects[p] + (i/p - i)
    }
  }
}





