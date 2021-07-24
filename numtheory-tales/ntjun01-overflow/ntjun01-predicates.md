-----

# &nbsp;

<hgroup>

<h1 style="font-size:32pt">Skaitļu teorija:<br/>
NMS Juniori</h1>


<blue>Pirmskaitļi un dalāmība</blue>


</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Dalāmība un dalīšana](#section-1)</span>  
<span>(3) [Dalītāju skaits](#section-2)</span>  
<span>(4) [Pirmskaitļu izvietojums](#section-3)</span>  
<span>(5) [Mersena un Fermā skaitļi](#section-4)</span>  
<span>(6) [Aritmētikas pamatteorēma](#section-5)</span>  
<span>(7) [LKD un MKD](#section-6)</span>  
<span style="color:darkgreen">**(8) Kvantoru pieraksts**</span>  
<span>(9) [Tipisks piemērs](#section-8)</span>  
<span>(10) [Mājasdarba uzdevumi](#section-9)</span>  
<span>(11) [Kopsavilkums](#section-10)</span>


</hgroup>



<!--

Ja viens dalītājs lielāks par sqrt(n), tad citi noteikti ir mazāki par sqrt(n). 

Ģeometriska progresija - galīgas summas formula

Vidējais aritmētiskais/vidējais ģeometriskais



-->


-----

# <lo-theory/> Predikāti

<div style="font-size:70%">

Skaitļu teorijas apgalvojumus var īsi pierakstīt ar 
predikātu loģikas formulām. Šīs formulas sastāv no divām daļām:   
(1) "predikāta" - izteikuma, kurā ietilpst parametri,  
(2) viena vai vairākiem "kvantoriem" (vai apgalvojums
attiecas uz kaut kādu parametra vērtību, vai arī - uz visām parametra
iespējamām vērtībām).

**Definīcija:** Par <emblue>predikātu</emblue> sauc tādu apgalvojumu, kura patiesums var 
būt atkarīgs no mainīgo vērtībām. 

* $a \mid b$ ir predikāts, kas definēts pie $a,b \in \mathbb{N}$ (dažreiz dalās, citreiz nedalās)
* $\text{mirstīgs}(x)$ ir predikāts, kas definēts, ja $x$ pieder cilvēku kopai.  
(Tā kā visi cilvēki ir mirstīgi, tad vērtība ir konstante `True`.)

</div>


--

## <lo-theory/> Universālais kvantors

<div style="font-size:70%">

**Definīcija:** 
Pieraksts $(\forall a \in A)(P(a))$ apgalvo, ka predikāts $P(a)$ ir 
spēkā visiem $a \in A$. 
Izteiksmes daļu $(\forall a \in A)$ sauc par 
<emblue>*universālo kvantoru*</emblue> (*universal quantifier*) 
mainīgajam $a$. 

Ja $P(a,b)$ ir predikāts ar diviem mainīgajiem, tad 
pieraksts $(\forall a \in A)(P(a,b))$ ir apgalvojums, kura 
patiesums atkarīgs tikai no parametra $b$. Parametrs $a$ formulā joprojām 
ietilpst, bet tas ir "saistīts" mainīgais - tas (līdzīgi kā indekss `i` programmēšanas
ciklā) pārskrien visas iespējamās vērtības $a \in A$. 

* $(\forall c \in C)(\text{mirstīgs}(c))$ ir patiess, ja $C$ ir visu cilvēku kopa.
* $(\forall n \in \mathbb{N})\left( (2n+1)^2 \equiv 1\,(\text{mod}\;8) \right)$ ir patiess, 
jo visu nepāru skaitļu kvadrāti $(2n+1)^2$ tiešām dod atlikumu $1$, dalot ar $8$.
* $(\forall n \in \mathbb{N})(a\,\mid\,n)$ ir patiess apgalvojums tad, 
ja $a=1$ ($1$ ir jebkura naturāla skaitļa dalītājs), bet aplams, ja $a=2$,
jo visi $n \in \mathbb{N}$ nav pāra skaitļi.

</div>


--

## <lo-theory/> Eksistences kvantors

**Definīcija:** 
Pieraksts $(\exists a \in A)(P(a))$ apgalvo, ka predikāts $P(a)$ ir 
spēkā vismaz vienai vērtībai $a \in A$. 
Izteiksmes daļu $(\exists a \in A)$ sauc par 
<emblue>eksistences kvantoru</emblue> (*existential quantifier*) 
mainīgajam $a$. 

**Piemērs:** Naturālu skaitļu virkni $a_1,a_2,\ldots$ sauc par ierobežotu, ja
$$(\exists M \in \mathbb{N})(\forall n \in \mathbb{N})(a_n \leq M).$$ 
Saki: Eksistē naturāls $M$ (virknes augšējā robeža), ka visiem $n$ 
$a_n$ nepārsniedz $M$.


--

## <lo-theory/> Kopu apzīmējumi

<div style="font-size:70%">

Var ieviest arī pierakstu kopām, kas definēta ar predikātu.

**Piemērs:** Skaitlis $p$ ir pirmskaitlis, ja izpildās: 

$$(\forall n \in \mathbb{N})\left( 1 < n < p\,\Rightarrow\, p \not\equiv 0\,(\text{mod}\;n) \right).$$
**Saki:** Visiem naturāliem $n$, ja $n$ ir starp $1$ un $p$, tad $p$ nedalās ar $n$ bez atlikuma.

Tālāk definējam $\mathbb{P}$ - visu pirmskaitļu kopu. 

$$\mathbb{P} = \left\{ p \in \mathbb{N}\,\mid\, \color{#F00}{(\forall n \in \mathbb{N})\left( 1 < n < p\,\Rightarrow\, p \not\equiv 0\,(\text{mod}\;n) \right)} \right\}.$$
**Saki:** $\mathbb{P}$ ir visu tādu naturālo $p$ kopa, ka - 
visiem naturāliem $n$, ja $n$ ir starp $1$ un $p$, tad $p$ nedalās ar $n$ bez atlikuma.

</div>


--

## <lo-summary/> Tēvu kopa

Definējam apzīmējumu: $\text{hasFather(x,y)}$ ir predikāts, kas apgalvo, 
ka $x$'am ir tēvs $y$. Šeit $x,y \in C$, kur $C$ - visu jebkad dzīvojušo 
cilvēku kopa.

Pārtulkosim par latviski šādas predikātu loģikas formulas:

* $(\forall x \in C)(\exists y \in C)(\text{hasFather}(x,y))$.
* $(\forall y \in C)(\exists x \in C)(\text{hasFather}(x,y))$.
* $(\exists y \in C)(\forall x \in C)(\text{hasFather}(x,y))$.


-----

# <lo-sample/> NT.JUN01.5

<div style="font-size:70%">

**Uzdevums:** Nerisinot pašu uzdevumu, pierakstīt uzdevumā meklējamo kopu šādi: 
$$\{ a_0 \in \mathbb{N}\,\mid\,\color{#F00}{\ldots\;\ldots\;\ldots} \}.$$

> **IMO.2017.1:** Katram veselam skaitlim $a_0 > 1$, 
> definē virkni $a_0, a_1, a_2, \ldots$ visiem $n \geq 0$ ar šādu vienādību
> $$a_{n+1} = 
> \begin{cases}
> \sqrt{a_n} & \text{ja } \sqrt{a_n} \text{ ir vesels,} \\
> a_n + 3 & \text{citos gadījumos.}
> \end{cases}$$
> Noteikt visas tās $a_0$ vērtības, kurām eksistē 
> skaitlis $A$, ka $a_n = A$ bezgalīgi daudzām $n$ vērtībām. 

*Piezīme:* Virkne $a_n$ jau ir definēta; jāraksta predikātu izteiksme, 
kurā apzīmējumu $a_n$ drīkst izmantot. 

</div>


--

## <lo-soln/> NT.JUN01.5

$$\{ a_0 \in \mathbb{N}\,\mid\,\color{#F00}{ (\exists A \in \mathbb{N} )(\forall M \in \mathbb{N})(\exists m \in \mathbb{N}) }$$
$$\color{#F00}{n > M \;\text{&}\;a_n = A) }\;\}.$$
**Saki:** Visu to naturālo $a_0$ kopa, kuriem eksistē tāds naturāls $A$, 
ka jebkuram (t.i. cik patīk lielam) naturālam $M$ atradīsies $n$, ka $n>M$ un $a_n = A$. 

Ar kvantoriem var pierakstīt izteikumu "eksistē bezgalīgi daudzi $a_n$, kam ...".  
Virknītes no $3$ vai vairāk kvantoriem, kuri turklāt mijas ($\exists\forall\exists$ - sk. augstāk), 
parasti norāda uz vajadzību rūpīgāk izlasīt un saprast uzdevuma nosacījumu.

Note:

Sarežģītību nosaka nevis pats kvantoru skaits, bet tas, cik reizes
tie pārslēdzas uz pretējo. Piemēram, kvantoru virknīte 
($\exists\forall\exists$) norāda uz lielāku sarežģītību nekā $(\forall\forall\forall)$
vai ($\exists\exists\exists$).



