require(gmp)
Z2 <- as.bigz(3)
Z5 <- as.bigz(5)
abc <- numeric(0)
for (i in 10:10009) {
  s <- (Z2^i) %% 1000
  s <- s + (Z5^i) %% 1000
  s <- (s - i) %% 1000
  abc <- c(abc,as.numeric(s))
  if (s == 0) {
    print(sprintf("%d", i))
  }
}
table(abc)

