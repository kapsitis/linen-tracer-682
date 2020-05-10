codes <- list()
codes[["edgars-smirnovs-answers"]] <- "011"
codes[["antons-jaroslavcevs-answers"]] <- "081"
codes[["jekabs-solovjovs-answers"]] <- "167"
codes[["karlis-logins-answers"]] <- "370"
codes[["annija-vitolina-answers"]] <- "371"
codes[["boriss-verbickis-answers"]] <- "372"
codes[["jevgenija-slonska-answers"]] <- "373"
codes[["roze-melnudre-answers"]] <- "374"
codes[["niklavs-libers-answers"]] <- "375"
codes[["krisjanis-lejejs-answers"]] <- "376"
codes[["vladislavs-jerins-answers"]] <- "377"
codes[["martins-ciekurs-answers"]] <- "378"
codes[["roberts-rigacovs-answers"]] <- "380"
codes[["arturs-nikitenko-answers"]] <- "381"
codes[["bruno-kreslins-answers"]] <- "382"
codes[["elizabete-livdane-answers"]] <- "382"
codes[["reinis-berzins-answers"]] <- "384"
codes[["klinta-madara-greiliha-answers"]] <- "386"





#Edgars Smirnovs		011
#Rihards Emīls Stūrmanis		015
#Antons Jaroslavcevs		081
#Jēkabs Solovjovs		167
#Kārlis Logins		370
#Annija Vītoliņa		371
#Boriss Verbickis		372
#Jevgeņija Šļonska		373
#Roze Melnūdre		374
#Niklāvs Lībers		375
#Artis Krišjānis Lējējs		376
#Vladislavs Jerins		377
#Mārtiņš Ciekurs		378
#Rihards Žilionis		379
#Roberts Rigačovs		380
#Artūrs Ņikitenko		381
#Bruno Krēsliņš		382
#Elizabete Livdāne		382
#Reinis Bērziņš		384
#Roberta Zvejniece		385
#Klinta Madara Greiliha		386
#Matīss Rutks		387



A <- 4
B <- 5
C <- 6
bb1 <- c(1+A, 2+A+B, 3+A+B+C,  4+(2*A+B+C),  5 + 2*A +2*B + C, 6 + 2*A+2*B+2*C)
bb2 <- bb1 %% 16

bb4 <- rep(0,times=16)
for (i in 1:16) {
  if ((i-1) %in% bb2) {
    bb4[i] <- 1
  }
}

mm <- matrix(bb4, nrow =4, byrow = TRUE)

transClosure <- function(arg) {
  for (i in c)
}





