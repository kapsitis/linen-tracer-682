# &nbsp;

<h1 style="font-size:28pt">Skaitļu teorija: 10.kl. LV</h1>

* 10.kl. skaitļu teorija (no 2010.g.)
    - LV.NO - novadu olimpiāde (2.posms)
    - <blue>LV.VO - valsts olimpiāde (3.posms)</blue>
    - LV.AO - atklātā olimpiāde




# <lo-sample/> LV.VO.2011.10.4

Dots polinoms $f(x)$ ar veseliem koeficientiem. Vai iespējams, ka
$f(2011) = 100$, bet $f(11) = 1000$?

<small>

* [alg.poly.prop.valdiff](#)
* [alg.tra.factor.powdiff](#)

</small>

<!--
concepts=integer-polynomial
questionType=ProveDisprove.Exists
-->


# <lo-sample/> LV.VO.2012.10.3

Naturāla skaitļa $N$ decimālajā pierakstā izmantots tikai cipars $6$.
Pierādīt, ka skaitļa $N^2$ decimālajā pierakstā nav cipara $0$.

<small>

* [misc.try](#) 
* [seq.geom.summation](#)
* [seq.geom.decnotation](#)

</small>

<!--
concepts=full-square
questionType=Prove.ForAll
-->



## 66...66 kāpināšana kvadrātā

$$6^2=36,\;\;66^2=4356=4455-99,\;\;666^2=443556=444555-999,\ldots$$
Pamatosim, ka 
$$(\underbrace{6\ldots6}_n)^2=\overline{\underbrace{4\ldots{}4}_n\underbrace{5\ldots{}5}_n}-
\underbrace{9\ldots{}9}_n$$

$$\left( 6\cdot(10^n-1)/9 \right)^2 = 10^n \cdot (4 \cdot (10^n - 1)/9) +$$
$$+(5 \cdot (10^n - 1)/9) - (10^n-1).$$


## Pārveidojuma turpinājums

$$\frac{4}{9}(10^n-1)^2 = 10^n \cdot \frac{4}{9}(10^n - 1) +$$
$$+\frac{5}{9}(10^n-1) - (10^n - 1).$$

$$4(10^n - 1)^2 = 4\cdot{}10^{2n}-4\cdot{}10^n + 5\cdot{}10^n-5 - 9\cdot{}10^n +9.$$

Tātad $\overline{6\ldots6}^2$ pierakstā ir tikai cipari "4","3", "5" un "6":

$$(\underbrace{6\ldots6}_n)^2=\overline{\underbrace{4\ldots{}4}\_{n-1}3\underbrace{5\ldots{}5}\_{n-1}6}$$


# <lo-sample/> LV.VO.2013.10.1

Pierādīt, ka vienādojumam $\frac{1}{a} + \frac{1}{b} + \frac{1}{a^2+b^2}=\frac{1}{2}$ 
nav atrisinājuma naturālos skaitļos.

<small>

* [misc.symm](#)
* [alg.ineq.monotonicity](#)

</small>

<!--
genre=integer-equation
questionType=Prove.NotExists
-->



## Sākotnējie secinājumi par mainīgajiem

Pieņemam, ka $a \leq b$ (ja tā nav, tad $a$ un $b$ samainām vietām).

* Ja $a \geq 6$, tad $\frac{1}{a} + \frac{1}{b} + \frac{1}{a^2+b^2} < \frac{1}{2}$
* Ja $a \leq 2$, tad $\frac{1}{a} + \frac{1}{b} + \frac{1}{a^2+b^2} > \frac{1}{2}$
* Gadījums $a=3$:
    - Ja $b=6$, tad $\frac{1}{a} + \frac{1}{b} + \frac{1}{a^2+b^2} > \frac{1}{2}$
    - Pie $b=7$, tad $\frac{1}{a} + \frac{1}{b} + \frac{1}{a^2+b^2} < \frac{1}{2}$
* Gadījums $a=4$:
    - Ja $b=4$, tad $\frac{1}{a} + \frac{1}{b} + \frac{1}{a^2+b^2} > \frac{1}{2}$
    - Ja $b=5$, tad $\frac{1}{a} + \frac{1}{b} + \frac{1}{a^2+b^2} < \frac{1}{2}$

Citas $b$ vērtības var neaplūkot, jo dotajam $a$ ($a=3$ vai $a=4$) izteiksme 
$\frac{1}{a} + \frac{1}{b} + \frac{1}{a^2+b^2}$ arvien samazinās tad, ja $b$ pieaug.



# <lo-sample/> LV.VO.2013.10.4

Dota Fibonači skaitļu virkne
$x_1 = x_2 = 1$, $x_{i+2} = x_i + x_{i+1}$.  
Pierādīt, ka šajā virknē ir bezgalīgi daudz skaitļu, kas nav naturāla
skaitļa kvadrāti.

<small>

* [seq.recur.fibonacci](#)
* [mod.period](#)
* [mod.congr.pow](#)

</small>


<!--
concepts=fibonacci-sequence,full-square
questionType=Prove.Other
-->



## Fibonači virknes atlikumi, dalot ar 3

$$\underbrace{1,1,2,3,5,8,13,21},34,55,89,144,\ldots$$
$$\underbrace{1,1,2,0,2,2,1,0},1,1,2,0,\ldots$$

* Neviens pilns kvadrāts nevar dot atlikumu $2$, dalot ar $3$, jo $(3k+1)^2$ un 
$(3k+2)^2$ dod atlikumu $1$. 
* Fibonači virknē atlikums $2$, dalot ar $3$ parādīsies bezgalīgi bieži - 
$x_3$, $x_5$, $x_6$ (un arī $x_{2+8k}$, $x_{2+8k}$, $x_{2+8k}$ jebkuram $k$).
* Visi šie nebūs naturāla skaitļa kvadrāti. 

Protams, **faktiski** kvadrātu starp Fibonači virknes locekļiem ir vēl krietni mazāk
(no augšminētajiem tikai $1=1^2$ un $144=12^2$). Bet vajag pamatojumu, ka
no kādas vietas (varbūt ļoti "tālas") nevar sākties tikai kvadrāti. 



## Fibonači virknes atlikumu periodiskums

> **Apgalvojums:** (1) Dalot ar jebkuru fiksētu skaitli, Fibonači virknes locekļu atlikumi 
> veido periodu.  
> (2) Turklāt periodiskajai atlikumu virknei nav priekšperioda un 
> tajā bezgalīgi bieži parādās atlikums $0$.  
> **Pierādījums:** (1) Katru Fibonači virknes locekļa atlikumu nosaka divu iepriekšējo locekļu atlikumi. 
> Tiklīdz kā divu pēc kārtas sekojošu atlikumu pārītis sakrīt ar tādu, kas bijis agrāk, Fibonači virkne
> ieciklējas.  
> (2) Priekšperiodi nevar rasties, jo atlikumus var rēķināt arī pretējā secībā: no $x_{i+2}$ un $x_{i+1}$ atlikumiem 
> viennozīmīgi atrodot $x_i$ atlikumu. Tātad atlikumu virkne ir periodiska abos virzienos (nevis tikai 
> kļūst periodiska, sākot no kādas vietas). Tā kā $0$-tais Fibonači skaitlis $x_0 = 0$, tad arī atlikums
> $0$ parādīsies bezgalīgi bieži (vismaz vienreiz katrā periodā).


# <lo-sample/> LV.VO.2014.10.2

Atrast visas tādas vesela skaitļa $n$ vērtības, kurām gan 
$\frac{n^3+3}{n+3}$, gan $\frac{n^4+4}{n+4}$ ir veseli skaitļi.

<small>

* [alg.poly.division](#)
* [div.fta.divisors.num](#)

</small>


<!--
concepts=integer-polynomials
questionType=Find.All
-->



## Polinomu dalīšana ar atlikumu

> **Apgalvojums:**  
> Ja $A(x)$ un $B(x)$ ir polinomi, $A(x)$ pakāpe ir vismaz tikpat liela kā $B(x)$, 
> tad eksistē divi citi polinomi $Q(x), R(x)$, kam $A(x)=Q(x)B(x)+R(x).  
> $Q(x)$ sauc par *dalījumu*, bet $R(x)$ - par *atlikumu*.  
> $R(x)$ pakāpe ir mazāka nekā $B(x)$ pakāpe.

Var gadīties, ka atlikums $R(x)=0$, ja $A(x)$ izdalās ar $B(x)$ bez atlikuma. 
Var arī gadīties, ka $R(x)$ ir konstante – t.i. $0$-tās pakāpes polinoms.


## Pirmais dalīšanas piemērs

$$\frac{n^3+3}{n+3} = \frac{n^2(n+3) - 3n^2 + 3}{n+3}=$$
$$=n^2+\frac{-3n^2+3}{n+3}=n^2+\frac{-3n(n+3)+9n+3}{n+3}=$$
$$=n^2-3n+\frac{9n+3}{n+3}=n^2-3n+\frac{9(n+3)-27+3}{n+3}=$$
$$=n^2-3n+9+\frac{-24}{n+3}.$$

Vajag, lai $24$ dalās ar $n+3$.


## Otrais dalīšanas piemērs

$$\frac{n^4 + 4}{n+4} = n^3 - 4n^2 + 16n - 64 + \frac{256+4}{n+4}$$

Vajag, lai $260=2\cdot{}2\cdot{}5\cdot{}13$ dalās ar $n+4$ jeb 

$$n+4 \in \\{ \ldots, -26, -20, -13, -10, -5, -4, -2, -1 \\} \cup$$ 
$$\cup \\{1, 2, 4, 5, 10, 13, 20, 26, \ldots \\}$$



## Skaitļa visi veselie dalītāji

Kuriem veseliem $z$ dalījums $\frac{24}{x}$ (vai $\frac{260}{x}$) ir vesels?
Dalām pirmreizinātājos.

$$24 = 2^3\cdot{}3^1,\;\;260=2^2\cdot{}5\cdot{}13$$

Cik šādiem skaitļiem ir dalītāju?

> **Apgalvojums:** Ja skaitlis $N$ dalās ar $2$ dažādiem pirmskaitļiem
> ($N=p_1^{a_1}p_2^{a_2}$) tad visi veselie $N$ dalītāji ir formā:  
> $d = \pm p_1^{b_1}\cdot{}p_2^{b_2}$, kur $b_1 \leq a_1$ un $b_2 \leq a_2$.
> (Analoģiski arī lielākam pirmskaitļu skaitam.)

Piemēram, $N=24=2^3\cdot{}3^1$ dalītāji ir $d=2^{b_1}3^{b_2}$,
kur $b_1 \in \\{ 0,1,2,3 \\}$, $b_2 \in \\{ 0,1 \\}$.


## Divu kopu šķēlums

$$n+3 \in $$
$$\\{ -24, -12, -8, -6, -4, -3, -2, -1, 1, 2, 3, 4, 6, 8, 12, 24 \\}$$

**UN**

$$n+4 \in \\{ \ldots, -26, -20, -13, -10, -5, -4, -2, -1 \\} \cup$$ 
$$\cup \\{1, 2, 4, 5, 10, 13, 20, 26, \ldots \\}$$

No šejienes $(n+4) \in \\{ -5, -2, -1, 2, 4, 5, 13 \\}$ jeb
$n \in \\{ -9, -6, -5, -2, 0, 1, 9 \\}$.



# <lo-sample/> LV.VO.2014.10.3

Ir pieejams neierobežots daudzums $7$ un $13$ centu pastmarku, 
kuras izmanto pasta sūtījumu apmaksāšanai. Diemžēl dažas summas nav 
iespējams apmaksāt tikai ar šīm pastmarkām (piemēram, ja sūtījums 
maksā $6$, $8$ vai $25$ centus). Kāda ir lielākā summa, kuru nav 
iespējams apmaksāt izmantojot tikai šīs pastmarkas?

<small>

* [seq.arithm.mod.all](#)
* [alg.ineq.monotonicity](#)

</small>

<!--
genre=optimization
concepts=linear-expression
questionType=Find.Max
-->


## Summas, kuras var nomaksāt

Šķirojam atkarībā no tā, cik $13$ centu pastmarkas lietotas

* $0\cdot{}13 + 7a$ - dalot ar $7$, atlikums ir $0$
* $1\cdot{}13 + 7a$ - dalot ar $7$, atlikums ir $6$
* $2\cdot{}13 + 7a$ - dalot ar $7$, atlikums ir $5$
* $3\cdot{}13 + 7a$ - dalot ar $7$, atlikums ir $4$
* $4\cdot{}13 + 7a$ - dalot ar $7$, atlikums ir $3$
* $5\cdot{}13 + 7a$ - dalot ar $7$, atlikums ir $2$
* $6\cdot{}13 + 7a$ - dalot ar $7$, atlikums ir $1$

**Secinājums:** Lai nomaksātu $8, 15, 22, 29, 36, 43, 50, 57, 64, 71, 78, \ldots$ centus, vajag
vismaz sešas $13$ centu markas. Mazākā šāda summa ir $6\cdot{}13 = 78$.  
Tātad summu $71$, kas šajā virknē ir
tieši pirms $78$ (un arī dod atlikumu $1$, dalot ar $7$), nevarēs nomaksāt, jo, lietojot mazāk par sešām
$13$-centu markām, nevar iegūt atlikumu $1$, dalot ar $7$. 



# <lo-sample/> LV.VO.2015.10.2

Pierādīt, ka katram naturālam $n$ izteiksme
$$3n^5+5n^4-8n$$
dalās ar $10$.

<small>

* [div.prop.prod](#)
* [mod.fix.parity](#)
* [mod.congr.poly](#)

</small>

<!--
questionType=Prove.ForAll
-->

## Dalāmība ar 2 un 5

* Dalāmību ar $10$ pārbaudām, dalot ar $2$ un $5$
* $3n^5 + 5n^4 - 8n$ vienmēr ir pāru skaitlis (aplūko, ja $n$ ir pāru/nepāru)
* $3n^5 + 5n^4 - 8n$, dalot ar $5$ dod to pašu atlikumu, ko $3n^5 - 3n$
    - Ja $n$ dalās ar $5$, tad $3n(n^4-1)$ dalās ar $n$ (tātad arī ar $5$).
    - Visiem citiem $n$ atlikumiem, dalot ar $5$ (atlikumi $1,2,3,4$) iegūstam: $n^4 - 1$ dalās ar $5$

Jāievieto skaitļi $n=1,2,3,4$ izteiksmē $n^4-1$: vienmēr dalīsies ar $5$.  
Lielākiem skaitļiem ($n=6,7,8,9$) šie atlikumi sāks atkārtoties.


# <lo-sample/> LV.VO.2016.10.1

Zināms, ka $x$ un $y$ ir tādi naturāli skaitļi, ka 
$xy^{433}$ ir naturāla skaitļa 2016. pakāpe. 
Pierādīt, ka arī $x^{433}y$ ir naturāla skaitļa 2016. pakāpe.

<small>

* [div.fta.pow](#)
* [alg.linear.equations](#)

</small>

<!--
concepts=full-powers
questionType=Prove.ForAll
-->

## Pilnas pakāpes

> **Apgalvojums:** Skaitlis $N$ ir kāda naturāla skaitļa 2016. pakāpe tad un 
> tikai tad, ja, sadalot pirmreizinātājos $N=p_1^{a_1}\cdot{}p_2^{a^2}\cdot\ldots\cdot{}p_k^{a_k}$, 
> visi kāpinātāji $a_i$ dalās ar $2016$. 
> (T.i. vai nu pirmskaitlis $p_i$ vispār nepiedalās $N$ sadalījumā, vai arī piedalās
> uzreiz ar kāpinātāju $a_i = 2016m$.)

**Dalīšana pirmreizinātājos:** Aplūkojam viena konkrēta pirmskaitļa $p$
pakāpi, ar kādu tas ietilpst $x$ un $y$ sadalījumā pirmreizinātājos. 
Pieņemsim, ka šie kāpinātāji ir attiecīgi $a$ un $b$: 

$$x=p^a\cdot\ldots,\;\;y=p^b\cdot\ldots$$

**TAD**

$$xy^{433} = p^{a+433b}\ldots,\;\;x^{433}y = p^{433a+b}.$$


## Pārejam uz vienkāršākiem vienādojumiem

**Apgalvojums:** Ja $a+433b$ dalās ar $2016$, tad arī $433a+b$ dalās ar $2016$. 

**Pierādījums:** Apzīmējam $a+433b=2016k$. Reizinām ar $433$:  
$433a+433^2b=2016\cdot{}433k$. 

Pamatosim, ka starpība starp šo un $433a+b$ arī dalās ar $2016$:
$$(433a+433^2b) - (433a+b)=(433^2-1)b = 187488b.$$
Viegli redzēt, ka $187488=2016\cdot{}93$ dalās ar $2016$.



# <lo-sample/> LV.VO.2016.10.3

Pierādīt, ka katram naturālam skaitlim $n$ ($n>1$) var atrast
tādus naturālus skaitļus $x$ un $y$ ($x \leq y$), ka 
$$\frac{1}{n}=\frac{1}{x(x+1)}+\frac{1}{(x+1)(x+2)}+\cdots{}+\frac{1}{y(y+1)}.$$

<small>

* [alg.tra.frac](#)
* [alg.series.sum](#)

</small>

<!--
concepts=long-sums
questionType=Prove.Other
-->

## Algebrisks triks: Pārveidojums par starpību

> **Apgalvojums:** Ir spēkā identitāte $\frac{1}{n(n+1)} = \frac{1}{n}-\frac{1}{n+1}$.

Piemēri:  
$$\frac{1}{6}=\frac{1}{2\cdot{}3} = \frac{1}{2}-\frac{1}{3},$$
$$\frac{1}{12}=\frac{1}{3\cdot{}4} = \frac{1}{3}-\frac{1}{4},$$
$$\frac{1}{20}=\frac{1}{4\cdot{}5} = \frac{1}{4}-\frac{1}{5}.\;\cdots$$

Katru daļu, kuras saucējā ir divu sekojošu skaitļu reizinājums, 
var izteikt kā starpību.


## Lietojam identitāti, lai pārveidotu

$$\frac{1}{n}=\frac{1}{x(x+1)}+\frac{1}{(x+1)(x+2)}+\cdots{}+\frac{1}{y(y+1)}.$$
$$\frac{1}{n}=\left( \frac{1}{x} - \frac{1}{x+1} \right) + \left( \frac{1}{x+1} - \frac{1}{x+2} \right) +$$
$$+\cdots+\left( \frac{1}{y} - \frac{1}{y+1} \right) = \frac{1}{x} - \frac{1}{y+1}$$

Vai jebkuru daļu $\frac{1}{n}$ var izteikt kā $\frac{1}{x} - \frac{1}{y+1}$?  
Izmantojam vienādības no iepriekšējā slaida. Piemēram, ja $n=5$:   

$$\frac{1}{5} = \frac{1}{4} - \frac{1}{20}.$$



# <lo-sample/> LV.VO.2017.10.2

Dots pirmskaitlis, kas satur vismaz 4 dažādus ciparus. 
Pierādīt, ka tā ciparus var pārkārtot citā secībā tā, lai jauniegūtais skaitlis nebūtu pirmskaitlis!

<small>

* [nota.divrule.2_5_10.divides](#)
* [nota.combine.split](#)
* [mod.congr.sumdiff](#)
* [comb.full](#)

</small>

<!--
strategy=strengthen-the-hypothesis
concepts=primes
genre=digit-manipulation
questionType=Prove.ForAll
-->


## Sākotnēji apsvērumi

* Interesantais gadījums - ja četri cipari ir $1,3,7,9$ (varbūt atkārtoti).
* Ja nav atkārtoti: $1379$ dalās ar $7$.
* Kas notiek, ja $1,3,7,9$ atkārtojas. 
* Dalāmībai ar $2,3,5$ ciparu pārkārtošana nepalīdz. Izvēlamies $7$.

**Stiprāks apgalvojums:** Ne tikai parādīsim, ka var pārkārtot tā, lai skaitlis 
nebūtu pirmskaitlis, bet arī tā, lai dalītos ar $7$.


## Stiprākā apgalvojuma pamatojums

**Apgalvojums:** Skaitļa pierakstā izmantoti četri cipari ir $1,3,7,9$ (varbūt atkārtoti).
Pamatot, ka tos var pārkārtot tā, lai dalītos ar $7$. 

**Pierādījuma ideja:** Samaisām ciparus tā, lai $1,3,7,9$ (katrs pa vienam) nonāktu skaitļa
decimālpieraksta pēdējās $4$ pozīcijās. 

$$\underbrace{1133377999}\underbrace{1379}$$

Šos pēdējos $4$ ciparus maisām tā, lai iegūtu vajadzīgo atlikumu. 



# <lo-sample/> LV.VO.2018.10.3

Skaitļus $a,b,c$ sauksim par skaistu trijnieku, ja tiem piemīt šādas īpašības: 

* tie ir trīs pēc kārtas esoši naturāli skaitļi;
* katrs no tiem dalās ar savu ciparu summu. 

Piemēram, skaists trijnieks ir $8$, $9$, $10$. 

1. Atrast tādu skaistu trijnieku, kurā mazākais skaitlis ir lielāks nekā $10$.
2. Pierādīt, ka eksistē bezgalīgi daudz skaistu trijnieku!

<small>

* [nota.divrule.2_5_10.divides](#)
* [nota.divrule.3_9.divides](#)
* [nota.combine.padding](#)

</small>

<!--
concepts=sum-of-digits
questionType=Prove.Exists,Prove.Other
-->


## Vienkāršāks uzdevums: 

Apskatām vienkāršāku uzdevumu – "labu skaitļu" ķēdītes garumā $2$.  
Var aplūkot tādus skaitļus, kuru vidū var iespraust neierobežotu skaitu nuļļu.

* Pārītī $(20,21)$ pirmais skaitlis dalās ar $2$, bet otrais ar $3$.
* Tas pats pārītim $(200, 201)$, $(2000, 2001)$, utt.

## Ķēdītes garumā 3

* Skaitļi $110,111,112$ dalās ar attiecīgi ar $2,3,4$.

$$1\underbrace{0\ldots0}_n10,\;\;1\underbrace{0\ldots0}_n11,\;\;1\underbrace{0\ldots0}_n12$$





# <lo-sample/> LV.VO.2019.10.1

Pierādīt, ka visus naturālos skaitļus, kas lielāki nekā $100$, 
var izteikt kā pirmskaitļa un salikta skaitļa summu!

<small>

* [misc.try](#) 
* [mod.fix.parity](#)

</small>

<!--
concepts=primes
questionType=Prove.ForAll
-->


## Empīriskā matemātika...

$$101 \;=\; 2+99 \;=\; 3+98 \;=\; 4+97 \;=\;$$
$$\;=\; 5+96 \;=\; 7+94 \;=\; \cdots$$

Skaitļu, kas lielāki par $100$ ($101,102,103,\ldots$) ir bezgalīgi daudz; 
arī izteikt var ļoti daudzos veidos. 


## Kārtību ievieš, šķirojot gadījumus:

* Ja $n$ ir pāru, tad $n-2$ noteikti nav pirmskaitlis. 
* Ja $n$ ir nepāru, tad $n-3$ noteikti nav pirmskaitlis.





# <lo-sample/> LV.VO.2019.10.3

Pierādīt, ka nevienai naturālai $n$ vērtībai izteiksmes
$$13^n + 7^n + 2019$$
vērtība nav naturāla skaitļa kvadrāts!

<small>

* [mod.exp](#)
* [nota.divrule.composite](#)

</small>


<!--
genre=integer-equation
concept=full-square
questionType=Prove.NotExists
-->





