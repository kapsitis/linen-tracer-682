# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Bezzudumu saspiešana - 2</blue>

</hgroup><hgroup>

<span style="color:darkgreen">**(1) Ievads**</span>  
<span>(2) [Entropijas atkārtojums](#section-1)</span>  
<span>(3) [Hafmana optimalitāte](#section-2)</span>  
<span>(4) [Hafmana modifikācijas](#section-3)</span>  
<span>(5) [Aritmētiskā saspiešana](#section-4)</span>  
<span>(6) [LZ78 algoritms](#section-5)</span>  
<span>(7) [(P) Proprietāri formāti](#section-6)</span>  
<span>(8) [Kopsavilkums](#section-7)</span>

</hgroup>


<!--
https://en.wikipedia.org/wiki/Asymmetric_numeral_systems

Aplūkot šīs ANS kā iespēju paātrināt saspiešanu "entropijas kodiem"


PSEUDO_EOF - Hafmana kods var beigties baita vidū. Parasti pievieno īpašu simbolu (teksta beigu marķieri), 
lai saprastu, kad atkodēšana jāpārtrauc. 
https://web.stanford.edu/class/archive/cs/cs106b/cs106b.1172/assn/huffman.html


--> 




# <lo-why/> why

<div class="bigWhy">
Kāpēc (nav) jāspiež simboli pa vienam? 
</div>

<div class="smallWhy">

* Kāpēc Hafmana algoritms ir optimāls, bet tīrā veidā maz izmantots?
* Kāpēc var izmantot teksta fragmentu atkārtošanos?
* Kāpēc Lempela Ziva algoritmi var uzlabot Hafmana saspiešanu un 
kļuvuši par industrijas standartu?

</div>


 
## <lo-theory/> Sasniedzamie rezultāti

1. Identificēt Hafmaņa algoritma praktiskus ierobežojumus.
2. Pamatot optimālā kodējuma saistību ar entropiju. 
3. Saprast un lietot aritmētiskās saspiešanas algoritmu. 
4. Saprast un lietot Lempela-Ziva (LZ78) algoritmu. 





# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Bezzudumu saspiešana - 2</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span style="color:darkgreen">**(2) Entropijas atkārtojums**</span>  
<span>(3) [Hafmana optimalitāte](#section-2)</span>  
<span>(4) [Hafmana modifikācijas](#section-3)</span>  
<span>(5) [Aritmētiskā saspiešana](#section-4)</span>  
<span>(6) [LZ78 algoritms](#section-5)</span>  
<span>(7) [(P) Proprietāri formāti](#section-6)</span>  
<span>(8) [Kopsavilkums](#section-7)</span>

</hgroup>


# <lo-theory/> Šenona informācijas saturs

**Definīcija** (*Shannon information content*): 
Gadījumlieluma $S$ iznākumam $x_i \in S$ informācijas saturu 
izsaka logaritms ar bāzi $2$ no apgrieztā skaitļa varbūtībai, ka iestājas
šis iznākums $s_i$: 
$$h(x_i) = \log_2 \frac{1}{p(x = x_i)}.$$

<blue>*Entropiju*</blue> visam gadījumlielumam $S$ apraksta visu iespējamo informācijas
saturu *paredzamā vērtība* (*expected value*):

$$H(S)= \sum\limits_{x_i \in S} p(x = x_i) \log_2 \frac{1}{p(x = x_i)}.$$


## <lo-theory/> Negodīga monēta

<hgroup>

![Info content](info-content.png)

</hgroup>
<hgroup>

* Ja varbūtības diviem monētas mešanas iznākumiem ir 
attiecīgi $0.9$ un $0.1$, tad pirmajam iznākumam informācijas
saturs ir $0.152$, bet otrajam $3.32$. 
* Informācijas saturu un entropiju
izsaka "bitos" (datoru arhitektūrā arī ir
biti, bet tie ir reāli biti, kamēr entropijā izsaka 
"perfekti saspiestas" informācijas bitus).

</hgroup>

## <lo-theory/> Entropija 2 iznākumiem

<hgroup>

![Entropijas grafiks](entropy-graph.png)

</hgroup>
<hgroup>

* Vislielākā entropija jeb nenoteiktība ir tad, ja 
2 iznākumu gadījumlielums ir ar divām vienādām varbūtībām. 
* Ja veic Bernulli eksperimentu sēriju - met godīgu monētu, 
tad katrā eksperimentā rodas "Šenona informācijas saturs", 
kas ir tieši $1$ bits.

</hgroup>

## <lo-theory/> Info saturs 2 ziņojumiem

Ja kāds nosūta divus ziņojumus (jeb alfabēta simbolus) $x_1$ un 
$x_2$, kas ir neatkarīgi kā gadījuma lielumi, tad to 
secības entropija ir abu viņu entropijas summa $h(x_1x_2) = h(x_1) + h(x_2)$


## <lo-theory/> Šenona (neformāls) apgalvojums

**Apgalvojums:** Ja nosūtām ziņojumu $x$ no iespējamo ziņojumu 
alfabēta $S$, tad $h(x)$ ir vislabākais (saspiestā) ziņojuma faila izmērs bitos, 
uz kuru varam tiekties. 

Kāpēc entropiju nevar pārsniegt? Intuitīvi: Ja mums ir ziņojumi $x_i$ ar varbūtībām 
$p_i$, tad katrs no tiem aizņem kaut kādu gabalu no 
"kodu telpas". Piemēram, ja tā kodēšanai izmanto $4$ bitus, tad tas aizņem 
$1/16$. 



# <lo-sample/> 12 monētas

**Uzdevums:** Dotas $12$ monētas, no kurām visām ir vienādas masas, 
izņemot vienu, kura ir vai nu vieglāka, vai nu smagāka nekā citas.   
Ar kādu mazāko svēršanu skaitu var noskaidrot, vai tā ir vieglāka
vai smagāka kā arī atrast šo monētu?


## <lo-summary/> Uzdevuma sarežģītības analīze

* Cik svēršanas būtu nepieciešamas, ja jau zinām atbildi un mums tā 
jāpierāda, piemēram, tiesas ekspertīzē?  
<blue>*Nedeterministiskie algoritmi*</blue> (non-deterministic algorithms). 
* Cik svēršanas nepieciešamas deterministiskam algoritmam? 
Pamatojums ar variantu saskaitīšanu un Dirihlē principu?


## <lo-summary/> Pirmais solis

Cik pret cik svērt vispirms? Rēķinām entropiju (vidējo 
sagaidāmo Šenona informācijas saturu no 1.svēršanas):

<table>
<tr><th>Svēršana</th><th>Rezultātu varbūtības</th><th>Entropija (biti)</th></tr>
<tr><td>$6$ pret $6$</td><td>$p(\text{L},\text{Eq},\text{R})=(1/2,0,1/2)$</td><td>$1$</td></tr>
<tr><td>$5$ pret $5$</td><td>$p(\text{L},\text{Eq},\text{R})=(5/12,1/6,5/12)$</td><td>$1.483356$</td></tr>
<tr><td>$4$ pret $4$</td><td>$p(\text{L},\text{Eq},\text{R})=(1/3,1/3,1/3)$</td><td><red>$1.584963$</red></td></tr>
<tr><td>$3$ pret $3$</td><td>$p(\text{L},\text{Eq},\text{R})=(1/4,1/2,1/4)$</td><td>$1.5$</td></tr>
<tr><td>$2$ pret $2$</td><td>$p(\text{L},\text{Eq},\text{R})=(1/6,2/3,1/6)$</td><td>$1.251629$</td></tr>
<tr><td>$1$ pret $1$</td><td>$p(\text{L},\text{Eq},\text{R})=(1/12,5/6,1/12)$</td><td>$0.8166891$</td></tr>
</table>




## <lo-summary/> Par entropiju divās situācijās

<hgroup>

**Situācija Nr.1** Ja jāsaspiež dati, to var vislabāk izdarīt tad, 
ja informācijas saturs ieejas ziņojumu virknē ir <blue>**minimāls**</blue> (to varbūtības ir 
ļoti dažādas, tie ir savstarpēji atkarīgi, veido prognozējamas virknītes - 
ko īpaši izmanto Lempela-Ziva un Berouza-Vīlera algoritmi).

</hgroup>
<hgroup>

**Situācija Nr.2** Ja kaut kas jāmeklē ar mazāko iespējamo svēršanu skaitu, 
tad vislabāk <blue>**maksimizēt**</blue> informācijas saturu, ko ceram saņemt 1 svēršanā. 
Vislabāk, ja svēršanas eksperimentu iznākumi 
ir ar līdzīgām varbūtībām. Sviras svariem ideāli:
${\displaystyle \left( \frac{1}{3},\frac{1}{3},\frac{1}{3} \right)}$. 

</hgroup>





# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Bezzudumu saspiešana - 2</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Entropijas atkārtojums](#section-1)</span>  
<span style="color:darkgreen">**(3) Hafmana optimalitāte**</span>  
<span>(4) [Hafmana modifikācijas](#section-3)</span>  
<span>(5) [Aritmētiskā saspiešana](#section-4)</span>  
<span>(6) [LZ78 algoritms](#section-5)</span>  
<span>(7) [(P) Proprietāri formāti](#section-6)</span>  
<span>(8) [Kopsavilkums](#section-7)</span>

</hgroup>

# <lo-theory/> Entropija kā saspiežamības robeža


**Teorēma:** Katrai ziņojumu kopai $S$ ar zināmu varbūtību sadalījumu 
un optimālu prefiksu kodējumu $C$:
$$\ell_a(C) \leq H(S) + 1.$$

**Sekas:** Tā kā Hafmana algoritms rada optimālo
(vai vienu no optimālajiem) prefiksu kodējumu - sal. 
[iepriekšējo nodarbību](../tale-algorithms-lossless-part1/content.html#/hafmana-koka-optimalitāte), tad 
arī Hafmana kodējumam $C^{\ast}$ ir spēkā: 
$$\ell_a(C^{\ast}) \leq H(S) + 1.$$




## <lo-theory/> Krafta-Makmilana nevienādība

**Teorēma:** (*Kraft-McMillan Inequality*) 
Dots prefiksu kods $C = \{ (x_1,w_1),\ldots,(x_n,w_n)\}$, tad
$$\sum\limits_{(x_i,w_i) \in C} 2^{-\ell(w_i)} \leq 1.$$

Un arī otrādi: Ja ir doti vairāki kodējumu garumi $l_i$, kas
apmierina $\sum 2^{-l_i} \leq 1$, tad no tiem var uzbūvēt
prefiksu koku, kur katram garumam $l_i$ atbilst lapa šajā kokā, kuras
dziļums ir tieši $l_i$. 


## <lo-theory/> Nevar kodēt labāk par entropiju

**Teorēma:** 
Katrai ziņojumu kopai $S$ ar zināmu varbūtību sadalījumu un 
viennozīmīgi atkodējamu kodējumu $C$ ir spēkā nevienādība:
$$H(S) \leq l_a(C).$$


## <lo-summary/> Pierādījums ar nevienādību ķēdīti

<!--
Katram ziņojumam $x \in S$ ar $\ell(s)$ apzīmējam $s$ kodavārda garumu 
(atbilstoši kodējumam $C$). 
-->

$$H(S) − \ell_a(C) = \sum\limits_{s \in S} p(s)  \log_2 \frac{1}{p(s)} - 
\sum\limits_{s \in S} p(s)\ell(s) =$$
$$= \sum\limits_{s \in S} p(s) \left( \log_2 \frac{1}{p(s)} - \log_2 2^{\ell(s)} \right) = $$
$$=\sum\limits_{s \in S} p(s) \log_2 \frac{ 2^{-\ell(s)}}{p(s)} \leq $$
$$ \leq \log_2 \sum_{s \in S} 2^{-\ell(s)} \leq 0.$$


## <lo-yellow/> Jensena nevienādība

Kādēļ ir spēkā nevienādība?
$$=\sum\limits_{s \in S} p(s) \log_2 \frac{ 2^{-\ell(s)}}{p(s)} \leq 
\log_2 \sum_{s \in S} 2^{-\ell(s)}$$

**Jensena nevienādība:** Dota $f(x) divreiz nepārtraukti diferencējama
funkcija intervālā $[a;b]$ un šajā intervālā $f''(x) \leq 0$, t.i. 
$f(x)$ grafiks ir izliekts uz augšu. 
Doti arī $n$ skaitļi $x_1,x_2,\ldots,x_n \in [a;b]$ un 
svari $p_1,p_2,\ldots,p_n$, kuru summa ir $1$. Tad ir spēkā nevienādība:

$$p_1f(x_1) + p_2f(x_2) + \ldots + p_nf(x_n) \leq f \left( p_1x_1 + \ldots p_nx_n \right).$$


# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Bezzudumu saspiešana - 2</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Entropijas atkārtojums](#section-1)</span>  
<span>(3) [Hafmana optimalitāte](#section-2)</span>  
<span style="color:darkgreen">**(4) Hafmana modifikācijas**</span>  
<span>(5) [Aritmētiskā saspiešana](#section-4)</span>  
<span>(6) [LZ78 algoritms](#section-5)</span>  
<span>(7) [(P) Proprietāri formāti](#section-6)</span>  
<span>(8) [Kopsavilkums](#section-7)</span>

</hgroup>




# <lo-theory/> Simbolu grupēšana

**Piemērs:** Negodīgās monētas alfabēts $S = \{ A,B \}$ ar varbūtībām
$p(A) = 0.9$ un $p(B) = 0.1$.

* Kodējot pa vienam simbolam, iegūstam vidējo koda garumu $\ell_a(C) = 1$, 
kaut arī entropija $H(S) = 0.4689956$. 

* Kodējot pa diviem simboliem: $T = \{ AA,AB,BA,BB \}$ ar 
varbūtībām $\{ 0.81, 0.09, 0.09,0.01 \}$, vidējais koda garums Hafmana
kodam ir 
$$\ell_a(C_2) = 1 \cdot 0.81 + 2\cdot 0.09 + 3\cdot 0.09 + 3 \cdot 0.01 = 1.29/2 = 0.645.$$


## <lo-theory/> Prediktīva kodēšana

* Parasti nevajag aplūkot pilnu Dekarta reizinājumu $S \times S$, ko 
veido **visi** iespējamie simbolu pārīši $(s_i,s_j)$, jo ne katri 
divi (vai trīs, četri, utt.) simboli mēdz atrasties blakus.
* Visu simbolu pāru kodēšana ir laba blēdīgajām monētām
(un to radītajai Bernulli eksperimentu virknei, kur 1 eksperimenta
sadalījums ir $\{ p, 1-p \}$). 
* Pirmais tuvinājums reāliem tekstiem ir *Markova ķēdes* (nākamā 
simbola varbūtības sadalījumu nosaka iepriekšējais simbols). 


## <lo-theory/>  "Trie" koki

<hgroup>

![Trie koks](trie-koks.png)

"Trie" ir koks, kura virsotnēs glabājas
simbolu virknes. Bērnu virsotnēs
virknes ir par vienu garākas nekā vecākiem.

</hgroup>
<hgroup>

* PPM (*Prediction by Partial Matching*) ir saspiešanas algoritmu 
paveids, kas garam tekstam izmanto iepriekšējos $k$ simbolus, lai 
noteiktu nosacīto varbūtību nākamajam simbolam. 
* Dabīgas valodas tekstus var saspiest ļoti labi, 
bet šie algoritmi parasti izveido milzīgas datu struktūras.

</hgroup>



# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Bezzudumu saspiešana - 2</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Entropijas atkārtojums](#section-1)</span>  
<span>(3) [Hafmana optimalitāte](#section-2)</span>  
<span>(4) [Hafmana modifikācijas](#section-3)</span>  
<span style="color:darkgreen">**(5) Aritmētiskā saspiešana**</span>  
<span>(6) [LZ78 algoritms](#section-5)</span>  
<span>(7) [(P) Proprietāri formāti](#section-6)</span>  
<span>(8) [Kopsavilkums](#section-7)</span>

</hgroup>






# <lo-theory/> Aritmētiskā saspiešana

* Kāpēc lietot aritmētisko kodēšanu? 
* Ja ziņojumu telpā ir jocīgas varbūtības, tad Hafmana kodi (kas dala
kodu telpas "nekustamo īpašumu" gabalos pa $1/2$, $1/4$ utt.)
iznieko daudz vietas. 
* Neizmantojam to, ka dažu ziņojumu informācijas saturs 
ir daudz mazāks par $1$. 

**Jautājums:** Kā nosūtīt informācijas saturu, kas ir 0.4 biti?  
**Aritmētiskās saspiešanas ideja:** Griežam kodu telpu tādos gabalos, kā mums vajag
(un bitos iekodējam tikai pašās beigās).


## <lo-theory/> Algoritma apraksts

**Ievade:** Alfabēts un tā varbūtību sadalījums. Ziņojumu virkne šajā alfabētā.   
**Izvade:** Intervāls $I \subseteq [0;1]$ (pietiek nosūtīt skaitli no šī 
intervāla). 

* Ir $m$ ziņojumi $\{ 1,\ldots,m \}$. To varbūtības
ir $\{p(1),\ldots , p(m)\}$, kuru summa ir $1$. 
* Apzīmējam *kumulatīvās varbūtības*: 
$$f(j) = \sum\limits_{i=1}^{j-1} p(i),\;\;j=1,\ldots,m.$$


## <lo-summary/> Pirmais intervāls

Dota ziņojumu virkne $x_1,x_2,\ldots,x_k \in \{ 1,\ldots,m \}$.  
Veidojam intervālu virkni: 
$$[0;1] \supset [l_1;l_1+s_1) \supset [l_2;l_2+s_2) \supset \ldots \supset [l_k; l_k+s_k).$$

1.intervāls: $[l_1;l_1 + s_1) = \left[ f(x_1);p(x_1) \right)$.  
Intervāliem $2,\ldots,k$ apzīmējam:  
$$\left\{
\begin{array}{l}
l_i = l_{i-1} + f(x_i) \cdot s_{i-1}\\
s_i = s_{i-1} \cdot p(x_i)
\end{array} \right.$$



## <lo-theory/> Piemērs


<hgroup>

![Iekodēts babc](arithmetic-babc.png)

</hgroup>

<hgroup style="font-size:70%"> 

* Alfabētā ir 3 burti $a,b,c$. Varbūtības ir attiecīgi $0.2, 0.5, 0.3$
(entropija viena burta nosūtīšanai būs $1.485475$)
* Piemērā parādīts, ka <blue>`babc`</blue> atbilst intervāls $[.255, .27)$.
* Galīga bināra daļa šajā intervālā: 
<red>`.0100001`</red> jeb $[33/128,34/128) \subseteq [.255, .27)$.
* $4$ ziņojumu virknītes nosūtīšanai iztērējām $7$ bitus
(vidēji $1.75$ biti uz vienu ziņojumu).

**Jautājums:** Vai robežā nosūtīto bitu daudzums pret ziņojuma garumu tieksies uz 
entropiju $1.485475$. Kāpēc?

</hgroup>



## <lo-theory/> Intervālu nosūtīšana

* Ja dots intervāls ar garumu $s$, tad tā iekšienē 
var atrast skaitli, kura binārajā pierakstā ir 
ne vairāk kā $-\left\lceil \log_2 s \right\rceil$ biti.
* Gribam sūtīt tikai vienu skaitli. Lai saprastu, cik garš ir 
tā intervāls, interpretējam, teiksim $.010$ nevis vienkārši 
kā $1/4$, bet kā intervālu $[1/4, 3/8)$. 
* Nepazaudējot vairāk kā 1-2 bitus, varam izveidot šādu 
intervālu $[k/2^n,(k+1)/2^n)$, kurš atradīsies stingri iekšpusē 
tam $I$, ko dod aritmētiskais kods.

## <lo-theory/> Aritmētiskā koda īpatnības

* Aritmētiskā koda algoritmus jābūvē vai nu relatīvi nelielām ziņojumu 
kopām (kur mums pietiek ar floating aritmētiku), vai arī
jāizveido tuvinājums, kur reālos skaitļus tuvina ar veseliem skaitļiem. 

Sk arī 21.lpp. no teksta
[G.Blelloch. Introduction to Data Compression](https://www.cs.cmu.edu/~guyb/realworld/compression.pdf) 
- ar veseliem skaitļiem tuvināts aritmētiskās kodēšanas algoritms.




# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Bezzudumu saspiešana - 2</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Entropijas atkārtojums](#section-1)</span>  
<span>(3) [Hafmana optimalitāte](#section-2)</span>  
<span>(4) [Hafmana modifikācijas](#section-3)</span>  
<span>(5) [Aritmētiskā saspiešana](#section-4)</span>  
<span style="color:darkgreen">**(6) LZ78 algoritms**</span>  
<span>(7) [(P) Proprietāri formāti](#section-6)</span>  
<span>(8) [Kopsavilkums](#section-7)</span>

</hgroup>


# <lo-sample/> Piemērs labai saspiešanai ar LZ78


Nejauša pastaiga pa Markova ķēdi ar $3$ stāvokļiem:

![Markova ķēde](markov-chain.png)


$18$ burtu virknīte, sākot ar $A$:  
<blue>`ABCABCBCAAABCABBAB`</blue>


::: notes

sample(1:4,size=17, replace=TRUE)  
[1] 3 3 1 2 3 4 3 2 1 1 4 4 2 3 2 1 4

:::


# <lo-theory> LZ78 iekodēšanas pseidokods

Sākumā vārdnīcā jau atrodas visi simboli. Tad tai pievieno 
garākas virknītes:

![LZ78 iekodēšana](LZ78-encode.png)



## <lo-sample/> LZ78 iekodēšanas piemērs

<div style="font-size:70%">

Kodējam augšminēto <blue>`ABCABCBCAAABCABBAB`</blue>

<table>
<tr><th>Solis</th><th>w</th><th>k</th><th>Izvade</th><th>Pievieno vārdnīcai</th></tr>
<tr><td>1</td><td>A</td><td>B</td><td>A</td><td>AB</td></tr>
<tr><td>2</td><td>B</td><td>C</td><td>B</td><td>BC</td></tr>
<tr><td>3</td><td>C</td><td>A</td><td>C</td><td>CA</td></tr>
<tr><td>4</td><td>AB</td><td>C</td><td>AB → 1</td><td>ABC</td></tr>
<tr><td>5</td><td>C</td><td>B</td><td>C</td><td>CB</td></tr>
<tr><td>6</td><td>BC</td><td>A</td><td>BC → 2</td><td>BCA</td></tr>
<tr><td>7</td><td>A</td><td>A</td><td>A</td><td>AA</td></tr>
<tr><td>8</td><td>AA</td><td>B</td><td>AA → 7</td><td>AAB</td></tr>
<tr><td>9</td><td>BCA</td><td>B</td><td>BCA</td><td>BCAB</td></tr>
<tr><td>10</td><td>B</td><td>B</td><td>B</td><td>BB</td></tr>
<tr><td>11</td><td>B</td><td>A</td><td>B</td><td>BA</td></tr>
<tr><td>12</td><td>AB</td><td>`EOF`</td><td>AB → 1</td><td>-</td></tr>
</table>

LZ78 iekodējums ir `A.B.C.AB.C.BC.A.AA.BCA.B.B.AB`  
Aizstājam virknes ar soļiem, kur tās iesprauda vārdnīcā:  
<red>`A.B.C.1.C.2.A.7.6.B.B.1`</red>

</div>

# <lo-theory> LZ78 atkodēšanas pseidokods

![LZ78 atkodēšana](LZ78-decode.png)

## <lo-sample/> LZ78 atkodēšanas piemērs

**Piemērs:** Izmantot LZ78, lai atkodētu 
virknīti: <red>`A.B.C.1.3.2.D.4.1.A`</red>

Ja atkodēšana veikta pareizi, vajadzētu 
sanākt <blue>`A.B.C.AB.CA.BC.D.ABC.AB.A`</blue>.




# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Bezzudumu saspiešana - 2</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Entropijas atkārtojums](#section-1)</span>  
<span>(3) [Hafmana optimalitāte](#section-2)</span>  
<span>(4) [Hafmana modifikācijas](#section-3)</span>  
<span>(4) [Aritmētiskā saspiešana](#section-4)</span>  
<span>(6) [LZ78 algoritms](#section-5)</span>  
<span style="color:darkgreen">**(7) (P) Proprietāri formāti**</span>  
<span>(8) [Kopsavilkums](#section-7)</span>

</hgroup>






# <lo-yellow/> Pasaka: Kur lieto LZ saimes algoritmus

* Gzip, ZIP un V.42bis (modēmos lietots protokols) balstās uz LZ77. 
* Unix `compress`, un GIF formāti izmanto LZ78.
* *"LZ78 was covered by U.S. Patent 4,464,650 by Lempel, Ziv, Cohn, and Eastman, assigned to Sperry Corporation, later Unisys Corporation, filed on August 10, 1981. Two US patents were issued for the LZW algorithm: U.S. Patent 4,814,746 by Victor S. Miller and Mark N. Wegman and assigned to IBM, originally filed on June 1, 1983, and U.S. Patent 4,558,302 by Welch, assigned to Sperry Corporation, later Unisys Corporation, filed on June 20, 1983."*
(sk. [LZW Patents](https://en.wikipedia.org/wiki/Lempel%E2%80%93Ziv%E2%80%93Welch#Patents))

## <lo-yellow/> Patenti saistībā ar saspiešanu

* GIF (Unisys patents beidzās ap 2004.g.). Radās aizstājējformāts PNG - tāda
pati bezzudumu saspiesta rastra grafika (tika pievienota "alpha-transparency"). 
* MP3 (patenti ASV beidzās ap 2017.g.). Radās OGG Vorbis formāti skaņai un 
video. 
* [MP3 patentu beigas: 23.aprīlis 2017.g.](https://www.audioblog.iis.fraunhofer.com/mp3-software-patents-licenses)

## <lo-yellow/> Praktiskās sekas

* Galalietotājam šie formāti arvien bijuši brīvi, bet dzelžu vai 
programmatūras ražotājiem, kuri no tiem atvasina komerciālus produktus, 
reizēm bija jāmaksā - turklāt patentu tiesības (MP3 gadījumā) bija 
samudžinātas (pamatos Technicolor and Fraunhofer).
* Debian Linux papildu repozitoriji.



# &nbsp;

<hgroup>

<h1 style="font-size:28pt">Lietišķie algoritmi</h1>

<blue>Bezzudumu saspiešana - 2</blue>

</hgroup><hgroup>

<span>(1) [Ievads](#section)</span>  
<span>(2) [Entropijas atkārtojums](#section-1)</span>  
<span>(3) [Hafmana optimalitāte](#section-2)</span>  
<span>(4) [Hafmana modifikācijas](#section-3)</span>  
<span>(5) [Aritmētiskā saspiešana](#section-4)</span>  
<span>(6) [LZ78 algoritms](#section-5)</span>  
<span>(7) [(P) Proprietāri formāti](#section-6)</span>  
<span style="color:darkgreen">**(8) Kopsavilkums**</span>

</hgroup>




# <lo-theory/> Ko darījām šajā nodarbībā?

1. Aplūkojām informācijas saturu un entropiju vairākos kontekstos
2. Pamatojām, ka Hafmana kods (kā optimāls kods ar min. vidējo garumu) nevar
saspiest labāk par entropiju. 
3. Aplūkojām dažas Hafmana algoritma modifikācijas (simbolu grupēšanu un 
PPM)
4. Lietojām aritmētisko saspiešanu saspiešanai un atspiešanai.
5. Iesākām apspriest Lempela Ziva algoritmus.



# <lo-theory/> Atsauces

* [G.Blelloch. Introduction to Data Compression](https://www.cs.cmu.edu/~guyb/realworld/compression.pdf) - 
Pamatots Hafmana algoritms un apgalvojumi par entropiju.
* [Lecture 2: Entropy and Data Compression (I): Introduction to Compression, Inf.Theory and Entropy](https://www.youtube.com/watch?v=y5VdtQSqiAI) Kembridžas lekcija par informācijas teoriju nr.2. 






