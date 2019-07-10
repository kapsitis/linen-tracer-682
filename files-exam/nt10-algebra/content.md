# &nbsp;

<h1 style="font-size:28pt">Skaitļu teorija: Testi</h1>

* <blue>Algebras prasmes sk.teorijā</blue>
* Dalāmības prasmes
* Modulārās aritmētikas prasmes



# Q.NT10.ALG.1

Aritmētiskā progresijā $a, a+d, a+2d, a+3d, \ldots$ 
saskaitīja pirmo $4$ locekļu kvadrātus.
Ieguva izteiksmi $4a^2 + ?? ad + 14d^2$. 
Atrast, kāds koeficients ir pie saskaitāmā $ad$ ("??" vietā). 

(*Ierakstīt skaitli.*)

**Atbilde:** `12`  
**Skaidrojums:** $(a+d)^2$ dod saskaitāmo $2ad$, $(a+2d)^2$ dod $4ad$ un 
$(a+3d)^2$ dod $6ad$. Saskaitot $2ad+4ad+6ad$ iegūstam $12ad$.

> [LV.AO.2016.10.3](#)



# Q.NT10.ALG.2

Aritmētiskā progresijā $a - 3x, a-x, a+x, a+3x$
saskaitīja visu locekļu kvadrātus. 
Ieguva izteiksmi $a^2 + ?? x^2$. 
Atrast koeficientu pie $x^2$ ("??" vietā). 

(*Ierakstīt skaitli.*) 

**Atbilde:** `20`  
**Skaidrojums:** $(a-3x)^2$ un $(a+3x)^2$ abi dod saskaitāmo
$9x^2$, $(a-x)^2$ un $(a+x)^2$ dod $x^2$.  
Saskaitām $9x^2 + x^2 + x^2 + 9x^2 = 20x^2$.


> [LV.AO.2016.10.3](#)




# Q.NT10.ALG.3

Kāds atvēra iekavas $(a-3b)^3$ un ieguva izteiksmi ar $4$ saskaitāmajiem: 
$$??a^3 + ??a^2b^1 + ??a^1b^2 + ??b^3.$$
Atrast koeficientu pie $a^1b^2$ (trešā "??" vietā). 

(*Ierakstīt skaitli.*)

**Atbilde:** `27`  
**Skaidrojums:** Formulā $(x-y)^3 = x^3 - 3x^2y + 3xy^2 - y^3$ 
ievietojam $x=a$, $y=3b$. Tad trešais saskaitāmais ir 
$$3xy^2 = 3a(3b)^2 = 27ab^2.$$

> [LV.NO.2010.10.2](#)





# Q.NT10.ALG.4

Kāds atvēra iekavas izteiksmē $(a+b)^4$ un ieguva izteiksmi ar $5$ saskaitāmajiem (koeficienti 
aizstāti ar "??"):
$$??a^4 + ??a^3b^1 + ??a^2b^2 + ??a^1b^3 + ??b^4.$$
Kādu skaitli iegūst, ja saskaita visus piecus koeficientus? 

(*Ierakstīt skaitli.*)

**Atbilde:** `16`  
**Skaidrojums:** Formulā $(a+b)^4=a^4 + 4a^3b + 6a^2b^2 + 4ab^3 + b^4$ ievietojam
$a = b = 1$. Tad $(1+1)^4 = 1+4+6+4+1=16$. Tādēļ ceturtā rindiņa Paskāla trijstūrī 
dod summā $2^4 = 16$.

> [LV.NO.2010.10.2](#)




# Q.NT10.ALG.5

Dota kvadrātfunkcija $f(x)=ax^2 + bx + c$, kur $a,b,c$ ir kaut kādi veseli skaitļi. 
Ja zināms, ka $f(4)=14$, kādas vērtības var pieņemt $f(7)$:

(*Atzīmēt visas iespējas.*) 

<small>

1. $21$
2. $22$
3. $23$
4. $24$

</small>

**Atbilde:** `C`  
**Skaidrojums:** Var pamatot, ka $f(7)-f(4)$ dalās ar $(7-4)$ (izmanto to, ka $x_1^2 - x_2^2$ 
dalās ar $x_1 - x_2$). Tādēļ $f(7)-f(4)$ dalās ar $3$ jeb $f(7)-14$ dalās ar $3$.  
Vienīgais skaitlis, kurš der ir $23$, jo $23 - 14 = 9$.

> [LV.VO.2011.10.4](#)





# Q.NT10.ALG.6

Ja $a,b$ ir veseli skaitļi, ar kuru izteiksmi noteikti dalās $a^3 - b^3$: 

<small>

1. Ar $ab$
2. Ar $a - b$
3. Ar $a + b$
4. Ar $a^2 - b^2$

</small>

**Atbilde:** `B`  
**Skaidrojums:** Pēc formulas $a^3 - b^3 = (a-b)(a^2 + ab + b^2)$. Tātad, 
ja dala $a^3-b^3$ ar $a-b$, tad iegūst $a^2 + ab + b^2$, kas ir vesels.

> [LV.VO.2011.10.4](#)




# Q.NT10.ALG.7

Dots, ka $P(x)$ ir polinoms, kura visi koeficienti ir veseli skaitļi. 
Ar kādu skaitli noteikti dalās $P(16)-P(9)$? 

<small>

1. Ar $3$
2. Ar $4$
3. Ar $7$
4. Ar $10$

</small>

**Atbilde:** `C`  
**Skaidrojums:** $P(16)-P(9)$ noteikti dalās ar $(16-9) = 7$.  
Tas tādēļ, ka jebkurai pakāpei $n$, $(x^n - y^n)$ dalās ar $(x-y)$. 

> [LV.VO.2011.10.4](#)




# Q.NT10.ALG.8

Zināms, ka $n$ ir naturāls skaitlis un $m = n^2 + 6n + 9$.

<small>

1. $m$ vienmēr ir kāda naturāla skaitļa kvadrāts.
2. $m$ var būt un var nebūt naturāla skaitļa kvadrāts atkarībā no $n$ vērtības.
3. $m$ nekad nav naturāla skaitļa kvadrāts.

</small>

**Atbilde:** `A`  
**Skaidrojums:** $n^2 + 6n + 9 = (n+3)^2$ (atdalām pilno kvadrātu - nekas nepaliek pāri). 
Tādēļ skaitlis $m$ vienmēr būs naturāla skaitļa kvadrāts: konkrēti, 
iegūstams, kāpinot kvadrātā $(n+3)$. 

> [LV.AO.2016.10.3](#)





# Q.NT10.ALG.9

Zināms, ka $n$ ir naturāls skaitlis un $m = n^2 + 10n + 20$.

<small>

1. $m$ vienmēr ir kāda naturāla skaitļa kvadrāts.
2. $m$ var būt un var nebūt naturāla skaitļa kvadrāts atkarībā no $n$ vērtības.
3. $m$ nekad nav naturāla skaitļa kvadrāts.

</small>

**Atbilde:** `C`  
**Skaidrojums:** Atdalām pilno kvadrātu: 
$$n^2 + 10n + 20 = (n+5)^2 - 25 + 20 = (n+5)^2 - 5.$$
Vienīgie pilnie kvadrāti, kuri atšķiras par $5$ ir $3^2 =9$ 
un $2^2=4$. Tādēļ var izvēlēties $n$ tā, lai $n+5=3$ jeb
$n=-2$. Tas gan nav naturāls skaitlis. Tāpēc $m$ nekad nesanāk pilns kvadrāts.

> [LV.AO.2016.10.3](#)





# Q.NT10.ALG.10

Zināms, ka naturāli skaitļi $x,y$ apmierina sakarību $x^5 = 10y^2$. 
Ar cik nullēm noteikti beidzas $y$, neatkarīgi no tā, kāds ir $x$? 

(*Ja ir pareizas vairākas iespējas, atzīmēt atbildi, kas atbilst lielākajam nuļļu skaitam.*)

<small>

1. $y$ beidzas vismaz ar $1$ nulli. 
2. $y$ beidzas vismaz ar $2$ nullēm. 
3. $y$ beidzas vismaz ar $3$ nullēm. 
4. $y$ beidzas vismaz ar $4$ nullēm.

</small>

**Atbilde:** `B`  
**Skaidrojums:** $x$ noteikti dalās ar $10$, tādēļ $x^5$ noteikti beidzas ar $5$ nullēm. 
Tātad $y=\sqrt{x^5/10}$ beidzas vismaz ar $2$ nullēm, jo $x^5/10$ dalās ar $10000=10^4$.

> [LV.NO.2010.10.4](#)





# Q.NT10.ALG.11

Zināms, ka $x^3 = 6y^2$. Ar kādu augstāko skaitļa $2$ pakāpi noteikti dalās $x^3$? 

(*Ja ir pareizas vairākas iespējas, atzīmēt atbildi, kas atbilst augstākajai pakāpei.*)

<small>

1. $x^3$ dalās ar $2=2^1$.
2. $x^3$ dalās ar $4=2^2$.
3. $x^3$ dalās ar $8=2^3$.
4. $x^3$ dalās ar $16=2^4$.

</small>

**Atbilde:** `C`  
**Skaidrojums:** $x$ noteikti ir pāru skaitlis $2k$, tādēļ $x^3=(2k)^3=8k^3$ dalās ar $8$.

> [LV.NO.2010.10.4](#)





# Q.NT10.ALG.12

Kura izteiksme ir identiska $\frac{1}{n^2-1} = \frac{1}{(n-1)(n+1)}$, ja to 
pārveido par divu daļu starpību:

<small>

1. $\frac{1}{n-1} - \frac{1}{n+1}$
2. $\frac{1}{2(n-1)} - \frac{1}{2(n+1)}$
3. $\frac{1}{n-1} - \frac{1}{n}$
4. $\frac{2}{n-1} - \frac{2}{n+1}$

</small>

**Atbilde:** `B`  
**Skaidrojums:** $\frac{1}{n-1}-\frac{1}{n+1}=\frac{(n+1)-(n-1)}{(n-1)(n+1)}=\frac{2}{n^2-1}$.
Pārveidojamā izteiksme ir divreiz mazāka, tādēļ pareizā atbilde ir tā, kur 
abu daļu saucējos ir papildu reizinātājs $2$.

> [LV.VO.2016.10.3](#)




# Q.NT10.ALG.13

Izteikt daļu $\frac{3}{7}$ kā summu: $\frac{2}{a}+\frac{1}{b}$, 
kur $a \neq 7$ un $b \neq 7$. 

(*Ierakstīt atbildi formā: `2/a+1/b`*)

**Atbilde:** `2/5+1/35`,`2/21+1/3`  
**Skaidrojums:** $\frac{3}{7}$ ir lielāka par $\frac{2}{5}$. 
Ja atņem $\frac{3}{7}-\frac{2}{5}$, tad sanāk $\frac{1}{35}$.  
$\frac{3}{7}$ ir lielāka arī par $\frac{1}{3}$, šo daļu starpība ir $\frac{2}{21}$. 

> [LV.VO.2016.10.3](#)



# Q.NT10.ALG.14

Kurš skaitlis lielāks:  
$A = \overline{9\ast\ast\ast\ast\ast\ast}$ vai $B = 9^7$.  
(Ar zvaigznītēm apzīmēti seši nezināmi cipari; tie var būt arī vienādi.)

<small>

1. Vienmēr $A > B$.
2. Vienmēr $A < B$. 
3. Atkarībā no nezināmajiem cipariem var būt $A < B$, $A=B$ vai $A>B$.

</small>

**Atbilde:** `A`  
**Skaidrojums:** Ja skaitlis sākas ar ciparu $9$, kam seko seši nezināmi 
cipari, tas ir vismaz $9$ miljoni: $A \geq 9\cdot{}10^6$. Savukārt
skaitlī $B = 9^7$ arī septiņi reizinātāji, bet vairāki no tiem ir mazāki: 
$9 < 10$. Tādēļ vienmēr $A > B$.

> [LV.AO.2015.10.3](#)





# Q.NT10.ALG.15

Izteiksmē $\frac{1}{a} + \frac{1}{b} + \frac{1}{a+b}$ pozitīvu skaitli $a$ atstāja nemainīgu, 
bet pozitīvu skaitli $b$ palielināja. Kā mainījās izteiksmes vērtība? 

<small>

1. Izteiksmes vērtība palielinājās.
2. Izteiksmes vērtība samazinājās. 
3. Izteiksmes vērtība var gan palielināties, gan samazināties atkarībā no $a$ un $b$.

</small>

**Atbilde:** `B`  
**Skaidrojums:** Palielinot $b$, samazinās abas daļas $\frac{1}{b}$ un $\frac{1}{a+b}$, 
tādēļ arī visa izteiksme samazinās.

> [LV.VO.2013.10.1](#)






# Q.NT10.ALG.16

Zināms, ka daļa $\frac{1}{6}$ izteikta kā divu naturālu skaitļu 
apgriezto lielumu summa: $\frac{1}{a} + \frac{1}{b}$, turklāt 
$a<b$ un $a \neq 7$ (t.i. summa nav $\frac{1}{7} + \frac{1}{42}$).  
Atrast kādu šādas summas piemēru.

(*Ierakstīt atbildi formā: `1/a+1/b`*)

**Atbilde:** `1/8+1/24`,`1/9+1/18`,`1/10+1/15`  
**Skaidrojums:** No $\frac{1}{6}$ var atņemt ne tikai $\frac{1}{7}$, bet
arī $\frac{1}{8}$, $\frac{1}{9}$, $\frac{1}{10}$, $\frac{1}{11}$ (bet 
$a=12$ neder, jo $a \neq b$).  
Trijos gadījumos starpība $\frac{1}{6}-\frac{1}{a}$ ir formā $\frac{1}{b}$.

> [LV.VO.2013.10.1](#)





# Q.NT10.ALG.17

Pastniekam Fibonači ir neierobežots skaits pastmarku $5$ un $8$ centu vērtībā.
Atrast lielāko skaitli $N$ ar šādām īpašībām:  
(a) $N$ dod atlikumu $2$, dalot ar $5$,  
(b) $N$ centu summu nav iespējams uzlīmēt uz aploksnes, izmantojot tikai $5$ un $8$ centu pastmarkas.

(*Ierakstīt skaitli.*)

**Atbilde:** `27`  
**Skaidrojums:** Šķirojam gadījumus atkarībā no $8$-centu pastmarku skaita. 
To skaits var būt $k=0,1,2,3,4$ (lielākas $k$ vērtības var reducēt uz agrākām - 
teiksim, $k=8$ var aizstāt ar $k=3$ - un piecas $8$-centu markas aizstāt ar astoņām 
$5$-centu pastmarkām). "Vissliktākais gadījums - ja vajag četras $8$-centu markas. 
Mazākā summa, ko VAR uzlīmēt ir $32$ (atlikums $2$, dalot ar $5$). Bet $27$ uzlīmēt nevar, 
jo tam arī vajadzētu vismaz četras $8$-centu pastmarkas.

> [LV.VO.2014.10.3](#)





# Q.NT10.ALG.18

**Atbilde:** Zināms, ka $a,b$ ir naturāli skaitļi un 
$3a + b$ dalās ar $8$. Kura cita izteiksme noteikti dalās ar $8$?

<small>

1. $a+b$
2. $a+3b$
3. $2a+2b$
4. $a-b$

</small>

**Atbilde:** `B`  
**Skaidrojums:** Ja $3a+b = 8k$, tad apzīmē $a+3b=m$ jeb $3a+9b=3m$. 
Atņemam $(3a+9b)-(3a+b)=3m-8k$ jeb $8b = 3m-8k$. Iegūstam, ka
$3m$ dalās ar $8$ jeb $m$ dalās ar $8$.  
Citos variantos var viegli atrast pretpiemērus.

> [LV.VO.2016.10.1](#)





# Q.NT10.ALG.19

Zināmi divu naturālu skaitļu sadalījumi pirmreizinātājos:  
$A = 2^5\cdot{}3^2$ un $B = 2^1\cdot{}3^{10}$. Skaitļa $C=A^3B$ sadalījums 
pirmreizinātājos ir $2^x3^y$. Atrast kāpinātāju $x$.

(*Ierakstīt skaitli: pašu x vērtību, nevis divnieku uzkāpinātu šajā pakāpē.*)

**Atbilde:** `16`  
**Skaidrojums:** Pārveidojam $A^3B=(2^53^2)^3(2^13^{10})$. 
Pirmais reizinātājs dalās ar $2^{5\cdot3}=2^{15}$, otrais
dalās ar $2^1$. Viss kopā dalās ar $2^{16}$ jeb $x=16$.

> [LV.VO.2016.10.1](#)





# Q.NT10.ALG.20

Atrast skaitli, ar ko vienāda summa:  
$S = \frac{1}{10\cdot{}11} + \frac{1}{11\cdot{}12} + \ldots + \frac{1}{18\cdot{}19} + \frac{1}{19\cdot{}20}.$

<small>

1. $S = \frac{1}{10}$
2. $S = \frac{1}{11} - \frac{1}{19}$
3. $S = \frac{1}{20}$
4. $S = \frac{1}{10}+\frac{1}{20}$

</small>

**Atbilde:** `C`  
**Skaidrojums:** Saskaitām $\left(\frac{1}{10}-\frac{1}{11}\right)$ utt. līdz 
$\left(\frac{1}{19}-\frac{1}{20}\right)$. Pēc saīsināšanas
paliek $\left(\frac{1}{10}-\frac{1}{20}\right) = \frac{1}{20}$.

> [LV.VO.2016.10.3](#)


