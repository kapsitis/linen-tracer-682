a <- 1
b <- 3
c <- 2
m <- 4

res1 <- (a*c - b*c) %% m
res2 <- (a - b) %% m 
print(sprintf("res.A = (%d,%d)", res1, res2))





a <- 2
b <- 4
c <- 5
d <- 7
m <- 3

res1 <- (a - c) %% m
res1A <- (a -b) %% m
res2 <- (c - d) %% (m-1)
res3 <- (a^c - b^d) %% m
print(sprintf("res.B = (%d[%d],%d,%d)", res1, res1A, res2,res3))