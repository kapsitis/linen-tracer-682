for (a in 1:200) {
  for (b in 1:200) {
    am <- (a+b)/2
    gm <- sqrt(a*b)
    fam <- round(am)
    fgm <- round(gm)
    
    
    
    if (fam != fgm) {
      if (abs(am - fam) + abs(gm - fgm) < 1e-7 & fam > 9 & fgm > 9) {
        sfam <- paste0("",fam)
        sfgm <- paste0("",fgm)
        if (substr(sfam,1,1) == substr(sfgm,2,2) & substr(sfam,2,2) == substr(sfgm,1,1) ) {
          print(sprintf("(a,b)=(%d,%d)",a,b))
        }
      }
    }
  }
}