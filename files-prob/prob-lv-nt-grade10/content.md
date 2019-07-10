# Skaitļu teorija: 10.kl. LV

* 10.kl. skaitļu teorija (no 2010.g.)
    - LV.NO - novadu olimpiāde (2.posms)
    - LV.VO - valsts olimpiāde (3.posms)
    - LV.AO - atklātā olimpiāde



# 35 uzdevumi: Aplūkojamās prasmes

![Uzdevumi pa gadiem](nt-problems-by-year.svg)

(*Sarkani ir agrāko gadu uzdevumi, kas atkārtoti vai variēti*)

* Prasme izlasīt uzdevumu
* **<span style="color:darkgreen">Prasme saredzēt skaitļu teorijas idejas</span>**
* Citas pierādījumu un matemātiskā radošuma prasmes
* Prasme pierakstīt atrisinājumu



# Skaitļu teorijas tēmas

* Formulu lapiņas, lekciju bildes, uzdevumu bildes
    - Kihon (<blue>基本</blue>,"bāzes tehnika") $\approx$ mazie faktiņi, pamatjēdzieni un apgalvojumi
    - Kata (<blue>形</blue>,"forma") $\approx$ lielākas teorēmas un algoritmi
    - Kumite (<blue>組手</blue>,"sacensību cīņa") $\approx$ olimpiāžu uzdevumi
* Pārklājas ar augstskolu (DatZ) skaitļu teoriju
    - Datu pārraide ar saspiešanu, kļūdu labošanu
    - Kriptogrāfija: HTTPS, cietā diska šifrēšana
    - Kriptovalūtas: *bitcoin* u.c.


# <lo-sample/> LV.NO.2010.10.2

Dots, ka $a$ un $b$ ir naturāli skaitļi, $a^2$
dalās ar $b$ un $b^2$ dalās ar $a$. 
Pierādīt, ka $(a-b)^3$
dalās ar $a\cdot{}b$. Vai noteikti
$(a-b)^2$ dalās ar $a\cdot{}b$?

<small>

* [alg.expand.binom.cubes](#)
* [div.properties.add](#)
* [div.properties.product](#)

</small>


## Algebrisks pārveidojums

$$(a-b)^3 = a^3 - 3a^2b + 3ab^2 - b^3$$

Katrs no $4$ saskaitāmajiem dalās ar $ab$:

* $\frac{a^3}{ab} = \frac{a^2}{b}$ (zināms, ka dalās)
* $\frac{3a^2b}{ab} = 3a$ un $\frac{3ab^2}{ab}=3b$ (abus var saīsināt)
* $\frac{b^3}{ab} = \frac{b^2}{a}$ (zināms, ka dalās)

## Pretpiemērs (der ļoti daudz kas)

* Ja $a=9$, $b=3$, tad $(a-b)^2 = 36$ nedalās ar $ab=27$.
* Ja $a=18$, $b=12$, tad $(a-b)^2 = 36$ nedalās ar $ab=216$.


# <lo-sample/> LV.NO.2010.10.4

Atrisināt naturālos skaitļos vienādojumu $x^3 = y! + 2$.

<small>

* [misc.experiment](#)
* [mod.parity.cases](#) 
* [alg.powers.prod](#)
* [div.idx.properties.product](#)
* [div.idx.properties.sumdiff](#)
* [mod.equation.contradict](#)

</small>



## Faktoriālu un pilno kubu tabulas

<table>
<tr><th>$x$</th><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr>
<tr><th>$x^3$</th><td>1</td><td>8</td><td>27</td><td>64</td><td>125</td><td>216</td><td>343</td><td>512</td><td>729</td><td>1000</td></tr>
</table>

<table>
<tr><th>$y$</th><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td>
    <td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr>
<tr><th>$y!$</th><td>1</td><td>2</td><td>6</td><td>24</td><td>120</td>
    <td>720</td><td>5040</td><td>40320</td><td>362880</td><td>3628800</td></tr>
<tr><th>$y!+2$</th><td>3</td><td>4</td><td>8</td><td>26</td><td>122</td>
    <td>722</td><td>5042</td><td>40322</td><td>362882</td><td>3628802</td></tr>
</table>

* Redzam, ka $2^3 = 3!+2$ (ja $x=2, y=3$). 
* Vai ir citas saknes, kur $y>3$? 
* Aplūkojam $x$ paritāti. Vienīgā iespēja: $x$ ir pāru skaitlis: $x=2k$.
    - Tad $(2k)^3 = y!+2$ jeb $8k^3 = y! + 2$.
    - Kreisā puse dalās ar $8$, bet labā (pie $y>3$) dod atlikumu $2$, dalot ar $8$.



# <lo-sample/> LV.NO.2012.10.3

Doti seši pēc kārtas sekojoši naturāli skaitļi. Pierādīt, ka var atrast tādu
pirmskaitli $p$, ka tieši viens no dotajiem skaitļiem dalās ar $p$.

<small>

* [seq.arithm.mod.gaps](#)
* [misc.contradiction](#)

</small>


# <lo-sample/> LV.NO.2012.10.4

Ir aprēķinātas skaitļu $2^{2012}$ un $5^{2012}$ vērtības 
un iegūtie skaitļi uzrakstīti viens aiz otra. 
Cik cipari uzrakstīti?

### LV.NO.2013.10.4

Ansītis aprēķināja skaitļu $2^{2013}$ un $5^{2013}$ vērtības 
un iegūtos skaitļus uzrakstīja
vienu aiz otra. Cik cipari uzrakstīti?

<small>

* [misc.experiment](#)
* [notation.dec.numdigits.prod](#)

</small>



# <lo-sample/> LV.NO.2014.10.2

Pierādīt, ka, izvēloties $52$ no aritmētiskās progresijas 
$1, 4, 7, 10, \ldots$ locekļiem, kas nepārsniedz
$300$, vienmēr starp šiem skaitļiem var atrast divus skaitļus, kuru summa ir $302$.

<small>

* [seq.arithm.expr](#)
* [seq.arithm.numestimate](#)
* [seq.arithm.pairsum](#)
* [misc.pigeonhole](#)

</small>



## Progresijā ir 100 locekļu zem 300

$$1, 4, 7, \ldots, 148, 151, 154, \ldots, 298$$

* Diviem locekļiem - $1$, $151$ - nav pāra, ar ko summa ir $302$.
* Vēl ir 49 pārīši - $(4,298)$, $(7,295)$, $\ldots$, $(148,154)$.
* Izvēloties $52$ skaitļus, vismaz $50$ no tiem būs $\neq 1$, $\neq 151$. 
* Dirihlē princips - divi būs no viena pārīša.


# <lo-sample/> LV.NO.2015.10.2

Ar naturālu skaitli atļauts veikt šādas darbības:

* pieskaitīt $6$;
* dalīt ar $4$, ja skaitlis dalās ar $4$;
* mainīt vietām skaitļa ciparus (skaitļa sākumā nedrīkst atrasties nulle).

Vai, atkārtoti izpildot šīs darbības, no skaitļa $30$ var iegūt skaitli $2015$?

<small>

* [notation.divrules.3or9.divides](#)
* [misc.invariant](#)

</small>



## Invariants ir dalāmība ar $3$

Ja sākotnējais skaitlis $x$ dalījās ar $3$, tad pēc katras darbības arī rezultāts dalīsies ar $3$:

* $x+6$ dalās ar $3$, ja $x$ dalās ar $3$
* $x/4$ dalās ar $3$, ja $x$ dalās ar $3$ (un arī ar $4$, lai varētu izdalīt).
* $x'$ (pārkārtotiem cipariem) arī dalās ar $3$, jo ciparu summa nemainās.

$30$ dalās ar $3$, bet $2015$ nedalās. Tātad pārveidot par $2015$ nevar. 



# <lo-sample/> LV.NO.2015.10.3

Vairāku pēc kārtas sekojošu naturālu skaitļu summa ir $177$. 
Kādas vērtības var pieņemt
mazākais no šiem saskaitāmajiem?

<small>

* [seq.arithm.summation](#)
* [div.pfactor.algorithm](#)
* [misc.exhaustive](#)

</small>


## Aritmētiskas progresijas locekļu summa

$$S=a_1 + a_2 + \ldots + a_n = \frac{a_1 + a_n}{2}\cdot{}n$$

> Aritmētiskās progresijas summu iegūst, reizinot "vidējo elementu": 
> $a_v = \frac{a_1+a_n}{2}$ ar progresijas locekļu skaitu: $S = a_v\cdot{}n$.  
> Ja $n$ ir nepāru skaitlis, tad vidējais elements $a_v$ tiešām progresijā ir.  
> Ja $n$ ir nepāru skaitlis, tad "vidējais elements" ir abu vidējo locekļu 
> aritmētiskais vidējais. 

Abos gadījumos $2\cdot{}177 = (a_1+a_n)\cdot{}n$ jeb
$$2 \cdot 3 \cdot 59 = (a_1+a_n)\cdot{}n$$


## Gadījumu pārlase

Skaitlim $2 \cdot 3 \cdot 59$ ir tikai galīgs skaits dalītāju $n$:

* Ja $n=2$, tad $177 = 88\frac{1}{2}\cdot{}2 = 88+89$,
* Ja $n=3$, tad $177 = 59\cdot{}3 = 58+59+60$,
* Ja $n=6$, tad $177 = 29\frac{1}{2}\cdot{}6=$
$=27+28+29+30+31+32$. 

Vēl lielāki $2 \cdot 3 \cdot 59$ dalītāji ($n=59$ u.c.) novestu pie ļoti garām aritmētiskām 
progresijām, kurās būtu arī negatīvi locekļi.
Tās neder, jo $177$ bija vairāku pēc kārtas sekojošu **naturālu** skaitļu summa.


# <lo-sample/> LV.NO.2015.10.4

Vai eksistē tāds vesels skaitlis $x$, ka visi skaitļi

1. $x$, $x+23$, $x+45$, $x+121$
2. $x$, $x+23$, $x+46$, $x+121$

ir veselu skaitļu pakāpes ar naturālu kāpinātāju, 
kas lielāks nekā 1 (kāpinātāji var būt dažādi)?

<small>

* [misc.experiment](#)
* [div.primes.powers.higher](#)
* [mod.parity.cases](#)
* [misc.contradiction](#)

</small>


## Ievieto nelielas vērtības

* $x$ arī ir vesela skaitļa pakāpe
* Pārbaudām $x=1,4,8,9,16,25,32,36,49,\ldots$
* Jau $x=4$ der (pirmajā piemērā)

## Kas notiek otrajā piemērā?

* Vai $x$ un $x+46$ var *vienlaikus* būt naturālu skaitļu pakāpes?
* Ja $x$ ir pāru, tad **gan** $x$, **gan** $x+46$ dalās ar $4$.
* Ja $x$ ir nepāru, tad **gan** $x+23$, **gan** $x+121$ dalās ar $4$.



# <lo-sample/> LV.NO.2016.10.1

Pierādīt, ka katram naturālam $n$ ir patiesa vienādība
$$1\cdot{}4 + 2\cdot{}7 + 3\cdot{}10 + \cdots + n\cdot{}(3n + 1) = n(n+1)^2.$$

<small>

* [seq.summation.difference](#)
* [misc.induction](#)

</small>


## Definējam virkni 

$$a_n = 1\cdot{}4 + 2\cdot{}7 + 3\cdot{}10 + \cdots + n\cdot{}(3n + 1)$$

* Katrs nākamais šīs virknes loceklis ir par $n\cdot{}(3n+1)$ lielāks kā iepriekšējais

Tikpat liela ir starpība starp $n(n+1)^2$ un izteiksmi, kur $n$ aizstāj ar $n-1$: $(n-1)n^2$:

$$n(n+1)^2 - (n-1)n^2 = n(n^2 + 2n + 1) - n^3 + n^2 =$$
$$= n^3+2n^2+n - n^3+n^2 = 3n^2 + n = n(3n+1).$$

## Matemātiskā indukcija

* Ja $n=1$, tad $a_1 = 1\cdot{}4 = 4$ un arī $n(n+1)^2 = 4$. 
* Arī vēlāk gan virkne $a_n$, gan formula $n(n+1)^2$ pieaug vienādiem soļiem. 


# <lo-sample/> LV.NO.2016.10.2

Pierādīt, ka no jebkuriem trim naturālu skaitļu kvadrātiem var izvēlēties divus tā, 
ka to summa vai starpība dalās ar $5$.

<small>

* [mod.expr.square](#)
* [mod.cases.squares](#)
* [misc.pigeonhole](#)

</small>


## Pilnu kvadrātu atlikumi, dalot ar 5

$$(1^2,2^2,3^2,4^2,5^2)=(1,4,9,16,25).$$

* Atlikumi, dalot ar $5$, ir sekojoši: $(1,4,4,1,0)$. Pēc tam tie atkārtojas.
* Starp tiem ir tikai $3$ dažādi atlikumi: $0,1,4$. 
* Izvēloties trīs kvadrātus:
    - Vai nu divi no tiem sakritīs,
    - No katra būs pa vienam - tad $1+4$ dalās ar $5$.




# <lo-sample/> LV.NO.2017.10.5

Desmitciparu skaitlī vienādus ciparus aizvietojot ar vienādiem burtiem, 
bet dažādus – ar dažādiem, ieguva
vārdu $MATEMĀTIKA$ (īsais "A" un garais "Ā" aizstāj atšķirīgus ciparus). 
Papildus zināms, ka skaitlis $\overline{MA}$
dalās ar $2$, $\overline{MAT}$ - ar 3, $\overline{MATE}$ - ar 4, 
$\overline{MATEM}$ - ar 5, $\overline{MATEMĀ}$ - ar 6, $\overline{MATEMĀT}$ - ar 7,
$\overline{MATEMĀTI}$ - ar 8, $\overline{MATEMĀTIK}$ - ar 9, 
$\overline{MATEMĀTIKA}$ - ar 10. Noteikt, kāds bija sākotnējais
desmitciparu skaitlis!

<small>

* [notation.divrules.2or5or10.divides](#)
* [notation.divrules.pow2or5.divides](#)
* [notation.divrules.3or9.divides](#)
* [notation.divrules.composite](#)
* [misc.exhaustive](#)

</small>


## Gadījumu pārlase

* $\overline{MATEMĀTIKA}$ dalās ar $10$ ($A=0$)
* $\overline{MATEM}$ dalās ar $5$ ($M=5$)
* $\overline{MAT}=\overline{50T}$ dalās ar $3$ ($T = 1,4,7$)
* Dalāmība ar $2,4,6,8$ ($E$, $Ā$, $I$ ir pāru cipari $\neq 0$)
* Dalāmība ar $4$ ($TI$ un $TE$ dalās ar $4$, t.i $T \neq 4$)
* Dalāmība ar $6$ ($\overline{MATEMĀ}$ ciparu summa ir $5+0+(1|7)+(2|6)+5+(4|8)$
t.i. $\overline{EMĀ}=258$ vai $\overline{EMĀ}=654$.
* Dalāmība ar $7$: $50(1|7)(2|6)5(4|8)(1|7)$
($\overline{MATEMĀT}$ ir $5012581$ vai $5076547$)
* Dalāmība ar $8$: $50125816$, $50765472$
* $5076547290$ der (bet $5012581680$ neder, jo cipari $K$ un $Ā$ nedrīkst sakrist).



# <lo-sample/> LV.NO.2018.10.4

No cipariem $1, 2, 3, 4, 5, 6, 7, 8, 9$, katru izmantojot 
divas reizes, izveidoti trīs sešciparu skaitļi. Ar kādu lielāko
nuļļu skaitu var beigties trīs izveidoto skaitļu summa?

<small>

* [notation.divrules.3or9.divides](#)
* [notation.dec.numdigits.sum](#)
* [misc.contradiction](#)
* [misc.construct.alpha](#)

</small>

## No pretējā

* Katrs sešciparu skaitlis ir mazāks par 1 miljonu. 
* 3 šādu skaitļu summa ir zem 10 miljoniem (7-cipari). 
* Vai var beigties ar 6 nullēm?
* Ciparu summas dēļ jādalās ar $9$, bet $9000000$ ir par daudz.

## Vai var beigties ar 5 nullēm? 

Konstruējam, ikreiz liekot mazākos iespējamos ciparus.

![Saskaitīšana stabiņā](LV.NO.2018.10.4.svg)



# <lo-sample/> LV.NO.2019.10.5

Atrast visus pirmskaitļu pārus $(m,n)$, kuriem 
$20m + 18n = 2018$.

<small>

* [notation.divrules.2or5or10.divides](#)
* [div.primes.factorize.small](#)

</small>

## Risinājums

* Īsinām $20m+18n=2018\;\Rightarrow\;10m+9n=1009$. 
* Lai $1009 - 9n$ dalītos ar $10$, $n$ pēdējais cipars ir "1":  
$m=(1009-9n)/10$ ir vesels, ja $n=1,11,21,31,41,51,61,71,81,91,101,111$
* Atbilstošie pāri: $(100,1)$, $(91,11)$, $(82,21)$, <red>$(73,31)$</red>, $(64,41)$, 
$(55,51)$, $(46,61)$, <red>$(37,71)$</red>, $(28,81)$, $(19,91)$, $(10,101)$, $(1,111)$. 

No tiem der tikai divi: $(73,31)$, $(37,71)$





# <lo-sample/> LV.VO.2011.10.4

Dots polinoms $f(x)$ ar veseliem koeficientiem. Vai iespējams, ka
$f(2011) = 100$, bet $f(11) = 1000$?

<small>

* [alg.poly.int.valdiff](#)
* [alg.factorize.powdiff](#)

</small>


# <lo-sample/> LV.VO.2012.10.3

Naturāla skaitļa $N$ decimālajā pierakstā izmantots tikai cipars $6$.
Pierādīt, ka skaitļa $N^2$ decimālajā pierakstā nav cipara $0$.

<small>

* [misc.experiment](#) 
* [seq.geom.summation](#)
* [seq.geom.decnotation](#)

</small>


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

* [misc.symmetry](#)
* [alg.ineq.monotonicity](#)

</small>



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

* [seq.fibonacci](#)
* [seq.prop.periodic.finstate](#)
* [mod.expr.square](#)

</small>


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
* [div.pfactor.prop.numdivisors](#)

</small>


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

* [div.pfactor.prop.divisibility](#)
* [mod.parity](#)
* [mod.expr.poly](#)

</small>


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

* [div.primes.powers](#)
* [div.pfactor](#)
* [alg.linear](#)

</small>


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

* [alg.ratfractions.diff](#)
* [alg.sums](#)

</small>


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

* [notation.divrules.2or5or10.divides](#)
* [notation.dec.combine.split](#)
* [mod.expr.sum](#)
* [misc.strengthening](#)
* [misc.exhaustive](#)

</small>


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

* [notation.divrules.2or5or10.divides](#)
* [notation.divrules.3or9.divides](#)
* [notation.dec.combine.padding](#)

</small>


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

* [misc.experiment](#) 
* [mod.parity.cases](#)

</small>


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

* [mod.exponent.one](#)
* [notation.divrules.composite](#)

</small>



# <lo-sample/> LV.AO.2010.10.4

Cik dažādos veidos skaitli $2010$ var izteikt kā vismaz divu pēc kārtas
sekojošu naturālu skaitļu summu? Saskaitāmo secība nav svarīga. 

### LV.AO.2011.10.1

Cik dažādos veidos skaitli $2011$ var izteikt kā vismaz divu pēc kārtas
sekojošu naturālu skaitļu summu? Saskaitāmo secība nav svarīga. 

<small>

* [seq.arithm.summation](#)
* [div.pfactor.algorithm](#)
* [misc.exhaustive](#)

</small>





# <lo-sample/> LV.AO.2012.10.1

Pierādi: ja $p$ un $14p^2+1$ ir pirmskaitļi, tad $14p^2-1$ ir naturāla
skaitļa kubs.

<small>

* [mod.expr.square](#)
* [mod.expr.sum](#)

</small>


## Secinājumu ķēdīte:

* Ja $p$ nedalās ar $3$, tad $p^2$ atlikums, dalot ar $3$, ir $1$. 
* Tad $14p^2$ dod atlikumu $2$, dalot ar $3$, jo skaitli ar atlikumu $2$ 
reizina ar skaitli ar atlikumu $1$.
* Tad $14p^2+1$ dod atlikumu $0$, dalot ar $3$. Tas nav pirmskaitlis. 

Secinām, ka $p=3$ (citi pirmskaitļi nedalās ar $3$). Tādēļ 
$14p^2 +1 = 127$ un $14p^2 - 1 = 125$, kas tiešām ir pilns kubs $5^3$.





# <lo-sample/> LV.AO.2013.10.4

No pirmajiem $100$ naturālajiem skaitļiem izvēlēts $51$ skaitlis.
Pierādīt, ka no tiem var izvēlēties divus, no kuriem viens dalās ar
otru.

<small>

* [seq.geom](#)
* [misc.pigeonhole](#)

</small>


## Konstrukcija

Izrakstām ģeometriskas progresijas, kas sākas ar nepāru skaitļiem un $q=2$: 

$$(1,2,4,8,16,32,64),\;(3,6,12,24,48,96),$$
$$(5,10,20,40,80),\ldots,(97),\;(99).$$

* Būs tieši $50$ progresijas (dažās būs tikai pa vienam loceklim), jo līdz $100$ ir tieši $50$ nepāru skaitļi.
* Katrs skaitlis pieder tieši vienai progresijai, jo katram pāru skaitlim atbilst tieši viens nepāru 
skaitlis, kurš rodas, ja atkārtoti dala ar $2$. 
* Izvēloties $k+1$ skaitļus, vismaz divi būs no vienas progresijas (Dirihlē princips).


## Pretpiemērs

* Ja skaitļu ir tikai $50$, tad līdzīgi secināt nevar. 
* Var izvēlēties $51,\ldots,100$ - no tiem neviens nedalās ar otru.





# <lo-sample/> LV.AO.2014.10.4

Doti septiņi dažādi naturāli skaitļi; katriem diviem no dotajiem skaitļiem aprēķināja to
summu. Kāds lielākais skaits no šīm summām var būt pirmskaitļi?

<small>

* [mod.parity.cases](#)
* [misc.graphs.bipartite](#)
* [misc.bounds](#)
* [mod.expr.sum](#)
* [misc.construct.iterative](#) 

</small>

**Uzdevuma lasīšana:** Jānoskaidro lielākais *skaits*, kas vispār var būt 
pirmskaitļi. Nevis, teiksim, lielākais *dažādu pirmskaitļu* skaits, ko 
var šādi iegūt.


## Spriedumi ar paritāti

* Dažādu naturālu skaitļu summa nevar būt $2$.
* Tātad, lai divu skaitļu summa būtu (nepāru) pirmskaitlis, 
viens no tiem ir pāru, otrs ir nepāru. 


## Cik no 7 ir pāru un cik nepāru skaitļu?

$$7=0+7=1+6=2+5=3+4=4+3=5+2=6+1=7+0$$

Lielākais teorētiski iespējamais $(n,p)$ pārīšu skaits ir tad, 
ja $4$ no septiņiem skaitļiem ir nepāru un $3$ ir pāru (vai otrādi): 

$$4\cdot{}3=12$$


## Divdaļīgi grafi

<hgroup>

![bipartite](LV.AO.2014.10.4-01.svg)

* Nepāru skaitļi veido kopu $A$ ar $4$ elementiem, 
pāru skaitļi veido kopu $B$ ar $3$ elementiem. 
* Ir tikai $4\cdot{}3$ pāri, kam ir cerība būt pirmskaitļiem. 
(Saskaitot $p+p$ vai $n+n$ pirmskaitli iegūt nevar.)

</hgroup>

<hgroup>

**Definīcija:** Ja grafā visas virsotnes var sadalīt divās nepārklājošās apakškopās $A$ un $B$ tā, 
ka jebkura grafa šķautne iet no virsotnes kopā $A$ uz virsotni kopā $B$, tad grafu sauc 
par *divdaļīgu*.  
**Apgalvojums:** Ja divdaļīgā grafā apakškopās $A$ un $B$ ir attiecīgi $a$ un $b$ virsotnes, 
tad tajā ir ne vairāk kā $a\cdot{}b$ šķautnes.

</hgroup>


## Atlikumi, dalot ar 3


![bipartite](LV.AO.2014.10.4-02.svg)

* Izvēloties vismazākos nepāru un pāru skaitļus, tikai $9$ no $12$ teorētiski iespējamajiem 
ir pirmskaitļi (citas summas dalās ar $9$ - apzīmētas ar raustītu līniju). 
* Ja papildus prasa, lai visi $7$ skaitļi dotu atlikumu $1$ (vai, izņēmuma gadījumā, atlikumu $0$), 
dalot ar $3$, var panākt, lai visas $12$ summas būtu pirmskaitļi.


# <lo-sample/> LV.AO.2015.10.3

Atrast visus naturālos skaitļus, kas ir vienādi ar savu ciparu reizinājumu.
(Par viencipara skaitļa ciparu reizinājumu sauc tā vienīgo ciparu.)

<small>

* [misc.experiment](#) 
* [alg.ineq.transitive](#)

</small>


## Nevienādību izmantošana

* Pārbaudot dažādus skaitļus var novērot, ka ciparu reizinājums allaž mazāks par pašu skaitli.
* Pamatojam to 2-ciparu un 3-ciparu skaitļiem $\overline{ab}$ un $\overline{abc}$

$$a\cdot{}b < 10a \leq 10^1\cdot{}a + b = \overline{ab},$$
$$a\cdot{}b\cdot{}c < 10^2\cdot{}a < 100a + 10b + c = \overline{abc}.$$

Skaitļa pirmo decimālciparu reizinot ar $k$ turpmākajiem cipariem, iegūsim 
mazāku rezultātu nekā reizinot ar $10^k$, jo katrs cipars ir mazāks par $10$. 





# <lo-sample/> LV.AO.2016.10.2

Vai var atrast tādus veselus skaitļus $x$, $y$ un $z$, ka
$x^3 − 2016xyz = 120$?

<small>

* [div.pfactor.algorithm](#)
* [notation.divrules.3or9.remainder](#)
* [mod.expr.poly](#)
* [mod.equation.contradict](#) - pretrunas modulis: atlikumi pēc 9

</small>





# <lo-sample/> LV.AO.2016.10.3

Aritmētiskās progresijas četri pēc kārtas ņemti locekļi ir veseli
skaitļi $A$, $B$, $C$ un $D$. Pierādīt, ka
$A^2+2B^2+3C^2+4D^2$
var izteikt kā divu
veselu skaitļu kvadrātu summu!

<small>

* [seq.arithm.expr](#)
* [alg.expand.binom.squares](#)
* [alg.completesquare](#)

</small>





# <lo-sample/> LV.AO.2017.10.5

Pierādīt, ja no trim naturāliem skaitļiem $n$; $n+11$ un $n+22$ divi ir
pirmskaitļi, tad trešais skaitlis dalās ar $6$.

<small>

* [div.pfactor.prop.divisibility](#)
* [seq.arithm.mod.all](#)
* [misc.exhaustive](#) (gadījumus $n=2,3$ aplūko atsevišķi)

</small>





# <lo-sample/> LV.AO.2018.10.4

Pierādīt, ja $x$ - naturāls skaitlis, tad
$x^8 - x^2$ dalās ar $252$.

<small>

* [notation.divrules.3or9.divides](#)
* [div.pfactor.prop.divisibility](#)
* [mod.expr.poly](#)

</small>


## Pārbaudām dalāmību ar 252 reizinātājiem

> **Apgalvojums:** Lai naturāls skaitlis $N$ dalītos ar $252=2^2\cdot{}3^2\cdot{}7^1$
> ir nepieciešami un pietiekami, lai $N$ dalītos ar pirmreizinātāju 
> augstākajām pakāpēm: $2^2 = 4$, $3^2 = 9$ un $7^1 = 7$. 

* $x^8 - x^2$ dalās ar $4$:
    - Ja $x$ ir pāru skaitlis, tad $x^2$ dalās ar $4$. 
    - Ja $x$ ir nepāru skaitlis, tad $(x^4-x)(x^4+x)$ ir divu pāru skaitļu reizinājums. Tātad arī dalās ar $4$.
* $x^8 - x^2$ dalās ar $9$:  
    - Ja $x$ dalās ar $3$, tad $x^2$ dalās ar $9$.
    - Ja $x = 3k+1$, tad $x^3 - 1 = (3k+1)^3 - 1$ dalās ar $9$ (pārbauda, atverot iekavas)
    - Ja $x = 3k-1$, tad $x^3 + 1 = (3k-1)^3 + 1$ dalās ar $9$ (pārbauda, atverot iekavas)


## Dalāmība ar 7

Pamatosim, ka $x^8 - x^2 = x^2(x^6-1)$ dalās arī ar $7$.

* Ja $x$ dalās ar $7$, tad $x^2$ dalās ar $7$. 
* Ja $x$ nedalās ar $7$, varam izmantot Mazo Fermā teorēmu pie $p=7$. 

> **Mazā Fermā teorēma:** Ja $p$ ir pirmskaitlis un $a$ nedalās ar $p$, tad
> $a^{p-1}$ dod atlikumu $1$, dalot ar $p$. 

Citiem vārdiem, $a^{p-1}-1$ dalās ar $p$.  
Ievietojot $p-7$, iegūstam, ka 
$a^6 - 1$ dalās ar $7$, ja vien $a$ nedalās ar $7$.


## Empīriska teorēmas pārbaude, ja p=7

Mazo Fermā teorēmu atcerēties ir derīgi, bet var pamatot citādi.

Pārbaudīsim, ka $x^6$ dod atlikumu $1$, dalot ar $7$ 
visiem $x=1,2,3,4,5,6$. (Lielākām $x$ vērtībām $x$ var aizstāt
ar tā atlikumu, polinoma $x^6$ vērtības atlikums no tā nemainīsies). 

<table>
<tr><th>$x$</th><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td></tr>
<tr><th>$x^3$</th><td>1</td><td>8</td><td>27</td><td>64</td><td>125</td><td>216</td></tr>
<tr><th>Atlikums $x^3\;\mbox{mod}\;7$</th><td>1</td><td>1</td><td>6</td><td>1</td><td>6</td><td>6</td></tr>
<tr><th>$(x^3\;\mbox{mod}\;7)^2$</th><td>1</td><td>1</td><td>36</td><td>1</td><td>36</td><td>36</td></tr>
<tr><th>Atlikums $x^6\;\mbox{mod}\;7$</th><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td><td>1</td></tr>
</table>


## Polinoma vērtību atlikumi 

> **Apgalvojums:** Ja $P(x)$ ir polinoms ar veseliem koeficientiem, 
> ja $x_1, x_2, m$ ir naturāli skaitļi, pie tam $x_1$ un $x_2$ dod vienādus 
> atlikumus, dalot ar $m$ , tad 
> arī polinomu vērtības $P(x_1)$ un $P(x_2)$ dod vienādus atlikumus, dalot ar $m$. 

> **Definīcija:** Apgalvojumu, ka $x_1$ un $x_2$ dod vienādus atlikumus, dalot ar $m$ pieraksta šādi:
> $x_1 \equiv x_2\;(\mbox{mod}\,m)$. To lasa: $x_1$ un $x_2$ ir *kongruenti* pēc moduļa $m$. 

Šajos apzīmējumos katram polinomam $P(x)$ var secināt:

$$ x_1 \equiv x_2\;(\mbox{mod}\,m)\;\;\Rightarrow\;\;P(x_1) \equiv P(x_2)\;(\mbox{mod}\,m)$$








