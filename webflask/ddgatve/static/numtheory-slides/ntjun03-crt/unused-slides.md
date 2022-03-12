# <lo-sample/> Inversie pēc 16 moduļa

<hgroup>

Atrast inversos elementus, ja `$b=16$`. T.i. atrisināt visas
iespējamās kongruences `$ax \equiv 1$` (pēc `$16$` moduļa).

</hgroup>
<hgroup>

`$$\begin{array}
\mbox{}1^{-1} \equiv ?\;(\text{mod}\,16)\\
3^{-1} \equiv ?\;(\text{mod}\,16)\\
5^{-1} \equiv ?\;(\text{mod}\,16)\\
7^{-1} \equiv ?\;(\text{mod}\,16)\\
9^{-1} \equiv ?\;(\text{mod}\,16)\\
11^{-1} \equiv ?\;(\text{mod}\,16)\\
13^{-1} \equiv ?\;(\text{mod}\,16)\\
15^{-1} \equiv ?\;(\text{mod}\,16)
\end{array}$$`

</hgroup>


--


--

## <lo-summary/> Bezū identitātes pierādīšanas metode

<div style="font-size:80%">

* Definētais `$d^{\ast}$` bija <blue>*ekstrēmais elements*</blue> - vismazākais skaitlis ar kaut kādu īpašību.
* To, ka šādi iegūtais `$d^{\ast}$` ir *lielākais kopīgais dalītājs* pierādījām pa daļām. 
* Daži pierādījuma soļi bija no pretējā. 
* Pieņēmumos no pretējā pārtulkojām *kvalitatīvu* apgalvojumu *kvantitatīvi* (pārrakstījām algebriski).

<table> 
<tr><th>Kvalitatīvs apgalvojums</th><th>Kvantitatīvs apgalvojums</th></tr>
<tr><td>`$n$` ir nepāru skaitlis</td><td>Var izteikt `$n=2k+1$`</td></tr>
<tr><td>`$a$` nedalās ar `$d$`</td><td>Var izteikt `$a = dq + r$`, kur `$0 < r < d$`</td></tr>
<tr><td>`$a$` dalās ar `$c$`</td><td>Var izteikt `$a = cu$`</td></tr>
</table>

Līdzīgi ģeometrijā, kur kvalitatīvus apgalvojumus
(ap četrstūri var apvilkt riņķa līniju) pārtaisa par kvantitatīviem 
(pretējo leņķu summas; ievilktie leņķi u.c.). 

</div>




-----

# <lo-theory/> Skaitļu teorijas algoritmi

<div style="font-size:70%">

Skaitļu teorijā (kas ir ne tikai olimpiāžu, bet arī lietojumu 
nozare, piemēram, kriptogrāfijā), ir sastopami daži noderīgi algoritmi. 

<dl>
<dt>Pirmskaitļu pārbaude</dt>
<dd>Naivais jeb pilnās pārlases algoritms; Rabina-Millera algoritms</dd>
<dt>Algoritmi, kas atrod divu skaitļu LKD</dt>
<dd>Eiklīda algoritms</dd>
<dt>Lineārs kongruenču vienādojums `$ax \equiv m\;(\text{mod}\,b)$`</dt>
<dd>Pārveidojums uz Bezū identitāti; Blankinšipa algoritms</dd>
<dt>Lineāru kongruenču sistēma</dt>
<dd>Ķīniešu atlikumu teorēma</dd>
<dt>Kvadrātiska kongruence `$x^2 = m\;(\text{mod}\,b)$`</dt>
<dd>Ležandra simboli un kvadrātiskie atlikumi.</dd>
</dl>

</div>






-----

# <lo-sample/> Piemērs

**NT.JUN01.04:** Pierādīt, ka virkne `$1,11,111,\ldots$` satur bezgalīgu apakšvirkni, 
kuras katri divi locekļi ir savstarpēji pirmskaitļi.

**Jautājums:** Vai skaitļu `$a^m - 1$` un `$a^n - 1$` lielākais kopīgais dalītājs ir
skaitlis `$a^{\text{LKD}(m,n)} - 1$`?