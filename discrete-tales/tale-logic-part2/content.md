# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Discrete Structures</h1>

<blue>Logic and Proofs - 2   
(Predicate Logic)</blue>

</hgroup><hgroup style="font-size:90%">

<span style="color:darkgreen">**(1) 1st Order Logic Intro**</span>  
<span>(2) [APA Style and LaTeX](#section-1)</span>  
<span>(3) [Statements and Propositions](#section-2)</span>  
<span>(4) [Boolean Operations](#section-3)</span>  
<span>(5) [Rules of Reasoning](#section-4)</span>  
<span>(6) [Truth Tables](#section-5)</span>  
<span>(7) [Some Proof Techniques](#section-6)</span>  
<span>(8) [Proposition Handling in Coq](#section-7)</span>  
<span>(9) [References](#section-7)</span>

</hgroup>



# <lo-why/> why

<div class="bigWhy">
Why use symbols $\forall$ and $\exists$?
</div>

<div class="smallWhy">

* 

</div>

 
# <lo-summary/> Objectives

1. Mention examples where logic differs from general intuition.
2. Define predicates and quantifiers.
3. Define terms, atomic formulas, full formulas.
4. Translate English into formulas, draw the formula syntax.
5. Introduce some logical arguments and syllogisms.









# <lo-theory/> Predikāti

<div style="font-size:70%">

Skaitļu teorijas apgalvojumus var īsi pierakstīt ar 
predikātu loģikas formulām. Šīs formulas sastāv no divām daļām:   
(1) "predikāta" - izteikuma, kurā ietilpst parametri,  
(2) viena vai vairākiem "kvantoriem" (vai apgalvojums
attiecas uz kaut kādu parametra vērtību, vai arī - uz visām parametra
iespējamām vērtībām).

**Definīcija:** Par <blue>*predikātu*</blue> sauc tādu apgalvojumu, kura patiesums var 
būt atkarīgs no mainīgo vērtībām. 

* $a \mid b$ ir predikāts, kas definēts pie $a,b \in \mathbb{N}$ (dažreiz dalās, citreiz nedalās)
* $\text{mirstīgs}(x)$ ir predikāts, kas definēts, ja $x$ pieder cilvēku kopai.  
(Tā kā visi cilvēki ir mirstīgi, tad vērtība ir konstante `True`.)

</div>


## <lo-theory/> Universālais kvantors

<div style="font-size:70%">

**Definīcija:** 
Pieraksts $(\forall a \in A)(P(a))$ apgalvo, ka predikāts $P(a)$ ir 
spēkā visiem $a \in A$. 
Izteiksmes daļu $(\forall a \in A)$ sauc par 
<blue>**universālo kvantoru**</blue> (*universal quantifier*) 
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

## <lo-theory/> Eksistences kvantors

**Definīcija:** 
Pieraksts $(\exists a \in A)(P(a))$ apgalvo, ka predikāts $P(a)$ ir 
spēkā vismaz vienai vērtībai $a \in A$. 
Izteiksmes daļu $(\exists a \in A)$ sauc par 
<blue>**eksistences kvantoru**</blue> (*existential quantifier*) 
mainīgajam $a$.

**Piemērs:** Naturālu skaitļu virkni $a_1,a_2,\ldots$ sauc par ierobežotu, ja
$$(\exists M \in \mathbb{N})(\forall n \in \mathbb{N})(a_n \leq M).$$ 
Saki: Eksistē naturāls $M$ (virknes augšējā robeža), ka visiem $n$ 
$a_n$ nepārsniedz $M$.


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

## <lo-summary/> Relation isFatherOf(x,y)

**Definition:** Predicate $\mathit{isFatherOf(x,y)}$ is defined for pairs of humans:
$$\mathit{isFatherOf}\,:\,H \times H \rightarrow \{ \mathtt{true}, \mathtt{false} \}.$$
It is true, if and only if $x$ is the father of $y$ (otherwise it is false). 

Express the following in a human language:

* $(\forall y \in H)(\exists x \in H)(\text{isFatherOf}(x,y))$.
* $(\exists x \in H)(\forall y \in H)(\text{isFatherOf}(x,y))$.









<!--
https://www.youtube.com/watch?v=U2BtteA0k8o

Everybody Loves My Baby (But My Baby Don't Love Nobody But Me)

foreach x, L(x,MyBaby) /\ foreach y (~ (y = Me) -> ~(L(MyBaby,y))


https://learning.oreilly.com/library/view/logic-as-a/9781118880005/c04.xhtml

-->








# <lo-summary/> What we covered in this class

1. Aprakstījām ziņojumus un to alfabētus
2. Atšķīrām bezzudumu/zudumradošo saspiešanu
3. Pamatojām, ka lielo vairumu ziņojumu dotajā alfabētā saspiest nevar
4. Aprakstījām prefiksu kokus
5. Aprakstījām un analizējām Hafmana algoritmu
6. Definējām un lietojām entropiju kā "visvairāk saspiestās" 
informācijas garumu.




# <lo-yellow/> Euclid Online

![Euclid's Elements](euclid.png)

[*See Byrne's Euclid*](https://www.c82.net/euclid/)


# <lo-yellow/> Thomas Aquinas: Summa Theologica




# <lo-yellow/> Tangrams

<hgroup>

![Set of Tangrams](tangram-set.jpg)

</hgroup>
<hgroup style="font-size:70%">

* Tangram, 七巧板 (qīqiǎobǎn) = 7-puzle. 
* **Problem:** Given the outline of some shape, create it with the shapes without
any overlaps. Around 6500 "classical" exercises from the 19th century books.
* Known in China since Song dynasty (960–1279). 
Known in Europe since around 1815 - global trade, cheap printing techniques. 
* Convex shapes? Axial symmetries? Central symmetries? 
* [More on Tangram](https://en.wikipedia.org/wiki/Tangram)

</hgroup>



# <lo-yellow/> Game of 15

<hgroup style="font-size:70%">

![Game of 15](game-of-15.jpg)

</hgroup>
<hgroup style="font-size:70%">


* The 15 Puzzle, since 1880. 
* 


# <lo-yellow/> Puzzle - 8 Queen Problem

<hgroup style="font-size:70%">

* Place 


</hgroup>





