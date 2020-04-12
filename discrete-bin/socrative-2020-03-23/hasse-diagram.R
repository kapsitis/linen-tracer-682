count <- 0
primes <- c(2,3,5,7)
fromHasse <- 0
fromLoops <- 0
fromOther <- 0

for (i in 0:9) {
  for (j in 1:9) {
    if (i%%j ==0) {
      proportion <- i %/%j
      count <- count +1
      if (i ==0 && j %in% c(5,6,7,8,9)) {
        fromHasse <- fromHasse + 1
      } else if (proportion %in% primes) {
        fromHasse <- fromHasse + 1        
      } else if (proportion == 1) {
        fromLoops <- fromLoops  + 1
      } else {
        fromOther <- fromOther + 1
        print(sprintf("(%d,%d)",i,j))
      }
    }
  }
}

