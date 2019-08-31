# Define a sequence

xx <- 10 + 2^(0:10)

a <- function(nn) {
  result <- numeric(0)
  for (n in nn) {
    result <- c(result, xx[n+1])
    resString <- paste(result, collapse=",")
  }
  return(result)
}

for (i in 1:10) {
  dd <- sum(a(0:i))/i
  isCondition <- (a(i) < dd) & (dd <= a(i+1)) 
  print(sprintf("ss(%1.0f)=%f, %s", i, dd, isCondition))
}

