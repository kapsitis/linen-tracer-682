aa <- list()
aa[['A']] <- 0
aa[['C']] <- 0.3
aa[['G']] <- 0.4
aa[['U']] <- 0.7
aa[['$']] <- 0.9

ww <- list()
ww[['A']] <- 0.3
ww[['C']] <- 0.1
ww[['G']] <- 0.3
ww[['U']] <- 0.2
ww[['$']] <- 0.1

left <- c(0.0)
len <- c(1.0)

i <- 1
theString <- c('G', 'A', 'C', 'G', 'U', '$')
#theString <- c('G', 'A', 'C', 'A')
for (ch in theString) {
  left2 <- left[i] + len[i]*aa[[ch]]
  len2 <- len[i]*ww[[ch]]
  left <- c(left,left2)
  len <- c(len,len2)
  i <- i+1
}

binDigits <- c(0,1,1,0, 1,1,1,0, 1,1,0,1, 1,0,0)
total_orig <- 0
for (uu in 1:15) {
  total_orig <- total_orig + binDigits[uu]/(2^uu)
}

######################################################


annijaDigits <- c(0,1,1,0,1,1,0,1,1,1,0,1,0,0,1,0,0,1,1,1)
endDigits    <- c(0,1,1,0,1,1,0,1,1,1,0,1,0,0,1,1,1,0,1,0)
theStart <- 0
theEnd <- 0
for (uu in (1:length(annijaDigits))) {
  print(sprintf("uu=%d",uu))
  theStart <- theStart + as.numeric(annijaDigits[uu])/(2^uu)
  theEnd <- theEnd + as.numeric(endDigits[uu])/(2^uu)
}

myChars <- c('G','A','C','A','U','A')
cStart <- theStart
cEnd <- theEnd
for (ch in myChars) {
  cStart <- (cStart - aa[[ch]])/ww[[ch]]
  cEnd <- (cEnd - aa[[ch]])/ww[[ch]]
}
print(sprintf("cStart,cEnd = %1.7f,%1.7f",cStart,cEnd))


#'GACA'

#0.000 0.400 0.400 0.427 0.427
#1.0000 0.7000 0.4900 0.4360 0.4297

#S0 = [0.0000; 1.0000) - before anything is encoded
#S1 = [0.4000; 0.7000) - after encoding 'G'
#S2 = [0.4000; 0.4900) - after encoding 'GA'
#S3 = [0.4270; 0.4360) - after encoding 'GAC'
#S4 = [0.4270; 0.4297) - after encoding 'GACA'

#0.01101101010011111101111100111011011001000101101000011100101011...
#0.01101101110100100111 ; 
#0.0110110111010011101) ;
#0.01101110000000001101000110110111000101110101100011100010000110...

