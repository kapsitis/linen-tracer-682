# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Asimetriska kriptogrāfija</blue>

</hgroup><hgroup>

<span style="color:darkgreen">**(1) Ievads**</span>  
<span>(2) [Simetriska šifrēšana](#section-1)</span>  
<span>(3) [Asimetriska šifrēšana](#section-2)</span>  
<span>(4) [RSA algoritmi](#section-3)</span>  
<span>(5) [Par skaitļu teoriju](#section-4)</span>  
<span>(6) [Difī-Helmana atslēgu apmaiņa](#section-5)</span>  
<span>(7) [PGP programmatūra](#section-6)</span>  
<span>(8) [(P) Epastu drošība](#section-7)</span>  
<span>(9) [Kopsavilkums](#section-8)</span>

</hgroup>



# <lo-why/> why

<div class="bigWhy">

Kāpēc dažādi drošas komunikācijas uzdevumi noved pie līdzīgām 
veselu skaitļu manipulācijām?

</div>
<div class="smallWhy">

* Simetrisku atslēgu apmaiņa ar asimetriskām atslēgām. 
* Digitāli paraksti, to nenoliedzamība.
* Digitālu sertifikātu apstiprināšana (Certificate Authorities)

</div>









# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Asimetriska kriptogrāfija</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span style="color:darkgreen">**(2) Simetriska šifrēšana**</span>  
<span>(3) [Asimetriska šifrēšana](#section-2)</span>  
<span>(4) [RSA algoritmi](#section-3)</span>  
<span>(5) [Par skaitļu teoriju](#section-4)</span>  
<span>(6) [Difī-Helmana atslēgu apmaiņa](#section-5)</span>  
<span>(7) [PGP programmatūra](#section-6)</span>  
<span>(8) [(P) Epastu drošība](#section-7)</span>  
<span>(9) [Kopsavilkums](#section-8)</span>

</hgroup>



# <lo-theory/> Kriptoloģijas apakštēmas

* Kriptogrāfija un kriptoanalīze ir pretējas nodarbes (kopīgā nozare ir kriptoloģija). 

![Cryptography subparts](cryptography-subparts.png) 




## <lo-summary/> Vienreiz lietojamās atslēgas

<div style="font-size:70%">

* "One-time pad" - ļoti ātrs un neatšifrējams, bet tajā ir garas atslēgas.
* Vajadzīgs nejaušo skaitļu ģenerators; garas atslēgas grūti pārraidīt.
* Pseidonejaušu skaitļu ģeneratori bieži ir apšaubāmi.

$$ \left\{ \begin{array}{l}
s_0 = 12345\\
s_{i+1} = 1103515245s_i + 12345\;(\text{mod}\,2^{31})
\end{array} \right.
$$

![Dilbert](you-can-never-be-sure-gilbert-comic.jpg)  
<small>(c) [Dilbert.com](https://dilbert.com/strip/2001-10-25)</small>

</div>


# <lo-summary/> AES: Pazīstamākais simetriskais šifrs

* AES (*Advanced Encryption Standard*) ap 2002.g. tika izraudzīts 
kā standarts ASV valdības dokumentu (tostarp konfidenciālo) 
drošai pārraidei. To ieviesa US National Institute of Standards and Technology (NIST). 
* AES ir bloku šifrs - visi šifrējamie bloki ir 128 bitus gari; 
* AES atslēgas var būt 128, 192, 256 bitus garas.




# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Asimetriska kriptogrāfija</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Simetriska šifrēšana](#section-1)</span>  
<span style="color:darkgreen">**(3) Asimetriska šifrēšana**</span>  
<span>(4) [RSA algoritmi](#section-3)</span>  
<span>(5) [Par skaitļu teoriju](#section-4)</span>  
<span>(6) [Difī-Helmana atslēgu apmaiņa](#section-5)</span>  
<span>(7) [PGP programmatūra](#section-6)</span>  
<span>(8) [(P) Epastu drošība](#section-7)</span>  
<span>(9) [Kopsavilkums](#section-8)</span>

</hgroup>





# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Asimetriska kriptogrāfija</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Simetriska šifrēšana](#section-1)</span>  
<span>(3) [Asimetriska šifrēšana](#section-2)</span>  
<span style="color:darkgreen">**(4) RSA algoritmi**</span>  
<span>(5) [Par skaitļu teoriju](#section-4)</span>  
<span>(6) [Difī-Helmana atslēgu apmaiņa](#section-5)</span>  
<span>(7) [PGP programmatūra](#section-6)</span>  
<span>(8) [(P) Epastu drošība](#section-7)</span>  
<span>(9) [Kopsavilkums](#section-8)</span>

</hgroup>



# <lo-summary/> RSA pamatideja

* Eksistē efektīvi algoritmi (polinomiālā laikā no skaitļa 
pieraksta garuma), kas noskaidro, vai skaitlis ir pirmskaitlis. 
* Pirmskaitļu blīvums (to skaits pietiekami garos intervālos, dalot 
ar intervāla garumu) dilst ļoti lēni - kā funkcija $\frac{1}{\ln x}$.  
Ir, teiksim, 0.43% varbūtība, ka nejauši izraudzīts 100-ciparu skaitlis
izrādīsies pirmskaitlis. 
* BET neeksistē efektīvs algoritms lielu skaitļu faktorizācijai. 



## <lo-summary/> RSA atslēgu izveidošana

<hgroup>

**Publiskā informācija:**

* Bobs vēlas no Alises (un arī daudziem citiem) saņemt
šifrētas ziņas. Viņš veido "publisko sertifikātu":
    - Izziņo divu ļoti lielu pirmskaitļu 
reizinājumu $n = p \cdot q$ (bet ne pašus pirmskaitļus).
    - Izziņo "publisko kāpinātāju" $e$, 
kurš nedalās ne ar $p$, ne ar $q$.

</hgroup>
<hgroup>

**Privātā informācija:** 

* Bobam, lai atšifrētu, ir arī "privātais sertifikāts":
    - Atrod $\varphi(n) = (p-1)(q-1)$ - skaitļu 
skaits no $1$ līdz $n-1$, kas ir savstarpēji pirmskaitļi ar $n$ 
(kas nedalās ne ar $p$, ne ar $q$).
    - Atrod "privāto kāpinātāju $d$, kuram ir spēkā:
$$e \cdot d \equiv 1\;(\text{mod}\,\varphi(n)).$$

</hgroup>


# <lo-summary/> Protokols

1. 




# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Asimetriska kriptogrāfija</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Simetriska šifrēšana](#section-1)</span>  
<span>(3) [Asimetriska šifrēšana](#section-2)</span>  
<span>(4) [RSA algoritmi](#section-3)</span>  
<span style="color:darkgreen">**(5) Par skaitļu teoriju**</span>  
<span>(6) [Difī-Helmana atslēgu apmaiņa](#section-5)</span>  
<span>(7) [PGP programmatūra](#section-6)</span>  
<span>(8) [(P) Epastu drošība](#section-7)</span>  
<span>(9) [Kopsavilkums](#section-8)</span>

</hgroup>




# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Asimetriska kriptogrāfija</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Simetriska šifrēšana](#section-1)</span>  
<span>(3) [Asimetriska šifrēšana](#section-2)</span>  
<span>(4) [RSA algoritmi](#section-3)</span>  
<span>(5) [Par skaitļu teoriju](#section-4)</span>  
<span style="color:darkgreen">**(6) Difī-Helmana atslēgu apmaiņa**</span>  
<span>(7) [PGP programmatūra](#section-6)</span>  
<span>(8) [(P) Epastu drošība](#section-7)</span>  
<span>(9) [Kopsavilkums](#section-8)</span>

</hgroup>





# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Asimetriska kriptogrāfija</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Simetriska šifrēšana](#section-1)</span>  
<span>(3) [Asimetriska šifrēšana](#section-2)</span>  
<span>(4) [RSA algoritmi](#section-3)</span>  
<span>(5) [Par skaitļu teoriju](#section-4)</span>  
<span>(6) [Difī-Helmana atslēgu apmaiņa](#section-5)</span>  
<span style="color:darkgreen">**(7) PGP programmatūra**</span>  
<span>(8) [(P) Epastu drošība](#section-7)</span>  
<span>(9) [Kopsavilkums](#section-8)</span>

</hgroup>


# <lo-theory/> PGP vēsture

* Fils Cimermans (*Phil Zimmermann*), 1991.gads. 
* OpenPGP standarts
* Šifrē epastu saturu (nevis SMTP hederus!), 
var izmantot citiem failiem, ko glabā nedrošās vietās - 
uz mobilām ierīcēm vai mākonī.


## <lo-theory/> PGP programmatūra

* PGP spraudņi
* Ciphermail u.c. epasta vārtejas, kuras pielieto 
PGP šifrēšanu, izmantojot sūtītāja atslēgu.


## <lo-theory/> Atslēgu pāra ģenerēšana 

* Kā lietotājs var izveidot privātas/publiskas atslēgas pāri
* Kā manuāli eksportēt un importēt šādas atslēgas


# <lo-theory/> PKI un "Web of trust"

* Atslēgu apmaiņai jābūt mērogojamai
* PKI veido hierarhiju, sākot ar "Saknes sertifikātu", 
ar kuru paraksta zemāku līmeņu sertifikātus u.c.
* "Web of trust" nozīmē transitīvu uzticēšanos: 
Ja $A$ uzticas $B$ sertifikātiem, tad $A$ uzticas arī
sertifikātiem, kuriem uzticas $B$. 




# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Asimetriska kriptogrāfija</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Simetriska šifrēšana](#section-1)</span>  
<span>(3) [Asimetriska šifrēšana](#section-2)</span>  
<span>(4) [RSA algoritmi](#section-3)</span>  
<span>(5) [Par skaitļu teoriju](#section-4)</span>  
<span>(6) [Difī-Helmana atslēgu apmaiņa](#section-5)</span>  
<span>(7) [PGP programmatūra](#section-6)</span>  
<span style="color:darkgreen">**(8) (P) Epastu drošība**</span>  
<span>(9) [Kopsavilkums](#section-8)</span>

</hgroup>


# <lo-theory/> Epastu infrastruktūra

<hgroup>

TODO: Attēls ar pamata topoloģiju

</hgroup>
<hgroup>

* MUA (*Mail User Agent*) jeb klienta epasta 
programma.
* MDA (*Mail Delivery Agent*) jeb epasta serveris.
* MTA (*Mail Transfer Agent*) jeb epasta maršrutētājs.

Atšķirībā no HTTP, SMTP ieejošās un izejošās epastu ķēdītes var
būt pilnīgi atšķirīgas un savstarpēji nesaistītas.
Biežas situācijas, kad domēna izsūtīšanas adrese(s) ir pavisam citas
nekā saņemšanas adrese(s).

</hgroup>


## <lo-theory/> 



## <lo-theory/> Epastu vārtejas

<hgroup>

TODO: Attēls ar 4 virzieniem

</hgroup>
<hgroup>

Epasta 4 virzieni

* Iekšējs (no aizsargāta domēna uz to pašu vai citu aizsargātu)
* Ienākošs (no neaizsargāta domēna uz aizsargātu)
* Izejošs (no aizsargāta domēna uz neaizsargātu)
* "Atvērtais relejs" (abi domēni neaizsargāti - šim 
virzienam jābūt aizliegtam!)

</hgroup>


## <lo-summary/> SMTP pieprasījumi

TODO: Attēls ar SMTP hederiem un 
vēstules satura paraugu.


# 



# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Asimetriska kriptogrāfija</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Simetriska šifrēšana](#section-1)</span>  
<span>(3) [Asimetriska šifrēšana](#section-2)</span>  
<span>(4) [RSA algoritmi](#section-3)</span>  
<span>(5) [Par skaitļu teoriju](#section-4)</span>  
<span>(6) [Difī-Helmana atslēgu apmaiņa](#section-5)</span>  
<span>(7) [PGP programmatūra](#section-6)</span>  
<span>(8) [(P) Epastu drošība](#section-7)</span>  
<span style="color:darkgreen">**(9) Kopsavilkums**</span>

</hgroup>










