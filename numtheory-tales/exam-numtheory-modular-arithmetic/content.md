# &nbsp;

<h1 style="font-size:28pt">Skaitļu teorija: Testi</h1>

* Algebras prasmes sk.teorijā
* Dalāmības prasmes
* <blue>Modulārās aritmētikas prasmes</blue>



# Q.NT10.MOD.1

Vai eksistē skaitlis $x \in [1,100]$, kuram 
gan $x+23$, gan $x+121$ dalās ar $4$?

(*Atzīmēt jā vai nē. Ja 'jā', tad ierakstiet šāda skaitļa piemēru.*)

**Atbilde:** `(no,)`  
**Skaidrojums:** Starpība $(x+121)-(x+23) = 98$. Tikai viens no abiem skaitļiem 
var dalīties ar $4$. Piemēram, ja $(x+23)$ dalās ar $4$, tad $(x+121)$ dod 
atlikumu $2$, dalot ar $4$.
 
> [LV.NO.2015.10.4](#)



# Q.NT10.MOD.2

Vai izteiksmes $f(n) = 3n^5+5n^4$ vērtība ir pāru skaitlis? 

<small>

1. $f(n)$ ir pāru, ja $n$ ir pāru; $f(n)$ ir nepāru, ja $n$ ir nepāru. 
2. $f(n)$ ir pāru abos gadījumos. 
3. $f(n)$ ir nepāru abos gadījumos. 
4. $f(n)$ ir nepāru, ja $n$ ir pāru; $f(n)$ ir pāru, ja $n$ ir nepāru.

</small>

**Atbilde:** `B`  
**Skaidrojums:** Ja $n$ ir pāru skaitlis, tad $f(n)$ ir pāru (divu pāru skaitļu summa).  
Ja $n$ ir nepāru skaitlis, tad $f(n)$ ir nepāru (divu nepāru skaitļu summa).

> [LV.VO.2015.10.2](#)



# Q.NT10.MOD.3

Ar kādu lielāko $2$ pakāpi **katram** $n$ noteikti dalās izteiksme $f(n) = 8n^2 + 8n$? 

(*Ja der vairākas atbildes, atzīmēt to, kura atbilst augstākai $2$ pakāpei.*)

<small>

1. Ar $2^3 = 8$.
2. Ar $2^4 = 16$. 
3. Ar $2^5 = 32$. 
4. Ar $2^6 = 64$.

</small>

**Atbilde:** `B`  
**Skaidrojujms:** Pārveidojam $f(n)$ par reizinājumu: $f(n)=8n(n+1)$. 
Vismaz viens no abiem skaitļiem $n$ vai $n+1$ ir pāru skaitlis. Tādēļ $f(n)$ dalās
ne vien ar $8$, bet arī ar $16$ (jebkuram $n$). 

> [LV.VO.2015.10.2](#)





# Q.NT10.MOD.4

Zināms, ka $n, n+9, n+22$ ir naturālu skaitļu pakāpes, kas augstākas par pirmo 
(pilni kvadrāti, kubi, ceturtās pakāpes, u.c.). Ko var secināt par skaitļa $n$ paritāti? 

<small>

1. $n$ noteikti ir pāru skaitlis. 
2. $n$ noteikti ir nepāru skaitlis. 
3. $n$ var būt gan pāru, gan nepāru. 

</small>

**Atbilde:** `B`  
**Skaidrojums:** Ja $n$ būtu pāru skaitlis, tad $n$ un $n+22$ būtu pāru skaitļu pakāpes
(abi dalītos vismaz ar $4$). Tas nav iespējams, jo $22$ dod atlikumu $2$, dalot ar $4$.  
Tādēļ $n$ ir nepāru skaitlis. Var, teiksim, ņemt $(n,n+9,n+22)=(27,36,49)$.

> [LV.NO.2015.10.4](#)





# Q.NT10.MOD.5

Zināms, ka $n, n+11, n+33$ ir naturālu skaitļu pakāpes, kas augstākas par pirmo 
(pilni kvadrāti, kubi, ceturtās pakāpes, u.c.). Ko var secināt par skaitļa $n$ paritāti? 

<small>

1. $n$ noteikti ir pāru skaitlis. 
2. $n$ noteikti ir nepāru skaitlis. 
3. $n$ var būt gan pāru, gan nepāru. 

</small>

**Atbilde:** `A`  
**Skaidrojums:** Ja $n$ būtu nepāru, tad $n+11$ un $n+33$ abi būtu pāru skaitļu pakāpes - tātad
dalītos ar $4$. Tas nav iespējams, jo $(n+33)-(n+11)=22$ un $22$ dod atlikumu $2$, dalot ar $4$.  
Tādēļ $n$ ir pāru skaitlis. Var izvēlēties, piemēram, $(n,n+11,n+33)=(16,25,49)$. 

> [LV.NO.2015.10.4](#)





# Q.NT10.MOD.6

Zināms, ka $n$ ir naturāls trīsciparu skaitlis. Atrast, cik daudzi naturāli skaitļi 
intervālā $[n;n+5]$ noteikti ir salikti skaitļi, neatkarīgi no $n$. 

(*Ja der vairākas atbildes, atzīmēt to, kura atbilst lielākam skaitlim.*)

<small>

1. Vismaz $2$. 
2. Vismaz $3$. 
3. Vismaz $4$. 
4. Vismaz $5$. 

</small>

**Atbilde:** `4`  
**Skaidrojums:** Intervālā $[n;n+5]$ ir pavisam seši skaitļi. 
Vismaz $3+1$ nav pirmskaitļi (trīs pāru skaitļi un viens nepāru skaitlis, kas dalās ar $3$).  
Secinām, ka ir vismaz $4$ salikti skaitļi. Vairāk saliktu skaitļu var nebūt, jo intervālā $[100;105]$ 
ir divi pirmskaitļi ($101$ un $103$); ir arī vairāki citi *dvīņu pirmskaitļu* pāri. 

> [LV.VO.2019.10.1](#)




# Q.NT10.MOD.7

Atrast lielāko naturālo skaitli, kuru nav iespējams izteikt kā pirmskaitļa un divu 
saliktu skaitļu summu. 

(*Ierakstīt naturālu skaitli.*) 

**Atbilde:** `9`  
**Skaidrojums:** Mazākais saliktais skaitlis ir $4$ (skaitlis $1$ nav ne pirmskaitlis, ne salikts skaitlis). 
Tādēļ mazākā summa ir $2+4+4=10$. Var izteikt arī $11 = 3+4+4$ (un vēl lielākiem skaitļiem var
aizstāt kādu no četriniekiem ar lielāku pāru skaitli).  
Lielākais skaitlis, kuru nevar šādi izteikt ir $9$. 

> [LV.VO.2019.10.1](#)





# Q.NT10.MOD.8

Zināms, ka naturāli skaitļi $x,y$ ir vienādojuma $x^2 = y! + 1$ atrisinājumi.  
Ko var secināt par skaitli $x$?  
(Ar $y!$ apzīmē reizinājumu $1\cdot{}2\cdot{}3\cdot\ldots\cdot{}y$.)

<small>

1. $x$ noteikti ir pāru skaitlis.
2. $x$ noteikti ir nepāru skaitlis.
3. $x$ var būt gan pāru, gan nepāru skaitlis.

</small>

**Atbilde:** `B`  
**Skaidrojums:** Ja $y=1$, tad $1!+1=2$ nav pilns kvadrāts. Tātad $y>1$ un $y!$ ir pāru skaitlis. 
Savukārt $y!+1$ ir nepāru skaitlis un var būt vienīgi nepāru skaitļa kvadrāts.  
Der, piemēram, atrisinājumi $11^2=121=5!+2$ un $71^2=5041=7!+1$ (tie nav jāatrod, 
lai noskaidrotu pareizo atbildi).

> [LV.NO.2010.10.4](#)






# Q.NT10.MOD.9

Zināms, ka naturāli skaitļi $x,y$ ir vienādojuma $x^2 - 18^2 = y!$ atrisinājumi.  
Ko var secināt par skaitli $x$?  
(Ar $y!$ apzīmē reizinājumu $1\cdot{}2\cdot{}3\cdot\ldots\cdot{}y$.)

<small>

1. $x$ noteikti ir pāru skaitlis.
2. $x$ noteikti ir nepāru skaitlis.
3. $x$ var būt gan pāru, gan nepāru skaitlis.

</small>

**Atbilde:** `A`  
**Skaidrojums:** Atbilde $y=1$ neder, jo $1+18^2$ nav pilns kvadrāts. 
Tādēļ $y>1$ un $y! + 18^2$ ir pāru skaitlis. Tātad arī $x$ ir pāru skaitlis.  
Der, piemēram, atrisinājums $6318^2 - 18^2 = 11!$ (tas nav jāatrod, lai 
noskaidrotu pareizo atbildi).

> [LV.NO.2010.10.4](#)




# Q.NT10.MOD.10

Uz tāfeles uzrakstīja $6$ naturālus skaitļus un katriem diviem no tiem aprēķināja 
summu (dažas no tām var būt arī vienādas). 
Kāds lielākais skaits no šīm summām var būt nepāru skaitļi?

**Atbilde:** `9`  
**Skaidrojums:** Aplūkojam visas iespējas, cik no $6$ skaitļiem var būt pāru/nepāru. 
$6=0+6=1+5=2+4=3+3=4+2=5+1=6+0$. Visvairāk nepāru summu ir tad, ja ir $3$ pāru un $3$ nepāru 
skaitļi. Tad no visām $15$ summām tieši $3\cdot{}3 =9$ būs tādas, kas ir nepāru.

> [LV.AO.2014.10.4](#)





# Q.NT10.MOD.11

Uz tāfeles uzrakstīja $6$ naturālus skaitļus un katriem diviem no tiem aprēķināja 
summu (dažas no tām var būt arī vienādas). 
Kāds lielākais skaits no šīm summām var būt pāru skaitļi?

**Atbilde:** `15`  
**Skaidrojums:** Pietiek izvēlēties visus pāru (vai visus nepāru) skaitļus. Tad 
visas $15$ summas (tik veidos $2$ var izvēlēties no $6$) būs pāru skaitļi.

> [LV.AO.2014.10.4](#)




# Q.NT10.MOD.12

Zināms, ka $1000000$ (viens miljons), dalot ar $7$, dod atlikumu $1$. Atrast, kurš no skaitļiem 
dalās ar $7$: 

<small>

1. $5000002$
2. $2000001$
3. $4000009$
4. $9000011$

</small>

**Atbilde:** `A`  
**Skaidrojums:** Ievērojam, ka $5.000.000$ (pieci miljoni), dalot ar $7$ dod atlikumu $5$, 
$2.000.000$ - atlikumu $2$, utt.  
Pārbaudām summas: $5+2$, $2+1$, $4+9$, $9+11$. No tām tikai pirmā dalās ar $7$.

> [LV.VO.2017.10.2](#)





# Q.NT10.MOD.13

Kādām naturālām $p$ vērtībām izteiksme $f(n) = 2n^2+1$ nedalās ar $3$?

<small>

1. $f(p) = 2p^2+1$ dalās ar $3$ visiem $p$. 
2. $f(p) = 2p^2+1$ nedalās ar $3$ tad un tikai tad, ja $p$ nedalās ar $3$.
3. $f(p) = 2p^2+1$ nedalās ar $3$ tad un tikai tad, ja $p$ dalās ar $3$.
4. $f(p) = 2p^2+1$ nedalās ar $3$ tad un tikai tad, ja $p$ ir nepāru.

</small>

**Atbilde:** `C`  
**Skaidrojums:** Ievērojam, ka $n^2$ dod atlikumu $1$, dalot ar $3$ (ja pats $n$ nedalās ar $3$)
vai atlikumu $0$ (ja pats $n$ dalās ar $3$). Tādēļ $2n^2+1$ nedalās ar $3$ 
vienīgi tad, ja $n$ dalās ar $3$.

> [LV.AO.2012.10.1](#)





# Q.NT10.MOD.14

$1,4,9,16,25,\ldots$ ir naturālu skaitļu kvadrāti. Kādus atlikumus šie skaitļi 
dod, dalot ar $3$? 

(*Atzīmēt visas iespējas.*)

<small>

1. Atlikumu $0$.
2. Atlikumu $1$. 
3. Atlikumu $2$. 

</small>

**Atbilde:** `A,B`  
**Skaidrojums:** Pilns kvadrāts var dot atlikumu $0$, dalot ar $3$ (ja kāpina 
skaitli, kas pats dalās ar $3$), vai arī atlikumu $1$. Pat, kāpinot
skaitli, kas dod atlikumu $2$: $n=3k+2$.  
Iegūstam $(3k+2)^2=9k^2 + 12k + 4$ un $4$ dod atlikumu $1$.

> [LV.VO.2013.10.4](#)






# Q.NT10.MOD.15

Cik ir tādu ciparu, ar kuriem nevar beigties neviena naturāla skaitļa kvadrāta 
decimālpieraksts.

(*Ierakstīt skaitli - šādu ciparu skaitu.*)

**Atbilde:** `4`
**Skaidrojums:** Pilni kvadrāti nekad nebeidzas ar cipariem $2,3,7,8$. To pārbauda, 
kāpinot kvadrātā visus skaitļus no $1$ līdz $10$ (vēl lielākiem skaitļiem 
pēdējie cipari sāk atkārtoties).

> [LV.VO.2013.10.4](#)




# Q.NT10.MOD.16

Skaitļu $1,\ldots,9$ kubi ir sekojoši: $1,8,27,64,125,216,343,512,729$. 
Kādus atlikumus šie skaitļi dod, dalot ar $9$?  
(Varat izmantot faktu, ka skaitlis, dalot ar $9$, dod to pašu atlikumu, 
ko šī skaitļa ciparu summa.)

(*Ierakstīt visus iespējamos atlikumus, atdalot tos ar komatiem.*)

**Atbilde:** `0,1,8`  
**Skaidrojums:** Varam eksperimentāli pārbaudīt, dalot visus 9 kubus: atlikumi ir tikai $0,1,8$ 
(lielāku skaitļu kubi sāks atkārtot šos pašus atlikumus).  
Starp citu, pietiek pārbaudīt atlikumus, dalot ar $3$: kāpināt kubā 
$3k$, $3k+1$ un $3k-1$. Teiksim, $(3k-1)^3=27k^3 - 27k^2 + 9k - 1$, t.i. 
atlikums ir $8$.

> [LV.AO.2016.10.2](#)





# Q.NT10.MOD.17

Spriežot pēc atlikumiem, dalot ar $4$, kuram no vienādojumiem 
eksistē atrisinājums naturālos skaitļos $(x,y)$? 

<small>

1. $x^2 - 2018 = 120y$
2. $x^2 - 2019 = 120y$
3. $x^2 - 2020 = 120y$

</small>

**Atbilde:** `C`
**Skaidrojums:** Labā puse ($120y$) noteikti dalās ar $4$, tātad arī kreisā puse dalās. 
No otras puses, $x^2$ var dot tikai atlikumus $0$ vai $1$, dalot ar $4$. 
Skaitļi $2018$ un $2019$ dod attiecīgi atlikumus $2$ vai $3$ - tātad tie neder.  
Der, piemēram, $50^2 - 2020 = 480 = 120\cdot{}4$. 

> [LV.AO.2016.10.2](#)




# Q.NT10.MOD.18

Zināms, ka skaitlis $x = 3k+1$ dod atlikumu $1$, dalot ar $3$.   
Kādu atlikumu dod $x^3$, dalot ar $9$?

(*Ierakstīt atlikumu.*)

**Atbilde:** `1`
**Skaidrojums:** Atlikumus var reizināt - tātad $x^3=x\cdot{}x\cdot{}x$ dos tādu 
pašu atlikumu kā $1\cdot{}1\cdot{}1 = 1$.  
Garāks risinājums ir atverot iekavas: $(3k+1)^3=27k^3 + 27k^2 + 9k + 1$. 
Visi saskaitāmie dalās ar $9$ bez atlikuma, bet pēdējais dod atlikumu $1$.





# Q.NT10.MOD.19

Izteiksmi $13^n + 7^n$ dalīja ar skaitli $d$ un ieguva atlikumu. 
Atrast to $d$, kuram atlikums nav atkarīgs no skaitļa $n$ izvēles.

<small>

1. $d=4$
2. $d=5$
3. $d=6$
4. $d=7$

</small>

**Atbilde:** `C`  
**Skaidrojums:** Dalot ar $6$, gan $13^n$, gan arī $7^n$ dos tādu pašu atlikumu kā 
$1^n$ (jo $13$ un $7$, dalot ar $6$, dod atlikumu $1$).





# Q.NT10.MOD.20

Dots, ka $x$ un $y$ ir nepāru skaitļi, kas nedalās ar $5$.
Ar kādu ciparu var beigties $x^4-y^4 = (x^2-y^2)(x^2+y^2)$?  
(Var izmantot to, ka skaitļa pēdējais cipars nosaka, kāds
būs tā kvadrāta pēdējais cipars.)

(*Ierakstīt visus iespējamos ciparus, atdalot ar komatiem.*)

**Atbilde:** `0`
**Skaidrojums:** Visiem skaitļiem $1,3,7,9$ ceturtās pakāpes
($1,81,2401,6561$) beidzas ar to pašu ciparu $1$. Tādēļ to starpības būs $0$. 
Lielākiem skaitļiem pēdējie cipari atkārtosies - teiksim, $19^4$ beidzas ar to 
pašu ciparu, ar ko $9^4$.  
Var arī aplūkot kvadrātu ($1,9,49,81$) summas un starpības.


