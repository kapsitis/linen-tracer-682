# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#9: Aritmētiskas un ģeometriskas progresijas</h1>

</hgroup><hgroup>

<span style="color:darkgreen">**(1) Ievads**</span>  
<span>(2) [Pamatfakti](#section-1)</span>  
<span>(3) [Aptauja](#section-2)</span>  
<span>(4) [Tipisks piemērs](#section-3)</span>  
<span>(5) [Patstāvīgie uzdevumi](#section_4)</span>  
<span>(6) [Kopsavilkums](#section_5)</span>

</hgroup>





# <lo-roadmap/> Ceļa karte

<hgroup>

* #1: Eksperimenti un piemēru konstruēšana
* #2: Mainīgo izteiksmes un pārveidojumi
* #3: Algebriskas struktūras
* #4: Dalāmība un dalīšana pirmreizinātājos
* #5: LKD, MKD un valuācijas
* #6: Kongruence pēc fiksēta moduļa
* #7: Pretrunas modulis

</hgroup>
<hgroup>

* #8: Skaitļa pieraksts
* <red>**#9: Progresijas**</red>
* #10: Rekurentu virkņu periodiskums
* #11: Ekstrēmie elementi un Dirihlē princips
* #12: Invarianti un pamatojumi ar indukciju
* #13: Nevienādības
* #14: Kombinatoriskas metodes

</hgroup>

# <lo-why/> Aritmētisku progresiju jautājumi

* Kāpēc vienmēr var izpildīt dalīšanu ar atlikumu?
* Kāpēc, dalot aritmētiskas progresijas locekļus ar kādu $m$, 
ne vienmēr rodas pilns atlikumu komplekts?
* Kāpēc var būt jāmeklē progresijas locekļu skaits intervālā?


# Aritmētisku progresiju lietojumi

* Lineāri vienādojumi veselos skaitļos.
* Ūdens liešanas, biljardu uzdevumi.
* Eiklīda algoritms un LKD kā invariants.

TODO: Motivējošas bildītes, kas ilustrē progresijas.




# <lo-why/> Ģeometrisku progresiju jautājumi

* Kāpēc ģeometriskas progresijas rodas uzdevumos 
par līdzīgām (pašlīdzīgām) figūrām un konstrukcijām?
* Kāpēc ģeometriskas progresijas rodas skaitļa
decimālpierakstā?
* Kāpēc ģeometrisku progresiju formulas ļauj pārveidot
algebriskas izteiksmes?


# Ģeometrisku progresiju lietojumi

* Skaitļi ar atkārtotiem cipariem vai ciparu fragmentiem
* Bezgalīgu decimāldaļu izteikšana parastas daļas formā
(izteiksmes $0.111\ldots$ un $0.010101\ldots$).
* Pārveidot izteiksmes $a^n - b^n$, $a^{2n+1} + b^{2n+1}$ 
lietojot ģeometriskas progresijas summu.
* Veidot virknes ar skaitļiem, kuriem katrus 
divus var izdalīt bez atlikuma.
* Ģeometriskas progresijas svēršanā un meklēšanā
* Ciparu skaita novērtējums pakāpēs
* Benforda sadalījums

 
# Sasniedzamie rezultāti

* Lietot skolas pamatkursa formulas par progresijām
* Atrast aritmētiskas progresijas locekļu skaitu intervālā
* Atrast iespējamos atlikumus, dalot progresiju ar skaitli
* Izmantot Bezū lemmu
* Pārrakstīt decimāldaļas kā ģeometriskas progresijas
* Noskaidrot, cik reizes jāreizina vai jādala ar $q$, 
lai sasniegtu vēlamo vērtību







# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#9: Aritmētiskas un ģeometriskas progresijas</h1>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span style="color:darkgreen">**(2) Pamatfakti**</span>  
<span>(3) [Aptauja](#section-2)</span>  
<span>(4) [Tipisks piemērs](#section-3)</span>  
<span>(5) [Patstāvīgie uzdevumi](#section_4)</span>  
<span>(6) [Kopsavilkums](#section_5)</span>

</hgroup>


# Aritmētiskas progresijas skolas kursā

* Progresijas $n$-tā locekļa formula
* Progresijas summas formula ar pirmo locekli un diferenci
* Progresijas summas formula ar malējo locekļu vidējo


# Progresijas locekļu skaits intervālā

**Apgalvojums:** Intervālā $[1;n]$ ir tieši 
$\lfloor n/d \rfloor$ daudzkārtņu progresijai 
$a_k = k\cdot d$, $k \in \mathbb{N}$. 

(Ja progresijas pirmais loceklis $a_1 \neq d$, tad
dalījums var būt jāapaļo gan uz augšu, gan uz leju.)

# Progresijas summas dalāmība

* Ja summēti nepāra skaits aritmētiskas
progresijas locekļu $S_n = a_1 + \ldots + a_n$, tad 
summa $S_n$ dalās ar $n$. 
* Ja summēti pāru skaits aritmētiskas 
progresijas locekļu, tad summa $S_n$ 
dalās ar $n/2$ (dažos gadījumos var dalīties arī 
ar $n$, bet ne vienmēr). 

# Mazākā progresijas diference

**Apgalvojums:** Katrai augošai naturālu skaitļu virknei 
$a_1 < a_2 < \ldots < a_n$ atradīsies tāds lielākais 
$d$, ka visi $a_i$ pieder aritmētiskai progresijai ar
diferenci $d$. 

# <lo-sample/> BBK2012.P1.36

Trīs no aritmētiskās progresijas locekļiem ir $41$, $113$, $193$. 
Atrast lielāko iespējamo diferences vērtību, ja 
zināms, ka tā ir vesels skaitlis.


# LKD saglabājas

**Apgalvojums:** Ja $\mbox{LKD}(a_1,d) = k$, 
tad arī $\mbox{LKD}(a_1+d,d)=k$ un 
$\mbox{LKD}(a_1 - d, d) = k$. 

Šis ir apgalvojums par invariantu: 
lielākais kopīgais dalītājs progresijas loceklim 
un diferencei saglabājas. 



# <lo-sample/> BBK2012.P1.104

Skaitļu virkne $(a_i)$ tiek definēta šādi: 
$$a_1=19,\;a_2=90,\;a_{n+2}=a_n+a_{n+1},\;\mbox{ja}\;n=1,2,3,\ldots.$$
Atrast skaitļu $a_{1989}$ un $a_{1990}$ lielāko kopīgo dalītāju.


# Eiklīda algoritms

Piemērs, kā aprēķināt divu skaitļu lielāko 
kopīgo dalītāju. 


# Dalāmība ar atlikumu

**Apgalvojums:** Ja $a$ ir vesels skaitlis, bet $b$ ir naturāls skaitlis, 
tad var izteikt:
$$a = q\cdot b +r,\;\;\mbox{kur $0 \leq r < b$.}$$

$q \in \mathbb{Z}$ sauc par $a$ un $b$ dalījuma veselo daļu, 
bet $r$ sauc par *atlikumu*.  
Šādi izdalīt vienmēr var, jo skaitlim $b$ var pieskaitīt (vai atņemt)
$a$ tik daudzas reizes, lai rezultāts $r$ būtu viens no 
skaitļiem $\{ 0,1,\ldots,a-1 \}$. 


# Aritmētiskas progresijas atlikumi - 1

**Apgalvojums:** Ja $(a_k)$ ir aritmētiska progresija ar diferenci $d$, 
$m$ ir kaut kāds naturāls skaitlis, un $\mbox{LKD}(d,m)=1$, tad 
progresija $a_k$ pieņem visus iespējamos atlikumus, 
dalot ar $m$.   
Šādu atlikumu ir pavisam $m$: $\{ 0,1,\ldots,m-1 \}$. 

# Aritmētiskas progresijas atlikumi - 2

**Apgalvojums:** Ja $(a_k)$ ir aritmētiska progresija ar diferenci $d$, 
$m$ ir kaut kāds naturāls skaitlis, un $\mbox{LKD}(d,m)=K>1$, tad 
progresija $(a_k)$ pieņem $m/K$ dažādus atlikumus
dalot ar $m$.   



# <lo-sample/> BBK2012.P1.122

Cik daudz ir tādu naturālu skaitļu $n \leq 1983$, kuriem $3n+5$ 
dalās ar $7$?






# Ģeometriskas progresijas skolas kursā

* Progresijas $n$-tā locekļa formula
* Galīgas progresijas summas formula
* Bezgalīgas progresijas summas formula




# <lo-sample/> BBK2012.P1.52

Vai iespējams norādīt tādu galīgu skaitu ģeometrisko progresiju, 
kuru locekļi ir naturāli skaitļi, ka jebkurš naturāls skaitlis 
piederētu vismaz vienai progresijai?




# <lo-sample/> LV.NO.2004.8.2 

Ir zināms, ka skaitļa $2^{200}$ decimālajā pierakstā ir $61$ cipars. 
Cik daudziem no skaitļiem $2^1; 2^2; 2^3; \ldots; 2^{199}; 2^{200}$ 
decimālais pieraksts sākas ar ciparu $1$?



# Logaritmiskā skala

* Daži dabā sastopami lielumi 
(iedzīvotāju skaits dažādās valstīs; 
upju garums; balsotāju skaits 
balsošanas iecirkņos, utml.)
atšķiras par vairākām 
kārtām - simtiem vai tūkstošiem reižu. 
* Tie daudz vienmērīgāk izvietojas uz
"logaritmiskas skalas".

# Benforda sadalījums

Divnieka pakāpēm pirmie cipari 
nepieņem visas $9$ vērtības vienādi bieži. 



# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#9: Aritmētiskas un ģeometriskas progresijas</h1>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Pamatfakti](#section-1)</span>  
<span style="color:darkgreen">**(3) Aptauja**</span>  
<span>(4) [Tipisks piemērs](#section-3)</span>  
<span>(5) [Patstāvīgie uzdevumi](#section_4)</span>  
<span>(6) [Kopsavilkums](#section_5)</span>

</hgroup>


# Jautājums Nr.1

Dota aritmētiska progresija $(a_n)$ (TODO: Definēt pirmo locekli un 
diferenci.). Atrast, cik daudzi tās locekļi ir 
divciparu skaitļi.



# Jautājums Nr.2 

Dota aritmētiska progresija $(a_n)$ (TODO: Definēt pirmo locekli un 
diferenci.). Atrast, ar kādu ciparu var beigties 
tās locekļi. 

# Jautājums Nr.3

Dota aritmētiska progresija $(a_n)$ (TODO: Definēt pirmo locekli un 
diferenci.). Atrast, kādu atlikumu var dot tās locekļi, dalot ar $30$. 

# Jautājums Nr.4

Izteikt kā racionālas daļas:

1. $0.272727\ldots$
2. $0.123123123\ldots$




# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#9: Aritmētiskas un ģeometriskas progresijas</h1>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Pamatfakti](#section-1)</span>  
<span>(3) [Aptauja](#section-2)</span>  
<span style="color:darkgreen">**(4) Tipisks piemērs**</span>  
<span>(5) [Patstāvīgie uzdevumi](#section-4)</span>  
<span>(6) [Kopsavilkums](#section-5)</span>

</hgroup>



# <lo-sample/> LV.AO.2004.8.5

Virknē augošā kārtībā izrakstīti naturālie skaitļi no $1$ līdz $2004$ ieskaitot, 
katrs vienu reizi. Izsvītrojam no tās skaitļus, kas atrodas 
$1., 4., 7., 10., \ldots$ vietās. No palikušās virknes atkal
izsvītrojam skaitļus, kas tajā atrodas $1., 4., 7., \ldots$ vietās. 
Ar iegūto virkni rīkojamies tāpat, utt.,
kamēr paliek neizsvītrots viens skaitlis. Kurš tas ir?

# Ieteikumi

1. Novērtēt iterāciju skaitu
2. Uzrakstīt formulu (ar pareizu noapaļošanu jeb veselo daļu), kas parāda, kurš numurs paliek pirmais 
neizsvītrotais kārtējā iterācijā.




# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#9: Aritmētiskas un ģeometriskas progresijas</h1>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Pamatfakti](#section-1)</span>  
<span>(3) [Aptauja](#section-2)</span>  
<span>(4) [Tipisks piemērs](#section-3)</span>  
<span style="color:darkgreen">**(5) Patstāvīgie uzdevumi**</span>  
<span>(6) [Kopsavilkums](#section-5)</span>

</hgroup>




# <lo-sample/> BBK2012.P1.123

Cik daudz ir tādu naturālu skaitļu $n \leq 1000$, 
kuri nedalās ne ar $5$, ne ar $7$?

## Ieteikums: Ieslēgšanas-izslēgšanas princips

* Uzzīmēt Eilera-Venna diagrammu, kurā redzami 
skaitļi, kas dalās ar $5$, dalās ar $7$, dalās ar abiem 
(t.i. ar $35$). 
* Novērtēt locekļu skaitu $\mathbb{N}$ 
sākumintervālā $[1;1000]$





# <lo-sample/> LV.AO.2004.7.3

Kādam mazākajam naturālajam $n$ visas daļas
$$\frac{5}{n+7}, \frac{6}{n+8}, \frac{7}{n+9}, \ldots, \frac{35}{n+37}, \frac{36}{n+38}$$
ir nesaīsināmas?


# <lo-sample/> LV.NO.2008.7.1 

Kurus naturālos skaitļus $n$ var izsacīt formā 
$n=\frac{x}{y}$, kur $x = a^3$, 
$y = b^4$, $a$ un $b$ - naturāli skaitļi? 



# &nbsp;

<hgroup>

<h1 style="font-size:32pt">#9: Aritmētiskas un ģeometriskas progresijas</h1>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Pamatfakti](#section-1)</span>  
<span>(3) [Aptauja](#section-2)</span>  
<span>(4) [Tipisks piemērs](#section-3)</span>  
<span>(5) [Patstāvīgie uzdevumi](#section-4)</span>  
<span style="color:darkgreen">**(6) Kopsavilkums**</span>

</hgroup>


# Ko darījām šajā nodarbībā?

* Atkārtojām skolas formulas aritm. un ģeom. progresijām
* Izteicām progresijas locekļu skaitu intervālā ar veselo 
daļu: $\lfloor n/d \rfloor$
* Prognozējām, kādus atlikumus dod progresijas locekļi,
dalot ar fiksētu skaitli $m$
* Izmantojām Bezū lemmu, izsakot LKD kā lineāru 
izteiksmju starpību.
* Pārveidojām atkārtojumus decimālpierakstā par 
ģeometrisku progresiju.
* Prognozējām ciparu skaitu pakāpēs un citās 
ģeometriskās progresijās.

