
# Dota ziņojumu kopa $S = \{ A,B,C,D \}$ ar attiecīgajām varbūtībām 
# $\{ 0.2, 0.5, 0.2, 0.1 \}$.
# (a) Parādīt, kā iegūt aritmētisko kodu $6$ ziņojumu virknei 
# CBAABD - uzkonstruēt
# tai atbilstošo intervālu [l6;l6+s6) un atrast 
# īsāko bitu virkni d1d2...dl (visi di ir 0 vai 1), 
# kur pierakstot binārā pieraksta daļskaitlim 
# D = 0.d1...dl galā jebkuru turpinājumu, 
# iegūtais skaitlis pieder intervālam $[l_6;l_6+s_6)$.
#
# (b) Noteikt, kādu ziņjumu virkni alfabētā $S$ kodē skaitlis 
# D'' = 0.0011101011_2. 

prob <- c(0.2,0.5,0.2,0.1)
cumProb <- c(0,cumsum(prob))


print("(a) ***********************")
# 1st char is A, 4th is D
message <- c(3,2,1,1,2,4)
ll <- c(0)
ss <- c(1)
for (x in message) {
  ll <- ll + cumProb[x]
  ss <- ss * prob[]
}



