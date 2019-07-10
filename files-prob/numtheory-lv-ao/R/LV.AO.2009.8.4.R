xx <- c(2,10,14,50,70,98,350,490,2450)


for (i in c(0,1)) {
  for (j in c(0,1,2)) {
    for (k in c(0,1,2)) {
      d1 <- 2^i * 5^j * 7^k
      for (ii in (0:(1-i))) {
        for (jj in (0:(2-j))) {
          for (kk in (0:(2-k))) {
            d2 <- 2^ii * 5^jj * 7^kk 
            d3 <- 2450/d1/d2
            theSum <- d1+d2+d3
            if (theSum %in% c(72,64,108,2452)) {
            print(sprintf("(%d,%d,%d)-%d",d1,d2,d3,d1+d2+d3))
            }
          }
        }
      }
    }
  }
}