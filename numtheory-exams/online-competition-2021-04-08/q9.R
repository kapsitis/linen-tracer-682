xx <- c(1000,618)
for (i in 3:20) {
  xx <- c(xx, xx[i-2] - xx[i-1])
}

FIB <- c(1,1)
for (i in 3:32) {
  FIB <- c(FIB, FIB[i-1] + FIB[i-2])
}

for (j in 1:15) {
  print(sprintf("%d,%d,%d,[%1.6f;%1.6f]",FIB[2*j],FIB[2*j+1],FIB[2*j+2],FIB[2*j]/FIB[2*j+1],FIB[2*j+1]/FIB[2*j+2]))
}
