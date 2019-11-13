# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Lineārā optimizācija - 2</blue>

</hgroup><hgroup style="font-size:90%">

<span style="color:darkgreen">**(1) Ievads**</span>  
<span>(2) [Vispārīgais simpleksalgoritms](#section-1)</span>  
<span>(3) [Duālā lineārā programma](#section-2)</span>  
<span>(4) [Sākotnējā stūra izvēle](#section-3)</span>  
<span>(5) [Elipsoīda algoritms](#section-4)</span>  
<span>(6) [(P) Plūsmu uzdevumi](#section-5)</span>  
<span>(7) [Kopsavilkums](#section-6)</span>

</hgroup>




# <lo-why/> why

<div class="bigWhy">

Kāpēc ar simpleksalgoritmu nepietiek?

</div>

<div class="smallWhy">

* Simpleksalgoritma varianti (sākotnējā un duālā problēma,
pirmā stūra izvēle, pārejas izvēle un randomizācija). 
* Var būt slikta sarežģītība (īpaši uzkonstruētem piemēriem). 
* Polinomiāla laika algoritms ir standarts visam, ko lieto praksē.

</div>


 
## <lo-theory/> Sasniedzamie rezultāti

1. Definēt duālo uzdevumu. 
2. Formulēt dualitātes teorēmu. 
3. Noskaidrot simpleksalgoritma izvēles.
4. Formulēt Elipsoīda algoritmu (Khachiyan). 
5. LP lietojumi plūsmu maksimizēšanā un 
"operāciju pētīšanā". 





# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Lineārā optimizācija - 2</blue>

</hgroup><hgroup style="font-size:90%">

<span>(1) [Ievads](#section)</span>  
<span style="color:darkgreen">**(2) Vispārīgais simpleksalgoritms**</span>  
<span>(3) [Duālā lineārā programma](#section-2)</span>  
<span>(4) [Sākotnējā stūra izvēle](#section-3)</span>  
<span>(5) [Elipsoīda algoritms](#section-4)</span>  
<span>(6) [(P) Plūsmu uzdevumi](#section-5)</span>  
<span>(7) [Kopsavilkums](#section-6)</span>

</hgroup>



# <lo-theory/> Kāpēc LP ir svarīgas?

* (Reālo skaitļu) LP ir pirmais solis, lai risinātu 
veselo skaitļu problēmas (*Integer Programming, IP*) un 
jauktās LP problēmas (*Mixed Integer Linear Programs, MIP*). 
* Kā optimāli izvēlēties komplektu (izejvielas, akciju portfeļus), 
kā vislabāk sadalīt kādu resursu.
* Plūsmas maksimizēšana grafā (skatīsimies šajā lekcijā).

Veselie skaitļi kā nezināmie (*Integer Programming*) 
labāk modelē Yes/No lēmumu pieņemšanu (0 un 1 vērtības), 
bet šādus uzdevumus ir grūtāk risināt. 


## <lo-summary/> LP algoritmi 

* Simpleksalgoritmi (Kantorovičs, 1939; Dantzig, 1947).
* Elipsoīda algoritms (Khachian, 1979)
* Iekšējo punktu metodes (*Interior Point methods*).
    - Projektīvā metode (Karmarkar, 1984).
    - Afīnā metode (Dikin, 1967).
    - Log Barrier Method. 

Simpleksalgoritms parasti ir ļoti ātrs, bet īpaši uzkonstruēti
piemēri var būt sarežģīti.   
Matricām var būt ap 100 tūkstošiem rindiņu/kolonnu; ap miljons
skaitļu šajās matricās nav nulles. 


## <lo-summary/> Hamiltona cikli

<hgroup style="font-size:70%">

![Hamiltonian path](hamiltonian_path_3d.png)

**Definīcija:** Par Hamiltona ciklu neorientētā grafā 
sauc virsotņu virknīti $A_0,A_1,\ldots,A_n$, kur
katra grafa virsotne piedalās tieši vienreiz (izņemot 
$A_0=A_n$ - pirmā visotne sakrīt ar pēdējo) un katras 
divas blakusesošas virsotnes savieno šķautne. 

</hgroup>
<hgroup>

**Jautājums:** Dots neorientēts grafs. Kā uzrakstīt 
lineāru vienādību vai nevienādību sistēmu, kuru atrisinot 
(vai pamatojot, ka atrisinājuma nav), var atrast Hamiltona ciklu 
grafā (vai pierādīt, ka šāda cikla nav)?

</hgroup>

# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Lineārā optimizācija - 2</blue>

</hgroup><hgroup style="font-size:90%">

<span>(1) [Ievads](#section)</span>  
<span>(2) [Vispārīgais simpleksalgoritms](#section-1)</span>  
<span style="color:darkgreen">**(3) Duālā lineārā programma**</span>  
<span>(4) [Sākotnējā stūra izvēle](#section-3)</span>  
<span>(5) [Elipsoīda algoritms](#section-4)</span>  
<span>(6) [(P) Plūsmu uzdevumi](#section-5)</span>  
<span>(7) [Kopsavilkums](#section-6)</span>

</hgroup>



# <lo-theory/> Primārā lineārā programma

<div style="font-size:70%">

Pieņemsim, ka ir lineāra programma (sauksim par <blue>*primāro LP*</blue>):

Maksimizēt $c_1 x_1 + c_2 x_2 + \ldots + c_n x_n$ pie šādiem nosacījumiem:
$$ \left\{ \begin{array}{l}
a_{11} x_1 + a_{12} x_2 + \ldots + a_{1n} x_n  \geq b_1,\\
\ldots
a_{k1} x_1 + a_{k2} x_2 + \ldots + a_{kn} x_n = b_k,\\
x_1 \geq 0,\; x2 \geq 0,\;\ldots 
\end{array} \right.$$

LP var nebūt standartformā: 

* Nosacījumiem $a_{i1} x_1 + a_{i2} x_2 + \ldots + a_{in} x_n ? b_i$,  
jautājuma zīmes vietā var būt jebkura zīme ($\geq$, $\leq$, $=$). 
* Attiecībā uz mainīgajiem $x_i$ var būt nosacījumi $xi \geq 0$, $x_i \leq 0$, 
vai vispār nebūt nosacījuma attiecībā uz $x_i$.

</div>



# <lo-theory/> Duālā lineārā programma

<div style="font-size:70%">

Par <blue>*duālo programmu*</blue> sauc tādu lineāro programmu, kur jāminimizē izteiksme:
$$b_1 y_1 + b_2 y_2 + \ldots + b_k y_k,$$
pie nosacījumiem
$$a_{11} y_1 + a_{21} y_2 + \ldots + a_{k1} y_k ? c_k,$
kur simbols jautājuma zīmes vietā tiek noteikts šādi:

* Ja primārajā LP bija nosacījums $x_i \geq 0$, tad jautājuma zīmes vietā ir $\geq$.
* Ja primārajā LP bija nosacījums $x_i \leq 0$, tad jautājuma zīmes vietā ir $\leq$.
* Ja primārajā LP nebija nosacījuma attiecībā uz $x_i$, tad jautājuma zīmes vietā ir $=$.

Attiecībā uz mainīgajiem y1, y2, ..., yk, nosacījumi ir atkarīgi no tā, kāda zīme bija primārās LP nosacījumā ai1 x1 + ai2 x2 + ... + ain xn  ? bi:

* Ja $?$ vietā bija $\geq$, tad mums tagad ir nosacījums $y_i \leq 0$.
* Ja $?$ vietā bija $\leq$, tad mums tagad ir nosacījums $y_i \geq 0$.
* Ja $?$ vietā bija $=$, tad mums tagad nav nosacījuma attiecībā uz $y_i$.

</div>



# <lo-sample/> LP Piemērs

Primārā lineārā programma ir šāda:  
Maksimizēt $\color{#00F}{5x_1 + 16x_2}$ pie nosacījumiem
$$ \left\{ \begin{array}{l}
x_1 + x_2 \leq 1,\\
2x_1 + 7x_2 \leq 9,\\
x_1 \geq 0,\;\; x_2 \geq 0,
\end{array} \right.$$
Tad duālā programma ir:  
Minimizēt $\color{#00F}{y_1+ 9y_2}$ pie nosacījumiem:
$$ \left\{ \begin{array}{l}
y_1 + 2y_2 \geq 5,\\
y_1 + 7y_2 \geq 16,\\
y_1 \geq 0,\;\; y_2 \geq 0.
\end{array} \right.$$


## <lo-sample/> Duālās programmas nozīme

<div style="font-size:70%">

Duālo programmu var interpretēt šādi: katrs duālās programmas atrisinājums 
dod novērtējumu no augšas priekš primārās programmas atrisinājuma. 
Piemēram, ja mums ir duālās programmas atrisinājums $y_1 = y_2 = 2$, 
tad no duālās programmas nosacījumiem seko, ka
$$5x_1 + 16x_2 \leq  2(x_1 + x_2) + 2(2x_1 + 7x_2).$$
Apvienojot to ar primārās programmas nosacījumiem, mēs iegūstam, ka 
$$5x_1 + 16x_2  \leq  2 \cdot 1 + 2 \cdot 9 = 20,$$
tas ir, primārās LP mērķfunkcija jebkurā punktā ir mazāka 
par duālās programmas mērķfunkciju (arī jebkurā punktā, 
jo augstāk minētajā spriedumā $y_1 = y_2 = 2$ var aizstāt ar jebkuru 
citu punktu, kur izpildās visi duālās programmas nosacījumi). 

</div>


# <lo-theory/> Dualitātes teorēma

1. Ja primārajai LP eksistē maksimums, tad duālajai LP arī eksistē 
atrisinājums un primārās LP maksimums sakrīt ar duālās LP minimumu.
2. Ja primārajai LP neeksistē atrisinājums (nosacījumi ir pretrunīgi), 
tad duālajai LP mērķfunkcija var sasniegt patvaļīgi mazas vērtības.
3. Ja primārajai LP mērķfunkcija var sasniegt patvaļīgi lielas vērtības, 
tad duālajai LP atrisinājums neeksistē (nosacījumi ir pretrunīgi).


## <lo-theory/> Primārās un duālās LP apvienošana

Ja dotas primārā LP un duālā LP, varam uzrakstīt jaunu LP, 
kas satur visus mainīgos (gan $x_1, x_2, \ldots, x_n$, 
gan $y_1, y_2, \ldots, y_k$), 
gan visus nosacījumus no abām programmām un pievienot tai vēl vienu nosacījumu:
$$c_1 x_1 + c_2 x_2 + \ldots + c_n x_n = b_1 y_1 + b_2 y_2 + \ldots + b_k y_k.$$

Tad vienīgais gadījums, kad izpildās visi nosacījumi ir, ja 
$x_1, x_2, \ldots, x_n$ sasniedz primārās LP maksimums, bet 
$y_1, y_2, \ldots, y_k$ sasniedz duālās LP minimumu.

**Secinājums:** Ja mums ir algoritms, kas prot patvaļīgai LP atrast 
vienu punktu, kas apmierina visus nosacījumus, tad šo algoritmu 
var izmantot arī maksimuma atrašanai.



# <lo-theory/> Matricu pieraksts: Primārā LP

<hgroup>

**Primārā LP:** <blue>Maksimizēt:</blue> $4x_1 + 2x_2 - x_3,$ kur 
$$\left\{
\begin{array}{l}
x_1 + x_2 + x_3 = 20\\
2x_1 - x_2 \geq 6\\
3x_1 + 2x_2 + x_3 \leq 40\\
x_1,x_2 \geq 0
\end{array} \right.$$

</hgroup>
<hgroup style="font-size:70%">

$$x = \left(
\begin{array}{c}
x_1\\
x_2\\
x_3
\end{array} \right), \;\; b = \left(
\begin{array}{c}
20\\
6\\
40
\end{array} \right),$$
$$c = \left(
\begin{array}{ccc}
4 & 2 & -1
\end{array} \right),$$
$$A = \left(
\begin{array}{ccc}
1 & 1 & 1\\
2 & -1 & 0\\
3 & 2 & 1
\end{array} \right).$$
</hgroup>


# <lo-theory/> Matricu pieraksts: Duālā LP

<hgroup>

Duālā LP:  
<red>Minimizēt:</red> $4x_1 + 2x_2 - x_3,$ kur 
$$ \left\{
\begin{array}{l}
y_1 + 2y_2 + 3y_3 \geq 4\\
y_1 - y_2 + 2y_3 \geq 2\\
y_1 + y_3 = -1\\
y_2 \leq 0,\; y_3 \geq 0 
\end{array} \right. $$

</hgroup>
<hgroup>

* Koeficientus iegūst, transponējot $A$. 
* Vienādību un nevienādību tipus nosaka atbilstoši 
augšminētajiem noteikumiem: Piemēram, ja $x_1 \geq 0$ primārajā 
problēmā, tad $x_1$ mainīgajam atbilstošais duālais vienādojums 
$y_1 + 2y_2 + 3y_3 \geq 4$. 

</hgroup>



<!--

## <lo-soln/> Dualitātes teorēma matricu veidā

<hgroup>

Maksimizēt $z = \mathbb{c} \cdot \mathbb{x}$, kur $A\mathbb{x} 

-->


# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Lineārā optimizācija - 2</blue>

</hgroup><hgroup style="font-size:90%">

<span>(1) [Ievads](#section)</span>  
<span>(2) [Vispārīgais simpleksalgoritms](#section-1)</span>  
<span>(3) [Duālā lineārā programma](#section-2)</span>  
<span style="color:darkgreen">**(4) Sākotnējā stūra izvēle**</span>  
<span>(5) [Elipsoīda algoritms](#section-4)</span>  
<span>(6) [(P) Plūsmu uzdevumi](#section-5)</span>  
<span>(7) [Kopsavilkums](#section-6)</span>

</hgroup>






# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Lineārā optimizācija - 2</blue>

</hgroup><hgroup style="font-size:90%">

<span>(1) [Ievads](#section)</span>  
<span>(2) [Vispārīgais simpleksalgoritms](#section-1)</span>  
<span>(3) [Duālā lineārā programma](#section-2)</span>  
<span>(4) [Sākotnējā stūra izvēle](#section-3)</span>  
<span style="color:darkgreen">**(5) Elipsoīda algoritms**</span>  
<span>(6) [(P) Plūsmu uzdevumi](#section-5)</span>  
<span>(7) [Kopsavilkums](#section-6)</span>

</hgroup>


# <lo-summary/> Elipsoīda algoritma ievads

Šo algoritmu izgudroja Hačijans (Khachiyan) 1979. gadā. 
Elipsoīda algoritms pazīstams kā pirmais lineārās programmēšanas algoritms, 
kuram tika pierādīts, ka tas atrod atrisinājumu polinomiālā laikā 
($O(n^4L)$, kur $n$ - dimensiju skaits, $L$ – ar cik bitu precizitāti jāatrod atrisinājums). 

Lai gan teorētiski darbības laiks ir polinomiāls, praksē algoritms ir 
lēns un netiek lietots. Tāpēc šajā kursā mēs ierobežosimies ar īsu šī algoritma aprakstu.


## <lo-summary/> Elipsoīda algoritma pārskats

Dualitātes teorēmas (un redukcijas uz primāro+duālo) dēļ 
pietiek ar algoritmu, kas atrod punktu, kur izpildās visi nosacījumi. To meklē šādi:

Sāk ar elipsoīdu $E_0$, kas noteikti ietver LP pieļaujamo apgabalu.  
Pilda sekojošus soļus līdzkamēr sasniegta vajadzīgā precizitāte:

1. Ņem iepriekšējā elipsoīda $E_i$ centru $c_i$.
2. Ja $c_i$ neapmierina visus LP nosacījumus, tad atrod nosacījumu 
$a_k$, kas tiek pārkāpts visvairāk.
3. Ar plakni, kas sastāv no visiem punktiem, kur nosacījuma $a_k$ 
izteiksmei ir vienāda vērtība $c$ (kur $c$ ir pa vidu starp vērtību punktā 
$c_i$ un pieļaujamajām izteiksmes vērtībām) pārdala telpu divās daļās. 
Ar $R_1$ apzīmējam daļu, kur nonāk $c_i$ un ar $R_2$ apzīmējam daļu, 
kur nonāk pieļaujamais apgabals.
4. Uzkonstruē jaunu elipsoīdu $E_{i+1}$, tā lai izpildītos
$$E_i \cap R_2 \subseteq E_{i+1}.$$


## <lo-summary/> Apgalvojums par elipsoīdu

<hgroup>

![Elipsoid Algorithm](elipsoid-algorithm.png)

</hgroup>
<hgroup>

Hačjana konstrukcijā (*barycentric coordinate descent*) elipsoīdi ir tādi, ka 
$$\frac{\text{Volume}(E_{k+1})}{\text{Volume}(E_{k})} = \frac{1}{2^{\frac{1}{2n+1}}$$
veido konstantu attiecību, kas atkarīga no dimensiju skaita $n$. 


</hgroup>




# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Lineārā optimizācija - 2</blue>

</hgroup><hgroup style="font-size:90%">

<span>(1) [Ievads](#section)</span>  
<span>(2) [Vispārīgais simpleksalgoritms](#section-1)</span>  
<span>(3) [Duālā lineārā programma](#section-2)</span>  
<span>(4) [Sākotnējā stūra izvēle](#section-3)</span>  
<span>(5) [Elipsoīda algoritms](#section-4)</span>  
<span style="color:darkgreen">**(6) (P) Plūsmu uzdevumi**</span>  
<span>(7) [Kopsavilkums](#section-6)</span>

</hgroup>



# <lo-sample/> Maksimālās plūsmas atrašana grafā

![Max Flow Graph](max-flow-graph.png)

Aplūkotajā grafā katrai šķautnei ir pierakstīta skaitliska vērtība - maksimālā 
atļautā plūsma, kuru pa šo šķautni var sūtīt (vai nu vienā, vai otrā virzienā). 
Var sūtīt arī mazāku plūsmu.   
**Uzdevums:** Atrast lielāko plūsmu no virsotnes "IN" uz virsotni "OUT". 

Šim uzdevumam 1956.g. tika izveidots [Forda-Falkersona algoritms](https://en.wikipedia.org/wiki/Ford%E2%80%93Fulkerson_algorithm) (*Ford-Fulkerson algorithm*), ko kursā neaplūkojam. 
Uzdevumu var arī reducēt uz Lineāro programmēšanu. 



# <lo-soln/> Lineārā programma

<div style="font-size:70%">

![Flow Preservation](flow-preservation.png)

Katrai (neorientētai) šķautnei ieviešam divus mainīgos, piemēram, $x_1$ un 
$x'_1$ (nenegatīvas plūsmas katrā no iespējamajiem virzieniem). 

1. Katrai virsotnei grafā rakstām "plūsmas saglabāšanās" ("flow preservation") 
vienādojumus. Piemēram, 
$$x_1 + x_2 + x'_3 = x'_1 + x'_2 + x_3.$$
2. Katrai šķautnei grafā rakstām divas nevienādības caurlaidībai ("edge capacity"). 
Piemēram, 
$$x_1 \leq 3,\;\;x'_1 \leq 3.$$
(Ja šķautne, kas atbilst $x_1$ un $x'_1$ ir ar caurlaidību $3$.)
3. Visas plūsmas ir nenegatīvas. Piemēram, 
$$x_1 \geq 0,\;\;x'_1 \geq 0.$$


# <lo-soln/> Maksimizējamā funkcija

<hgroup>

![Max Flow Graph](max-flow-graph.png)

</hgroup><hgroup>

1. Var maksimizēt plūsmu summu visām no "IN" izejošajām virsotnēm. 
2. Biežāk izmanto triku: pievieno fiktīvu šķautni no "OUT" atpakaļ uz "IN" - un maksimizē
plūsmu uz šīs vienas šķautnes.

</hgroup>


# <lo-theory/> Dualitātes lietošana max plūsmai

Sk. [Max Flow to Linear Programming](http://www.cs.cmu.edu/~odonnell/toolkit13/lecture14.pdf)

**Tipiska ideja:** No reālās dzīves nākušam Lineārās Programmēšanas 
uzdevumam formulējam duālo uzdevumu un mēģinām atrast šī uzdevuma interpretāciju. 




# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Lineārā optimizācija - 2</blue>

</hgroup><hgroup style="font-size:90%">

<span>(1) [Ievads](#section)</span>  
<span>(2) [Vispārīgais simpleksalgoritms](#section-1)</span>  
<span>(3) [Duālā lineārā programma](#section-2)</span>  
<span>(4) [Sākotnējā stūra izvēle](#section-3)</span>  
<span>(5) [Elipsoīda algoritms](#section-4)</span>  
<span>(6) [(P) Plūsmu uzdevumi](#section-5)</span>  
<span style="color:darkgreen">**(7) Kopsavilkums**</span>

</hgroup>


