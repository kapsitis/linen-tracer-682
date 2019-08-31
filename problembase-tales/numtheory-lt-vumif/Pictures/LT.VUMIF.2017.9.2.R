for (mm in 317:999) {
  nn <- mm^2
  ss <- sprintf("%d%d",mm,nn)
  digiList <- strsplit(ss, NULL)
  tt <- table(digiList)
  if (length(tt)==9) {
    print(sprintf("%d",mm))
  }
}

