ff <- c(0,1)

for (i in 1:10000) {
  nxt <- (ff[i] + ff[i+1]) %% (12^4)
  ff <- c(ff,nxt)
}

