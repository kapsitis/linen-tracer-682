NN <- 20

xx <- rep(0,times=((NN-3)^2 + (NN-2)^2 + (NN-1)^2 + NN^2))

for (h in 1:(NN-3))
for (i in h:(NN-2)) {
  for (j in (i+1):(NN-1)) {
    for (k in (j+1):NN) {
      ss <- h^2 + i^2 + j^2 + k^2
      xx[ss] <- xx[ss]+1
    }
  }
}

yy <- rep(0,times=4*NN-6)
# 159 165 171 177
mm <-4
vmm <- as.vector(which(xx == mm))[1]
for (hh in 1:(NN-3)) {
for (ii in hh:(NN-2)) {
  for (jj in (ii+1):(NN-1)) {
    for (kk in (jj+1):NN) {
      ss <- hh^2 + ii^2 + jj^2 + kk^2
      sum <- hh+ ii + jj + kk
      if (ss == vmm[1]) {
        yy[sum] <- yy[sum]+1
        if (sum == 18) {
          print(sprintf("%d,%d,%d,%d",hh,ii,jj,kk))
        }
      }
    }
  }
}
}

#[1] "1,5,6"
#[1] "2,3,7"
# 12 un 62

#[1] "1,6,8"
#[1] "2,4,9"
# 15 un 101

#[1] "4,8,9"
#[1] "5,6,10"
# 21 un 161

#[1] "1,4,6,7"
#[1] "2,3,5,8"
# 18 un 102