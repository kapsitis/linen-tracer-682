xx <- list()
xx[['A']] <- c(1,2,5)
xx[['B']] <- c(1,5,7)
xx[['C']] <- c(3,4,8)
xx[['D']] <- c(2,4,7)
xx[['E']] <- c(2,4,6)
xx[['F']] <- c(1,5,8)
xx[['G']] <- c(3,6,7)
xx[['H']] <- c(3,6,8)
columns <- c("A", "B", "C", "D", "E", "F", "G", "H")
sizes2 <- numeric()
for (i in 1:7) {
  for (j in ((i+1):8)) {
    uu <- union(xx[[columns[i]]], xx[[columns[j]]])
    sizes2 <- c(sizes2, length(uu))
  }
}
sizes3 <- numeric()
for (i in 1:6) {
  for (j in ((i+1):7)) {
    for (k in ((j+1):8)) {
      uu <- union(xx[[columns[i]]], union( xx[[columns[j]]], xx[[columns[k]]]))
      sizes3 <- c(sizes3, length(uu))
    }
  }
}

sizes4 <- numeric()
for (i in 1:5) {
  for (j in ((i+1):6)) {
    for (k in ((j+1):7)) {
      for (l in ((k+1):8)) {
        uu <- union(xx[[columns[i]]], union( xx[[columns[j]]], union(xx[[columns[k]]], xx[[columns[l]]])))
        sizes4 <- c(sizes4, length(uu))
      }
    }
  }
}
table(sizes4)

