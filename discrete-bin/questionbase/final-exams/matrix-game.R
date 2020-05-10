strat <- list()
strat[['A']] <- c(1/3, 1/3, 1/3)
strat[['B']] <- c(0,1/2,1/2)
strat[['C']] <- c(1/2,1/2,0)
strat[['D']] <- c(1/4,1/2,1/4)
strat[['E']] <- c(2/6,3/6,1/6)
strat[['F']] <- c(0,1,0)

mm <- matrix(c(0,-1,2,1,0,-1,-2,1,0), nrow=3, byrow=TRUE)

for (i in c('A','B','C','D','E','F')) {
  for (j in c('A','B','C','D','E','F')) {
    strat1 <- strat[[i]]  
    strat2 <- strat[[j]]
    payoff <- 0
    for (k in 1:3) {
      for (l in 1:3) {
        payoff <- payoff + strat1[k]*strat2[l]*mm[k,l]
      }
    }
    print(sprintf("(%s,%s = %1.6f", i,j,payoff))
  }
}
