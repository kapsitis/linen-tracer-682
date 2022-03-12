# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#11: Rekurentas virknes</h1>

</hgroup><hgroup>

<span style="color:darkgreen">**(1) Ievads**</span>  
<span>(2) [Pamatfakti](#section-1)</span>  
<span>(3) [Aptauja](#section-2)</span>  
<span>(4) [Tipisks piemērs](#section-3)</span>  
<span>(5) [Patstāvīgie uzdevumi](#section_4)</span>  
<span>(6) [Kopsavilkums](#section_5)</span>

</hgroup>


-----

# <lo-default/> Ceļa karte

<hgroup style="width: 48%">

<table>
<tr><td style="text-align:left !important;">#1: Eksperimenti un piemēru veidošana</td></tr>
<tr><td style="text-align:left !important;">#2: Mainīgo izteiksmes un pārveidojumi</td></tr>
<tr><td style="text-align:left !important;">#3: Algebriskas struktūras</td></tr>
<tr><td style="text-align:left !important;">#4: Dalāmība un pirmreizinātāji</td></tr>
<tr><td style="text-align:left !important;">#5: LKD, MKD un valuācijas</td></tr>
<tr><td style="text-align:left !important;">#6: Kongruence pēc noteikta moduļa</td></tr>
<tr><td style="text-align:left !important;">#7: Pretrunas moduļa izvēle</td></tr>
</table>

</hgroup>
<hgroup style="margin-left: 4%; width: 45%">

<table>
<tr><td style="text-align:left !important;">#8: Decimālpieraksts</td></tr>
<tr><td style="text-align:left !important;">#9: Aritmētiskas progresijas</td></tr>
<tr><td style="text-align:left !important;">#10: Ģeometriskas progresijas</td></tr>
<tr><td style="text-align:left !important;"><red>**#11: Rekurentas virknes **</red></td></tr>
<tr><td style="text-align:left !important;">#12: Ekstrēmie elementi un Dirihlē princips</td></tr>
<tr><td style="text-align:left !important;">#13: Invarianti un indukcija</td></tr>
<tr><td style="text-align:left !important;">#14: Nevienādības</td></tr>
<tr><td style="text-align:left !important;">#15: Kombinatoriskas metodes</td></tr>
</table>

</hgroup>


-----

# <lo-default/> Rekurentu virkņu jautājumi

* Kā atpazīt jau zināmas progresijas iekš rekurentas virknes? 
* Kāpēc rodas periodi lineārās rekurencēs, dalot ar skaitli? 
* Kā atrast izteiksmi vispārīgam loceklim vienkāršos gadījumos? 


--

## <lo-sample/> Rekurentu virkņu lietojumi

* Lineāri vienādojumi veselos skaitļos.
* Kombinatorikas uzdevumi. 
* Atlikuma noteikšana lielos skaitļos. 
* Skaitļu teorijas uzdevumi.

-----

# <lo-sample/> Sasniedzamie rezultāti

* Izprast rekurentu virkņu definīciju 
* Atrast rekurentu virkni, kas raksturo kombinatorikas uzdevumu. 
* Izteikt lineāras rekurentas virknes vispārējo locekli. 
* Noteikt periodu un priekšperiodu periodiskās virknēs. 
* Spēt izveidot rekurences attiecību no eksponenciālām funkcijām.





-----

# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#11: Rekurentas virknes</h1>
</hgroup><hgroup> 
<span>(1) [Ievads](#section)</span>  
<span style="color:darkgreen">**(2) Pamatfakti**</span>  
<span>(3) [Aptauja](#section-2)</span>  
<span>(4) [Tipisks piemērs](#section-3)</span>  
<span>(5) [Patstāvīgie uzdevumi](#section_4)</span>  
<span>(6) [Kopsavilkums](#section_5)</span>

</hgroup>



-----

# <lo-default/> Lineāra rekurenta virkne

**Definīcija:** Virkni $u_1,u_2,\ldots,u_n,\ldots$ sauc par *lineāru rekurentu virkni*, 
ja eksistē tādi skaitļi $a_1,a_2,\ldots a_k,b$, ka $u_{n} = a_1u_{n-1} + a_2u_{n-2} + \cdots +
a_ku_{n-k} + b$, ja $n \geq k$.  
(Nākamo locekli iegūst no $k$ iepriekšējo lineāras summas. Tas nozīmē, ka pirmajiem $k$ virknes locekļiem jābūt dotiem)

**Piezīme:** Vispārīgā gadījumā katrs nākošais elements var būt patvaļīga
funkcija no iepriekšējiem elementiem, lai viennozīmīgi noteiktu to. Pārsvarā
tomēr dzīvē sastopamies ar lineārām virknēm.


-----

# <lo-default/> Fibonači virkne 

Apskatām rekurentu virkni, kas uzdota sekojoši:

$$F_n = F_{n-1} + F_{n-2.}$$ Tā kā virkne atsaucas uz diviem iepriekšējiem, tad
nepieciešams uzdot $F_0 = 0$ un $F_1 = 1$. Pielietojot rekursīvo definīciju,
iegūstam dažus virknes locekļus:
$$
0, \; 1, \; 1, \; 2, \; 3, \; 5, \;8, \;13, \;21, \; \ldots
$$


-----

# <lo-default/> Aritmētiskās progresijas atpazīšana 
Aritmētisku virkni parasti uzrakstām formā $a_n = d(n-1) + a_1$. Diferenci
viegli varam noteikt, skatoties starpības, tāpēc arī rekurentās virknēs to varam
darīt.

Apskatām rekurentu virkni: $a_0 = 7,\; a_1=15,\; a_n = a_{\lfloor n/2 \rfloor} +
a_{\lceil n/2 \rceil}-7.$

Pirmie virknes elementi ir $7,15,23,31,39.$ Skatoties uz diferencēm, viegli
saskatīt, ka iet runa par virkni formā $a_n = 8n + 7.$


-----

# <lo-default/> Ģeometriskās progresijas atpazīšana
Tāpat kā aritmētiskās progresijas atpazīst pēc diferencēm, tad ģeometriskās
progresijas var atpazīt pēc kvocientiem.

Apskatām rekurentu virkni: $g_0 = 2,\; g_1 = 6,\; g_n = g_{n-1} + 6g_{n-2},$ ja $n
\geq 2.$

Apskatot pirmos locekļus - $2, 6, 18, 54, 162,$  saskatām, ka to attiecība ir
$3$. Šajā brīdī labs minējums būtu, ka $g_n = 2\cdot3^n$.


-----

# <lo-default/> Rekurence kombinatorikā 

Ir uzdevumi, kurus iespējams atrisināt, ja izdodas parādīt, ka uzdevuma atbilde
ir rekurentas virknes loceklis. Bieži vien tie ir uzdevumi, kuros tiek prasīts
noteikt kādu objektu skaitu, kas atkarīgi no paremetra $n$.


-----

# <lo-sample/> Taisnstūra sagriešana
Cik dažādos veidos taisnstūri $2 \times 12$ var sagriezt taisnstūros $1 \times
2?$ (Griezumi, kas iegūstami viens no otra ar simetriju vai pagriezienu, tiek
uzskatīti par dažādiem.)


-----

# <lo-default/> Rekurentu virkņu viennozīmība 
* Rekurences sakarība ir pilnībā noteikta no iepriekšējiem locekļiem, tāpēc, ja
uzdota lineāra rekurenta virkne $X_{n} = a_1X_{n-1} + a_2X_{n-2} + \cdots +
a_kX_{n-k} + a_0$, ja $n \geq k$ ar $k$ sākuma nosacījumiem, lai noteiktu virknes
locekli $X_i$, nepieciešams zināt $X_{i-1},X_{i-2},\dots,X_{i-k}$. 

* Tas pats arī ir patiess, ja gribam uzzināt $X_i \; (\text{mod} \;  m)$, kur $m$ ir kāds naturāls skaitlis. 


-----

# <lo-default/> Periods un priekšperiods
 
* Tā kā lineārā rekurentā virknē katrs nākošais loceklis ir nosakāms ar $k$
iepriekšējiem un dalot ar $m$ ir $m$ iespējami atlikumi, tad kopā var būt $m^k$
stāvokļi, kādos var atrasties $k$ iepriekšējie locekļi pēc moduļa $m$.
* Šis ir galīgs skaits, tas nozīmē, ka vienā brīdī šie $k$ atlikumi atkārtosies jeb
pastāvēs tādi naturāli skaitļi $q$ un $p$, lai 
`$$X_i \equiv X_{i+p} \; (\text{mod } m) \; \; \; \;\text{visiem } i > q.$$`

* Mazākos naturālos skaitļus $q$ un $p$, kuriem izpildāš šī īpašība sauc attiecīgi
par *priekšperiodu* un *periodu*.


-----

# <lo-sample/>  LV.VO.2013.10.4
Pierādīt, ka Fibonači virknē ir bezgalīgi daudz skaitļu, kas nav naturāla skaitļa
kvadrāti.


-----

# <lo-sample/> Fibonači virknes atlikumi
Vai starp pirmajiem $10^8 +1$ Fibonači skaitļiem eksistē skaitlis, kuram beigās
ir četras nulles? 



-----

# <lo-default/> Raksturīgais vienādojums
Par lineāras rekurences sakarības
$$
u_n = a_1u_{n-1} + a_2u_{n-2} + \ldots + a_ku_{n-k}
$$
ar konstantiem koeficientiem $a_1,\dots a_k$ *raksturīgo vienādojumu* sauc vienādojoumu
$$
t^k - a_1t^{k-1} - a_2t^{k-2} - \ldots - a_k = 0.
$$


-----

# <lo-default/> Otrās kārtas raksturīgais vienādojums

Apskatīsim gadījumu, kad $k=2$, t.i., rekurences sakarība ir formā

$$
u_n = a_1u_{n-1} +a_2u_{n-2}.
$$
Tad raksturīgais vienādojums ir $t^2 - a_1t - a_2 = 0.$ Ir iespējami divi
gadījumi:

* Vienādojumam ir divas vienādas saknes $t_1$ un $t_2$.
Vispārīgais loceklis tad izsakāms formā $u_n = C_1t_1^n +C_2t_2^n$.
* Vienādojumam ir divkārša sakne $t_1$.
Vispārīgais loceklis tad izsakāms formā $u_n = C_1t_1^n +C_2\cdot nt_1^n$.

Skaitļus $C_1$ un $C_2$ nosaka pēc sākuma nosacījumiem.


-----

# <lo-sample/> Vispārīgais loceklis
Atrast izteiksmi vispārīgajam loceklim Fibonači virknei.


-----

# <lo-default/> Rekurentas virknes iegūšana
Dažreiz no vispārīgās formulas ir izdevīgāk iegūt rekurences formulu, lai spētu
pielietot faktus par atlikumu periodiskumu. Saprotot, kur vienādojumā atrodas
saknes, un no tām izveidojot raksturīgo vienādojumu, varam iegūt rekurences
sakarību.


-----

# <lo-sample/> Atlikuma noteikšana 
Kādu atlikumu dod skaitlis $(3+\sqrt{2})^{2019} + (3-\sqrt{2})^{2019}$, dalot ar 5?


--

## Ieteikumi
Varam saskatīt, ka $t_1 = 3+\sqrt{2}$ un $t_1 = 3 -\sqrt{2}$. Izmantojot Vjeta
teorēmu, redzam, ka raksturīgais vienādojums izskatītos formā $t^2 -6t +7=0$.
No šī iegūstam rekurento sakarībo $u_n = 6u_{n-1} - 7u_{n-2}$. Ar sākuma
nosacījumiem $u_1=6$ un $u_2=22$.

Tagad skatamies uz virkni pēc moduļa $5$ un meklējam periodu. Kopā ir iespējami
$25$ atlikumu pāri, tāpēc periodu nebūs grūti atrast. Lai iegūtu atbildi,
jāatrod 2019. atlikums.


-----

# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#11: Rekurentas virknes</h1>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Pamatfakti](#section-1)</span>  
<span style="color:darkgreen">**(3) Aptauja**</span>  
<span>(4) [Tipisks piemērs](#section-3)</span>  
<span>(5) [Patstāvīgie uzdevumi](#section_4)</span>  
<span>(6) [Kopsavilkums](#section_5)</span>

</hgroup>



-----

# <lo-quiz/> Jautājums Nr.1
Dota rekurenta virkne $L_{n} = L_{n-1} + L_{n-2}$ ar sākuma nosacījumiem
$L_1=1,L_2=3$. Atrast nākošos $5$ virknes locekļus.


--

## Ieteikumi

Jāizprot rekurentas virknes definīcija.


-----

# <lo-quiz/> Jautājums Nr.2

Virkne $1,1,7,13,55,133,\ldots$ ir piemērs rekurentai virknei, kura apmierina
rekurences attiecību 
$$
a_n=a_{n-1} + 6a_{n-2}.
$$
Atrast ģeometrisku progresiju, kas apmierina šo rekurenci un pirmais virknes loceklis ir
1.


--

## Ieteikumi

Jāatrod kvocients, jo pirmais virknes loceklis jau ir dots. Var eksperimentēt ar
mazām vērtībām, lai saskatītu, ka atbilst rekurences sakarībai.


-----

# <lo-quiz/> Jautājums Nr.3

Pamatot, ka ka katram naturālam skaitlim $k$, pastāv bezgalīgi daudz Fibonači
skaitļi, kas dalās ar $k$.


--

## Ieteikumi

* Vai vari atrast vismaz vienu locekli, kas vienmēr dalīsies ar $k$? (Šeit noder
Fibonāci virknes definīcija, kas izmantota šajā materiālā)


-----

# <lo-quiz/> Jautājums Nr.4

Atrast izteiksmi vispārīgajam loceklim, kura apmierina rekurences sakarību $u_n
= 2u_{n-1} - u_{n-2}$ un kuras sākuma nosacījumi ir $u_1=4,u_2=1$.


--

## Ieteikumi

* Vispirms jāsastāda raksturīgais vienādojums.
* No iegūtajām saknēm var sastādīt vispārīgo izteiksmi.
* Lai noteiktu brīvos locekļus, jāizmanto sākuma nosacījumi.


--

# <lo-quiz/> Jautājums Nr.5 

Atrast rekurences attiecību, kura apmierina $f(n) = 3^n + 4^{n+1}$.

## Ieteikumi

Nepieciešams atpazīt saknes, lai izveidotu raksturīgo vienādojumu. 


-----

# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#11: Rekurentas virknes</h1>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Pamatfakti](#section-1)</span>  
<span>(3) [Aptauja](#section-2)</span>  
<span style="color:darkgreen">**(4) Tipisks piemērs**</span>  
<span>(5) [Patstāvīgie uzdevumi](#section-4)</span>  
<span>(6) [Kopsavilkums](#section-5)</span>

</hgroup>



-----

# <lo-sample/> US.MMO.1999.4

Virknē
$$
1,1,2,3,7,22,155,3411, \ldots
$$
katrs nākošais loceklis ir vienāds ar divu iepriekšējo reiznājumu, kuram
pieskaitīts $1$. Pierādīt, ka nav tāda virknes locekļa, kas dalītos ar $4$.

## Ieteikumi

Vai var kaut ko saskatīt atlikumu virknē?


-----

# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#11: Rekurentas virknes</h1>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Pamatfakti](#section-1)</span>  
<span>(3) [Aptauja](#section-2)</span>  
<span>(4) [Tipisks piemērs](#section-3)</span>  
<span style="color:darkgreen">**(5) Patstāvīgie uzdevumi**</span>  
<span>(6) [Kopsavilkums](#section-5)</span>

</hgroup>


-----

# <lo-sample/> Klasisks uzdevums

No mājām līdz ieejai dzīvoklī ir $12$ pakāpieni. Ar vienu soli var pārkāpt $1,2$ vai
$3$ pakāpienus. Cik dienas var kāpt atšķirīgos veidos? (Veidus uzskata par
atšķirīgiem, ja atšķiras izdarīto soļu secība, piemēram, kāpt $2; 3; 1$
pakāpienus un kāpt $1; 2; 3$ pakāpienus ir divi atšķirīgi veidi.)


--

## Ieteikumi 

* Vai var kaut kā sastādīt rekurences attiecību?



-----

# <lo-sample/> Klasisks uzdevums 

Cik šķēlēs var sagriezt picu ar $n$ taisniem griezumiem? (Mūsu pica ir
divdimensionāla un izliekta. Šķēles nedrīkst bīdīt apkārt starp griezieniem.)


--

## Ieteikumi

* Kāds ir lielākais šķēļu skaits, ko papildus var iegūt, ja iepriekšējā solī esi
  perfekti visu izdarījis?


-----

# <lo-sample/> Klasisks uzdevums

Virkne $G_0, G_1, G_2, \ldots$ sastāv no katra otrā Fibonači virknes skaitļa.
Pamatot, ka šī virkne ir lineāra rekurences virkne, t. i., pastāv skaitļi $a$ un
$b$, lai $G_n = aG_{n-1} +bG_{n-2}$.



--

## Ieteikumi

* Tā kā ir prasīta tikai eksistence, īsākais atrisnājums pat nedotu konkrētus
$a$ un $b$, bet tikai garantētu, ka tādi ir.

* Vai ir konkrēta formula, lai noteiktu katru otro Fibonači skaitli? Kā to
pārveidot jaunā rekurentā virknē?


-----

# <lo-sample/> Klasisks uzdevums 

Pierādīt, ka katram naturālam $n$ skaitlis $\left \lceil (3 + \sqrt{5})^n \right \rceil$
dalās ar $2^n$.


--

## Ieteikumi

* Neskatoties uz griestu funkciju, izteiksme izskatās līdzīga kaut kam, ar ko
 esam strādājuši iepriekš. Ko var
pieskaitīt, lai iegūtu vienmēr veselu skaitli?

* No šī varam izveidot rekurences sakarību?

* Būs nepieciešams indukcijas arguments, lai formāli pierādītu.


-----

# <lo-sample/> Klasisks uzdevums 

Kādi cipari ir tieši pa labi un kreisi komatam decimālizvirzījumā skaitlim
$(\sqrt{2} + \sqrt{3})^{2018}$?


--

## Ieteikumi

* Noteikti gribam nonākt situācijā, ka skaitlis vienmēr būs naturāls.

* Ja pieskaitām "saistīto" izteiksmi un uzsaktām to kā rekurenci, saskatām, ka
tas būs vesels tikai pāra pozīcijās. Vai varam pārveidot sākotnējo izteiksmi,
lai iegūtu rekurenci, kurā vienmēr būs veseli skaitļi?

* Kāds ir šis skaitlis, ko pieskaitījām, lai iegūtu veselu skaitli?

* Kur slēpjas āķis tajā, kad prasa abus ciparus no komata skaitlim?


--

## Atrisinājuma skice

* $(\sqrt{2} + \sqrt{3})^{2018} = (5 + 2\sqrt{6})^{1009}$, tas nozīmē, ka
$(5 + 2\sqrt{6})^{n} + (5 - 2\sqrt{6})^{n}$ būs vienmēr vesels skaitlis.
*  Atrodam rekurento virkni caur raksturīgo vienādojumu. 
* Pēc moduļa $10$ atrodam atlikumu $1009.$ loceklim virknē.
*  Gala rezultātā atņemam $1$ no rezultāta, jo
pārveidojumam pieskaitījām ļoti mazu skaitli.
*  Cipars pa labi no komata būs $9$.




-----

# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#11: Rekurentas virknes</h1>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Pamatfakti](#section-1)</span>  
<span>(3) [Aptauja](#section-2)</span>  
<span>(4) [Tipisks piemērs](#section-3)</span>  
<span>(5) [Patstāvīgie uzdevumi](#section-4)</span>  
<span style="color:darkgreen">**(6) Kopsavilkums**</span>

</hgroup>


-----

# <lo-default/> Ko darījām šajā nodarbībā?

* Iepazināmies ar rekurentām virknēm kā aritmētiskās un ģeometriskās progresijas
vispārinājumu.
* Izmantojām rekurentas virknes, lai atrisinātu kombinatorikas uzdevumus.
* Noteicām vispārīgo locekli rekurentās virknēs.
* Izmantojām rekurentas virknes, lai atrisinātu skaitļu teorijas uzdevumus.
* Darbojāmies ar rekurentu virkņu atlikumiem un to periodiem.

