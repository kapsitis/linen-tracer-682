x <- (7*(2:14))
# Atrod un summē visus skaitļa 7 daudzkārtņus, 
#   kas ir blakus skaitlim, kas dalās ar 6.
sum(x[which(x %% 6 == 1 | x %% 6 == 5)])