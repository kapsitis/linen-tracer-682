# &nbsp;

<hgroup>


<h1 style="font-size:32pt">Skaitļu teorija:<br/>
10.kl. Igaunijas olimpiādes</h1>

</hgroup><hgroup>

* EE.PK - Eesti Piirkonnavoor (Igaunijas reģionu kārta)
* EE.LO - Eesti Lõppvoor (Igaunijas gala/valsts kārta)
* EE.LVS - Eesti Sügisene lahtine võistlus (Igaunijas rudens atvērtais konkurss)
* EE.LVT - Eesti Talvine lahtine võistlus (Igaunijas ziemas atvērtais konkurss)

[Matemaatikaolümpiaadid ](http://www.math.olympiaadid.ut.ee/html/index.php)

</hgroup>

---

# <lo-sample/> EE.PK.2010.10.5

Pierādīt, ka jebkuram veselam $n \geq 3$ atradīsies tāds $n$-ciparu
skaitlis, kurš ir vesela skaitļa kvadrāts, un, pierakstot tam sākumā 
ciparu 1, arī rodas kāda vesela skaitļa kvadrāts.

<!--
Доказать, что для каждого целого числа $n \geq 3$ найдётся такое $n$-значное
число, которое является квадратом целого числа и при добавлении в его
начало цифры 1 также получится квадрат некоторого целого числа.
-->

<small>

* [misc.beginatend](#)
* [misc.experiment](#)
* [notation.algor.square5](#)
* [notation.dec.numdigits.square](#)
* [alg.factorize.sqdiff](#)

</small>

----

# Vienādojumu sistēmas

* Ja $n=3$, var aplūkot pilnus kvadrātus, kas satur četrus ciparus un
sākas ar "1": $32^2=1024$, $33^2 = 1089$, $34^2 = 1156$ un 
$35^2 = 1225$. Tas arī ir pirmais skaitlis, kuram nometot pirmo ciparu 
iegūst kvadrātu: $225 = 15^2$. 
* Redzam arī, ka $35^2 - 15^2 = (35-15)(35+15)=20\cdot 50 = 1000$. 
* Nākamā sistēmiņa: $a+b=200$, $a-b=50$. Tātad 
$$a = 125,\;\; b = 75,\;\;125^2 - 75^2=10000.$$
* Skaitļus $15$, $35$, $75$, $125$ u.c. var ātri kāpināt kvadrātā:

$75^2 = 5625$, jo $7 \cdot 8 = 56$.  
$125^2 = 15625$, jo $12 \cdot 13 = 156$.


----

# <lo-sample/> EE.PK.2011.10.3

Matemātikas stundā Jüri dalīja naturālu skaitli $n$ ar naturālu 
skaitli $m$, iegūstot dalījumu un atlikumu.  
a) Pierādīt, ka, ja dalījums un atlikums ir savā starpā vienādi, 
tad $n$ dalās ar $m+1$.  
b) Vai izpildās arī apgrieztais apgalvojums: Vienmēr, kad skaitlis
$n$ dalās ar $m+1$, tad dalījums un atlikums, ja $n$ dala ar $m$, ir 
savā starpā vienādi? 

<!--
На уроке математики Юра должен был поделить положительное целое
число $n$ на положительное целое число $m$, чтобы найти частное и остаток.
а) Доказать, что если найденные частное и остаток равны между собой,
то число n делится на число m + 1.
б) Выполняется ли обратное утверждение: всегда, когда число n делится 
на число m + 1, частное и остаток при делении числа n на число
m равны между собой?
-->

<small>

* [mod.rem.expr](#)
* [mod.rem.values](#)

</small>

----

# <lo-sample/> EE.PK.2012.10.4

Cik ir veselu skaitļu komplektu $(a, b, c)$, 
kuri apmierina vienādojumu $(a + b)(b + c)(c + a) = 123456789$?

<!--
Сколько существует комплектов целых чисел $(a, b, c)$, 
которые удовлетворяют уравнению $(a + b)(b + c)(c + a) = 123456789$?
-->

<small>

* [mod.parity.cases](#)

</small>

---

# <lo-sample/> EE.PK.2013.10.3

Atrast mazāko naturālo skaitli $n$, kuram starp jebkuriem $n$
veselu skaitļu kvadrātiem atradīsies divi tādi, kuru starpība
dalās ar $10$. 

<!--
Найти наименьшее натуральное число $n$, при котором среди любых n
квадратов целых чисел найдутся два таких, разность которых делится
на $10$.
-->

<small>

* [mod.expr.square](#)
* [misc.exhaustive](#)
* [misc.pigeonhole](#)

</small>

----

# Dirihlē princips

* Ievērojam, ka skaitļa kvadrāta atlikums, dalot ar $10$, atkarīgs tikai no paša skaitļa atlikuma.
* Pārbaudām pilno kvadrātu atlikumus:

<table>
<tr><th>$x$</th><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td>6</td><td>7</td><td>8</td><td>9</td><td>10</td></tr>
<tr><th>$x^2$</th><td>1</td><td>4</td><td>9</td><td>16</td><td>25</td><td>36</td><td>49</td><td>64</td><td>81</td><td>100</td></tr>
<tr><th>$x^2\;\mbox{mod}\;10$</th><td>1</td><td>4</td><td>9</td><td>6</td><td>5</td><td>6</td><td>9</td><td>4</td><td>1</td><td>0</td></tr>
</table>

* Starp šiem atlikumiem ir seši atšķirīgi: $1,4,9,6,5,0$.
* Ja izvēlas septiņus, tad divi sakritīs (Dirihlē princips). 

----

# <lo-sample/> EE.PK.2014.10.3

Vienādmalu trijstūra virsotnēs ierakstīti naturāli skaitļi $14$, $20$ un $n$.. 
Jebkuru divu virsotņu skaitļu reizinājums dalās ar skaitli trešajā virsotnē. 
Atrast visas iespējamās $n$ vērtības.


<!--
В вершины равностороннего треугольника записаны положительные целые числа 14, 20 и $n$. 
Произведение чисел любых двух вершин делится на
число в третьей вершине. Найти все возможные значения числа $n$.
-->

<small>

* [div.common.lcm](#)
* [div.common.lcm.mult](#)
* [misc.exhaustive](#)

</small>

-----


* Prasības: $14 \cdot 20$ dalās ar $n$, $14n$ dalās ar $20$, $20n$ dalās ar $14$
* $n$ ir $280$ dalītājs, vienlaikus $n$ dalās ar $2$, $5$, $7$. 
* Tātad $n = 2 \cdot 5 \cdot 7 k = 70k$, kas ir $280$ dalītājs.
* Trīs $n$ vērtības: $(70, 140, 280)$. 


----

# <lo-sample/> EE.PK.2015.10.3

а) Zināms, ka $x^2 − y^2 = 100$, kur $x$ и $y$ ir naturāli skaitļi. Atrast izteiksmes 
$x − y$ mazāko iespējamo vērtību.  
b) Tas pats jautājums, ja $x$ un $y$ ir veseli skaitļi.

<!--
а) Известно, что $x^2 − y^2 = 100$, где $x$ и $y$ − натуральные числа. Найти
наименьшее возможное значение выражения $x − y$.  
б) Тот же вопрос, при условии, что $x$ и $y$ − целые числа
-->

<small>

* [alg.factorize.sqdiff](#)
* [div.pfactor.prop.numdivisors](#)

</small>

---

# <lo-sample/> EE.PK.2015.10.6

Vai eksistē tāds naturāls skaitlis $n$, ka vairāk nekā pusei 
veselo skaitļu no $1$ līdz $n$ ciparu summa ir pāru skaitlis?

<!--
Существует ли такое положительное целое число $n$, что у более половины
из целых чисел от $1$ до $n$ сумма цифр чётна?
-->

<small>

* [misc.induction](#)

</small>

---

# <lo-sample/> EE.PK.2016.10.3

Vai var atrast tādus $n$ naturālus skaitļus, lai to summa 
būtu vienāda ar to mazāko kopīgo dalāmo, ja 
a) $n = 2$?  
b) $n = 3$?

<!--
Можно ли подобрать такие $n$ положительных целых чисел, 
чтобы их сумма равнялась их же наименьшему общему кратному, если
а) $n = 2$?  
б) $n = 3$?
-->

---

# <lo-sample/> EE.PK.2016.10.4

Vai eksistē tāds vienādojuma 
$x^2 + y^2 + z^2 + w^2 = 3 + xy + yz + zw$,
atrisinājums, kuram $x$, $y$, $z$ un $w$ ir dažādi veseli skaitļi?


<!--
Существует ли такое решение уравнения
$x^2 + y^2 + z^2 + w^2 = 3 + xy + y z + zw$,
при котором $x$, $y$, $z$ и $w$ различные целые числа?
-->

<small>

* [alg.ineq.fullsquare](#)

</small>


----

# <lo-sample/> EE.PK.2017.10.2

Atrast visus veselu skaitļu pārus $(x,y)$, kuriem 
$324^{x+y} = 2^{x−y} \cdot 3^{x−3} \cdot 4^{y−4}$.

<!--
Найти все пары целых чисел $(x,y)$, при которых
$324^{x+y} = 2^{x−y} \cdot 3^{x−3} \cdot 4^{y−4}$.
-->

----

# <lo-sample/> EE.PK.2017.10.3

Pierādīt, ka atradīsies bezgalīgi daudz četrinieku, ko veido 
dažādi naturāli skaitļi, kuriem
$$\frac{1}{a} - \frac{1}{b} =\frac{1}{b} - \frac{1}{c} =\frac{1}{c} - \frac{1}{d}.$$

<!--
Доказать, что найдётся бесконечно много четвёрок различных 
целых положительных чисел $(a, b, c, d)$, при которых
$$\frac{1}{a} - \frac{1}{b} =\frac{1}{b} - \frac{1}{c} =\frac{1}{c} - \frac{1}{d}.$$
-->

----

# <lo-sample/> EE.PK.2018.10.3

Mari iedomājās naturālu skaitli. Pareizinot šo skaitli ar $4$, 
viņa ieguva kādu trīsciparu skaitli. Bet, pareizinot sākotnējo 
skaitli ar $3$ un pārceļot rezultāta pēdējo ciparu uz sākumu, 
negaidīti ieguva tādu pašu trīsciparu skaitli. 
Atrast visas iespējamās vērtības Mari iedomātajam skaitlim. 

<!--
Маша задумала одно натуральное число. Умножив это число на 4, 
она получила какое-то трёхзначное число. А когда она умножила первоначальное 
число на 3 и переставила последнюю цифру результата в его начало,
то неожиданно получила то же самое трёхзначное число. 
Найти все возможные значения задуманного Машей числа.
-->


----

# <lo-sample/> EE.PK.2019.10.3

Cik ir tādu veselu negatīvu skaitļu pāru $(a,b)$, 
kas apmierina vienādību $22a + 15b = 2019$?

<!--
Сколько найдётся пар неотрицательных целых чисел $(a, b)$, 
удовлетворяющих равенству $22a + 15b = 2019$?
-->

----

# <lo-sample/> EE.LO.2010.10.2

Vienādojumam
$$\frac{2}{a^2}+\frac{3}{b^2}+\frac{4}{c^2}=1$$
atrast visus atrisinājumus naturālos skaitļos.

<!--
Для уравнения
$$\frac{2}{a^2}+\frac{3}{b^2}+\frac{4}{c^2}=1$$
найти все решения в натуральных числах.
-->

----

# <lo-sample/> EE.LO.2011.10.2

Atrast visus naturālu skaitļu četriniekus $(w,x,y,z)$, 
kuriem izpildās vienādība $w^x + w^y = w^z$.

<!--
Найти все четвёрки положительных целых чисел $(w, x, y, z)$, 
при которых выполняется равенство $w^x + w^y = w^z$.
-->


---

# <lo-sample/> EE.LO.2012.10.1

Atrast visus tādus naturālu skaitļu pārus $(n,m)$, kuriem 
skaitļu $n$ un $m$ aritmētiskais un ģeometriskais vidējais 
ir dažādi divciparu naturāli skaitļi, kuri iegūstami viens no 
otra, apmainot vietām ciparus.  
*Piezīme. Par pozitīvu skaitļu $x$, $y$ ģeometrisko vidējo 
sauc skaitli $\sqrt{x y}$.*

<!--
Найти все такие пары $(n, m)$ положительных целых чисел, при которых
арифметическое и геометрическое среднее чисел $n$ и $m$ являются 
различными двузначными натуральными числами, которые одно из другого
получаются перестановкой цифр.  
*Замечание. Геометрическим средним положительных чисел $x$, $y$ называется 
число $\sqrt{x y}$.*
-->


---

# <lo-sample/> EE.LO.2012.10.5

Atrast visus naturālu skaitļu trijniekus $(x,y,z)$, kuriem 
$x \cdot y! + 2y \cdot x! = z!$.  
*Piezīme. Par naturāla skaitļa $n$ faktoriālu $n!$ sauc 
reizinājumu $1 \cdot 2 \cdot \ldots \cdot n$.*


<!--
Найти все такие тройки положительных целых чисел (x, y, z), 
при которых $x \cdot y! + 2y \cdot x! = z!$.  
*Замечание. Факториалом $n!$ натурального числа $n$ 
называется произведение $1 \cdot 2 \cdot \ldots \cdot n$.*
-->

---

# <lo-sample/> EE.LO.2013.10.1

Vai skaitli $2013$ var izteikt kā divu veselu skaitļu kubu starpību?

<!--
Можно ли представить число 2013 как разность кубов двух целых чисел?
-->

<small>

* [mod.cases.cubes](#)
* [notation.divrules.3or9.remainder](#)

</small>

---

# <lo-sample/> EE.LO.2014.10.1

Ar $a$ un $n$ apzīmēti naturāli skaitļi. Pierādīt, ka 
$$\left\lfloor \frac{a}{n} \right\rfloor + \left\lfloor \frac{a+1}{n} \right\rfloor + \ldots + \left\lfloor \frac{a+n-1}{n} \right\rfloor = a.$$
*Piezīme. Katram reālam skaitlim $x$, 
$\lfloor x \rfloor$ apzīmē skaitļa $x$ (apakšējo) veselo daļu, 
t.i. vislielāko veselo skaitli, kas nepārsniedz $x$.*


<!-- 
Пусть $a$ и $n$ − целые положительные числа. Доказать, что
$$\left\lfloor \frac{a}{n} \right\rfloor + 
left\lfloor \frac{a+1}{n} \right\rfloor + \ldots +
left\lfloor \frac{a+n-1}{n} \right\rfloor = a.$$
*Примечание. Для каждого действительного числа $x$, $\lfloor x \rfloor$ обозначает 
целую часть числа $x$, т.е. наибольшее целое число, не превосходящее $x$.*
-->



---

# <lo-sample/> EE.LO.2014.10.5

Ar $m$ apzīmēts naturāls skaitlis. Pierādīt, ka, ja Mari uzrakstījusi 
uz tāfeles vismaz $m+3$ skaitļus, tad Jüri vienmēr varēs izvēlēties no 
tiem $4$ tādus, ka kaut kādu divu izvēlēto skaitļu summa un atlikušo 
divu izvēlēto skaitļu summa dos vienādus atlikumus, dalot ar $m$. 


<!--
Пусть $m$ − положительное целое число. Доказать, что если Маша запишет
на доске по меньшей мере $m + 3$ числа, то у Пети всегда будет 
возможность выбрать из них $4$ таких, что сумма каких-то двух выбранных чисел
и сумма остальных двух выбранных чисел будут давать равные остатки
при делении на $m$.
-->

----

# <lo-sample/> EE.LO.2015.10.1

Atrast visus naturālos skaitļus $n$, kas lielāki par vienu, 
kuriem 
$\frac{1}{n}$ un $\frac{1}{n + 1}$
izsakāmi kā galīgas decimāldaļas.

<!--
Найти все натуральные числа $n$ большие одного, при которых 
$\frac{1}{n}$ и $\frac{1}{n + 1}$
представимы в виде конечных десятичных дробей.
-->

----

# <lo-sample/> EE.LO.2015.10.4

Uz tāfeles virknē viens pēc otra uzrakstīti naturālie skaitļi 
no $1$ līdz $n$, bet zem viņiem tie paši skaitļi, bet pretējā
secībā. Apzīmēsim viena zem otra uzrakstīto skaitļu reizinājumu 
summu ar $S(n)$. Piemēram, 
$S(6) = 1\cdot{}6 + 2\cdot{}5 + 3\cdot{}4 + 4\cdot{}3 + 5\cdot{}2 + 6\cdot{}1 = 56$.)
Pierādīt, ka jebkuram naturālam skaitlim $n$ izpildās vienādības
$$S(n + 1) − S(n) = 1 + 2 + . . . + n + (n + 1),$$
$$S(n + 1) + S(n) = 1^2 + 2^2 + \ldots + n^2 + (n + 1)^2.$$

<!--
На доске в ряд друг за другом записываются натуральные числа от $1$ до $n$,
а под ними те же самые числа, но в обратном порядке. Обозначим сумму
произведений записанных друг над другом чисел через $S(n)$. (Например,
$S(6) = 1\cdot{}6 + 2\cdot{}5 + 3\cdot{}4 + 4\cdot{}3 + 5\cdot{}2 + 6\cdot{}1 = 56$.)
Доказать, что для каждого натурального числа $n$ выполняются равенства
$$S(n + 1) − S(n) = 1 + 2 + . . . + n + (n + 1),$$
$$S(n + 1) + S(n) = 1^2 + 2^2 + \ldots + n^2 + (n + 1)^2.$$
-->

----

# <lo-sample/> EE.LO.2016.10.1

Atrast visus tos četrciparu skaitļus, kuri ir tieši par $2016$ lielāki 
par skaitli, ko iegūst, pārliekot pirmo ciparu uz beigām.

<!--
Найти все такие четырёхзначные числа, которые ровно на $2016$ больше
числа, полученного путём переставления первой цифры в конец.
-->

----

# <lo-sample/> EE.LO.2016.10.2

Atrast visus veselu skaitļu pārus $(a,b)$, kuriem izpildās vienādība
$$3(a^2 + b^2) − 7(a + b) = −4.$$

<!--
Найти все пары целых чисел $(a, b)$, для которых выполняется равенство
$$3(a^2 + b^2) − 7(a + b) = −4.$$
-->

----

# <lo-sample/> EE.LO.2017.10.1

Juku izvirzījis matemātisku hipotēzi, kas apgalvo, ka jebkuram 
veselam skaitlim $n > 4$ vismaz viens no diviem lielākajiem skaitļiem, 
kuri mazāki par $\frac{n}{2}$, ir savstarpējs pirmskaitlis ar $n$. 
Vai Juku hipotēze ir patiesa?  
*Piezīme. Vesels skaitlis $a$ ir savstarpējs pirmskaitlis ar veselu 
skaitli $b$, ja lielākais kopīgais dalītājs $\mbox{LKD}(a,b)=1$.*

<!--
Петя выдвинул математическую гипотезу, согласно которой для каждого 
целого числа $n > 4$ по крайней мере одно из двух наибольших целых
чисел, меньших чем $\frac{n}{2}$, взаимно просто с числом $n$. Верна ли гипотеза
Пети?  
Примечание. Целое число $a$ взаимно просто с целым числом $b$, если
$\mbox{НОД}(a, b) = 1$.
-->

----

# <lo-sample/> EE.LO.2017.10.5

a) Uz tāfeles uzrakstīts trīsciparu skaitļa vispārīgais izskats 
$\overline{ABC}$. 
Anija un Enija pēc kārtas katrā savā gājienā nomaina vienu burtu 
ar ciparu, sāk Anija. Vai Anija varēs tā ierakstīt ciparus, ka neatkarīgi 
no Enijas gājiena iegūtais trīsciparu skaitlis dalīsies ar $11$? 
(Dažādus burtus var aizstāt arī ar to pašu ciparu, bet burtu "A" 
nevar aizstāt ar $0$.)  
b) Anija un Enija vairs negribēja katras spēles sākumā rakstīt 
skaitļa vispārīgo izskatu un nolēma izmainīt noteikumus: 
vispirms Anija uzraksta vienu ciparu, pēc tam Enija raksta tam pa 
labi vai pa kreisi otru ciparu, visbeidzot Anija pieraksta pa 
labi vai pa kreisi jau uzrakstītajiem cipariem trešo 
(ierakstīt starp esošajiem cipariem nav atļauts). 
Vai Anija varēs tā ierakstīt ciparus, ka neatkarīgi no Enijas gājiena
rezultātā būs trīsciparu skaitlis (t.i. pirmais cipars nav $0$), kas
dalās ar $11$? 

<!--
а) На доске записан общий вид трёхзначного числа $\overline{ABC}$. 
Аня и Женя по очереди заменяют каждым ходом одну букву цифрой, 
начинает Аня. Сможет ли Аня так записывать цифры, что независимо 
от хода Жени полученное в итоге трёхзначное число делилось бы на $11$? 
(Разные буквы можно заменять одной и той же цифрой, но букву A нельзя
заменять на $0$.)  
б) Аня и Женя утомились в начале каждой игры записывать общий вид
числа и решили изменить правила: сперва Аня записывает одну цифру, 
затем Женя справа или слева от неё вторую, а в конце Аня 
записывает вправо или влево от записанных на доске двух цифр третью 
(между цифрами записывать не разрешается). Сможет ли Аня так
записывать цифры, что независимо от хода Жени в итоге получится
трёхзначное число (т.е. первая цифра не $0$), делящееся на $11$?
-->

---

# <lo-sample/> EE.LO.2018.10.1

Atrast visus veselu skaitļu pārus $(a, b)$, kuriem
$$(2a^2 + b)^3 = b^3a.$$

<!--
Найти все пары целых чисел (a, b), при которых
$$(2a^2 + b)^3 = b^3a.$$
-->

----

# <lo-sample/> EE.LO.2019.10.1

Atrast visus veselu skaitļu pārus $(x, y)$, kuriem $x − y = \frac{x}{y}$.

<!--
Найти все пары целых чисел $(x, y)$, при которых $x − y = \frac{x}{y}$.
-->

---

# <lo-sample/> EE.LVS.2010.noorem.1

Atrast visus naturālos skaitļus $n$, kuriem 
$1 + 2^2 + 3^3 + 4^n$
ir vesela skaitļa kvadrāts.

<!--
Найти все положительные целые числа $n$, при которых 
$1 + 2^2 + 3^3 + 4^n$
является квадратом некоторого целого числа.
-->

---

# <lo-sample/> EE.LVS.2010.vanem.1

Vai eksistē pirmskaitlis $p$, kuram
$p^3 + 2008$ un $p^3 + 2010$ arī
ir pirmskaitļi?

<!--
Найдётся ли простое число $p$, при котором 
$p^3 + 2008$ и $p^3 + 2010$ также
являются простыми числами?
-->

---

# <lo-sample/> EE.LVT.2010.noorem.1

Atrast visus vienādojuma $xy-3x+7y = 2030$ atrisinājumus 
naturālos skaitļos.


<!--
Найти все решения уравнения $xy-3x+7y = 2030$ в положительных целых
числах.
-->

----

# <lo-sample/> EE.LVT.2010.noorem.5

Sauksim naturālu skaitli $n$ par *pirmskaittiecīgu*, ja 
eksistē vismaz trīs tādi pirmskaitļi, kuriem nodzēšot pēdējo 
ciparu, iegūst skaitli $n$. Pierādīt, ka jebkuri 
divi naturāli pirmskaittiecīgi skaitļi atšķiras vismaz par $3$. 

<!--
Назовём положительное целое число n простолюбивым, если найдутся
по крайней мере три таких простых числа, при стирании последней 
цифры которых получается число n. Доказать, что любые два простолюбивых
положительных целых числа различаются по крайней мере на $3$.
-->

----

# <lo-sample/> EE.LVT.2010.vanem.3

Sauksim naturālu skaitli $n$ par *tīru*, ja tas neietilpst nevienā
veselu skaitļu virknē
$c_0, c_1, c_2, \ldots$ , kur $0 < c_0 < n$,
un ko visiem $i > 0$ definē šādi:
$$c_i = \frac{c_{i-1}}{2},\;\;\mbox{ja $c_{i−1}$ ir pāru,}$$
$$c_i = 3c_{i-1} - 1,\;\;\mbox{ja $c_{i-1}$ ir nepāru.}$$
Piemēram, skaitlis $10$ nav tīrs, jo tas ietilpst virknē 
$5, 14, 7, 20, 10, \ldots$, kas apmierina virknes nosacījumus.  
a) Vai katrs naturāls skaitlis, kurš dalās ar $3$, ir tīrs?  
b) Pierādīt, ka, ja $n > 1$ ir tīrs, bet nedalās ar $3$, tad
skaitlis $n + 1$ dalās ar $6$.

<!--
Назовём положительное целое число $n$ чистым, если оно не содержится
ни в какой последовательности целых чисел 
$c_0, c_1, c_2, \ldots$ , где $0 < c_0 < n$,
и при каждом $i > 0$
$$c_i = \left\{ 
\begin{array}{ll}
\frac{c_{i-1}}{2}, & \mbox{если $c_{i−1}$ чётно,} \\
$3c_{i-1} - 1, & \mbox{если $c_{i-1}$ нечётно.}
\end{array} \right.$$
Например, число $10$ не является чистым, так как оно содержится в последовательности 
$5, 14, 7, 20, 10, \ldots$, удовлетворяющей условиям задачи.  
а) Является ли каждое делящееся на $3$ положительное целое число чистым?  
б) Доказать, что если целое число $n > 1$ чистое, но не делится на $3$, то
число $n + 1$ делится на $6$.
-->

----

# <lo-sample/> EE.LVS.2011.noorem.1

Atrast visus naturālos skaitļus $n$, kuriem 
visu viņu pozitīvo dalītāju reizinājums nav skaitļa $n$
pakāpe ar veselu kāpinātāju. 

<!--
Найти все положительные целые числа $n$, 
произведение всех положительных делителей которых не 
является степенью числа $n$ с целочисленным
показателем.
-->

----

# <lo-sample/> EE.LVS.2011.noorem.5

Atrast visus naturālu skaitļu pārus $(n,k)$, kuriem
$n! + (n + 1)! = k! + 120$.  
*Piezīme. Pieraksts $x!$ apzīmē reizinājumu $1 \cdot 2 \cdot \ldots \cdot x$.*

<!--
Найти все пары положительных целых чисел $(n, k)$, при которых
$n! + (n + 1)! = k! + 120$.  
Замечание. Запись $x!$ обозначает произведение $1 \cdot 2 \cdot \ldots \cdot x$.
-->

----

# <lo-sample/> EE.LVS.2011.vanem.1

Pierādīt, ka nevienu naturālu skaitli, starp kura cipariem pa 
vienai reizei atrodami cipari $2$ un $1$, bet visi pārējie cipari ir
nulles, nevar izteikt kā divu veselu skaitļu kvadrātu summu 
vai divu veselu skaitļu kubu summu. 

<!--
Доказать, что ни одно натуральное число, среди цифр которого 
встречаются по одному разу $2$ и $1$, а остальные все цифры нули, 
нельзя представить в виду суммы квадратов или суммы кубов двух целых чисел.
-->

---


# <lo-sample/> EE.LVS.2011.vanem.2

Ar $P(x)$ apzīmēts polinoms ar veseliem koeficientiem, 
kas apmierina nosacījumu $P(2010) = P(201) = 2010$.  
a) Vai ir iespējams, ka $P(2011) = 2011$?  
b) Kāda ir mazākā iespējamā $P(2011)$ pozitīvā vērtība?

<!--
Пусть $P(x)$ –– многочлен с целочисленными коэффициентами, 
удовлетворяющий условию $P(2010) = P(201) = 2010$.  
а) Возможно ли, что $P(2011) = 2011$?  
б) Каково наименьшее возможное положительное значение $P(2011)$?
-->

----

# <lo-sample/> EE.LVT.2011.noorem.1

Atrast visus naturālos skaitļus, kuru pierakstā nav vairāk par četriem
cipariem, un kuri, nodzēšot pirmo ciparu, samazinās tieši $25$ reizes
(pēc nodzēšanas skaitlis var sākties arī ar ciparu $0$). 


<!--
Найти все не более чем четырёхзначные положительные целые числа, 
которые при стирании первой цифры уменьшаются ровно в 25 раз 
(оставшееся число может начинаться и на цифру 0).
-->

----

# <lo-sample/> EE.LVT.2011.noorem.1

Aplūkosim naturālus skaitļus $N$, kuriem ir tieši $6$ 
pozitīvi dalītāji - apzīmēsim šos dalītājus ar 
$d_1,\ldots,d_6$, turklāt
$1 = d_1 <d_2 <d_3 <d_4 <d_5 <d_6 = N$. 
Sauksim skaitli $N$ par *labu*, ja summa
$d_4 + d_5$ dalās ar summu $d_2 + d_3$.  
a) Atrast mazāko naturālo skaitli $N$, kuram ir tieši
$6$ pozitīvi dalītāji un kurš nav labs.  
b) Pierādīt, ka atradīsies bezgalīgi daudz naturālu skaitļu
$N$, kuriem ir tieši $6$ pozitīvi dalītāji un kuri nav labi.

<!--
Рассмотрим положительные целые числа $N$, у которых ровно 
$6$ положительных делителей − обозначим эти делители через 
$d_1,\ldots,d_6$, причём
$1 = d_1 <d_2 <d_3 <d_4 <d_5 <d_6 = N$. 
Назовём число $N$ хорошим, если сумма
$d_4 + d_5$ делится на сумму $d_2 + d_3$.  
а) Найти наименьшее положительное целое число $N$, у которого ровно
$6$ положительных делителей и которое не является хорошим.  
б) Доказать, что найдётся бесконечно много положительных 
целых чисел $N$, у которых ровно $6$ положительных делителей и которые не
являются хорошими.
-->


----

# <lo-sample/> EE.LVT.2011.vanem.5

Cik ir tādu naturālu skaitļu, kas dalās ar $2010$, kuriem ir 
tieši $2010$ pozitīvu dalītāju (ieskaitot $1$ un pašu skaitli)? 

<!--
Сколько найдётся таких положительных целых чисел, делящихся на $2010$,
у которых ровно $2010$ положительных делителей (включая $1$ и само это
число)?
-->

----

# <lo-sample/> EE.LVS.2012.noorem.1

Atrast visus četrciparu skaitļus, kam, nodzēšot
jebkuru ciparu, rodas trīsciparu skaitlis, kurš ir 
sākotnējā skaitļa dalītājs. 

<!--
Найти все четырёхзначные числа, при стирании любой 
цифры которых получается трёхзначное число, 
являющееся делителем изначального числа.
-->

----

# <lo-sample/> EE.LVS.2012.vanem.1

Katram naturālam skaitlim $n$ apzīmēsim ar simbolu 
$a_n$ lielāko skaitļa $2$ pakāpi, ar ko dalās skaitlis $n$
(piemēram, $a_{2011} = 1$,
$a_{2012} = 4$). Pierādīt, ka patvaļīgiem naturāliem skaitļiem
$i$ un $j$, kur $i < j$, summa
$$\frac{1}{a_i} + \frac{1}{a_{i+1}} + \ldots + \frac{1}{a_j}$$
nav vesels skaitlis.

<!--
Для каждого положительного числа $n$ обозначим символом 
$a_n$ наибольшую степень числа $2$, на которую делится 
число $n$ (например, $a_{2011} = 1$,
$a_{2012} = 4$). Доказать, что для произвольных положительных 
целых чисел $i$ и $j$ , где $i < j$, сумма
$$\frac{1}{a_i} + \frac{1}{a_{i+1}} + \ldots + \frac{1}{a_j}$$
не является целым числом.
-->

-----

# <lo-sample/> EE.LVT.2012.noorem.1

Pierādīt, ka vienādojumam
$$2x^3 − y^2 = 3$$
nav atrisinājumu veselos skaitļos.

<!--
Доказать, что уравнение
$$2x^3 − y^2 = 3$$
не имеет целочисленных решений.
-->

------

# <lo-sample/> EE.LVT.2012.noorem.5

Vai var gadīties, ka trijstūrim ar veseliem malu garumiem
perimetrs dalās ar divkāršotu trijstūra pašas garākās malas garumu. 

<!--
Может ли быть так, что периметр треугольника 
с целочисленными длинами сторон делится на удвоенную длину 
самой длинной стороны этого треугольника?
-->

------

# <lo-sample/> EE.LVT.2012.vanem.1

Pierādīt, ka jebkuram pozitīvam skaitlim $n$ pirmo $n$ 
pirmskaitļu summa ir lielāka par $n^2$. 

<!--
Доказать, что при любом положительном целом числе n сумма первых n
простых чисел больше, чем n^2.
-->

------

# <lo-sample/> EE.LVT.2012.vanem.2

Atrast visus naturālu skaitļu trijniekus $(a,b,c)$, 
kuriem izpildās vienādība
$$a^{bc} + b^{ca} + c^{ab} = 3abc.$$

<!--
Найти все тройки положительных целых чисел $(a,b,c)$, 
при которых выполняется равенство
$$a^{bc} + b^{ca} + c^{ab} = 3abc.$$
-->


-----

# <lo-sample/> EE.LVS.2013.noorem.1

Cik ir tādu sešciparu naturālu skaitļu, kuru pierakstā ir 
cipari $0$, $1$, $2$, $3$, $4$ un $5$ katrs vienu reizi un 
kuri dalās ar katru savu ciparu, kas nav nulle.

<!--
Сколько всего таких шестизначных натуральных чисел, в записи которых
присутствуют цифры 0, 1, 2, 3, 4 и 5 каждая по одному разу, и которые
делятся на каждую свою цифру, отличную от нуля?
-->

---

# <lo-sample/> EE.LVS.2013.noorem.2

No nulles atšķirīgi veseli skaitļi $a$, $b$ un $c$ apmierina nosacījumu
$\frac{1}{a}+\frac{1}{b}+\frac{1}{c}=0$.
Pierādīt, ka star skaitļiem $a$, $b$, $c$ var atrast divus tādus
skaitļus, kuriem ir kopīgs dalītājs, kas lielāks par $1$.



<!--
Отличные от нуля целые числа $a$, $b$ и $c$ удовлетворяют условию
$\frac{1}{a}+\frac{1}{b}+\frac{1}{c}=0$.
Доказать, что среди чисел $a$, $b$, $c$ можно найти два таких числа, 
у которых найдётся общий делитель, который больше числа $1$.
-->


-----

# <lo-sample/> EE.LVS.2013.noorem.3

Skolotājs pateica Jüri divus veselus skaitļus $a$ un $b$, kas nav nulles, 
turklāt $b$ dalās ar $a$. Jüri ir jāatrod tādu nenulles veselu 
skaitli $c$, ka $c$ dalās ar $b$, un visi kvadrātvienādojuma
$ax^2+bx+c=0$ atrisinājumi ir veseli skaitļi. Vai Jüri vienmēr 
var atrisināt šo uzdevumu?

<!--
Учитель сказал Юре два отличных от нуля целых числа $a$ и $b$, причём
$b$ делится на $a$. Юра должен найти такое отличное от нуля целое число
$c$, что $c$ делилось бы на $b$, и чтобы все решения квадратного уравнения
$ax^2+bx+c=0$ являлись целыми числами. Всегда ли у Юры есть 
возможность верно решить это задание?
-->

-----

# <lo-sample/> EE.LVS.2013.vanem.1

Atrast visus naturālos skaitļus, kuri ir tieši $2013$ reizes lielāki 
par savu ciparu summu. 

<!--
Найти все положительные целые числа, которые ровно в $2013$ раз больше
суммы своих цифр.
-->

-----

# <lo-sample/> EE.LVS.2013.vanem.2

Atrast visus atlikumus, kurus, dalot ar $6$, dod vesels
skaitlis $n$, kurš kādam veselam $m$ apmierina vienādību 
$n^3 = m^2 + m + 1$.

<!--
Найти все остатки, которые при делении на число $6$ может 
дать целое число $n$, которое для некоторого 
целого числа $m$ удовлетворяет равенству
$n^3 = m^2 + m + 1$.
-->

-----

# <lo-sample/> EE.LVS.2013.vanem.3

Pierādīt, ka $(2n)! < n^{2n}$
katram veselam skaitlim $n \geq 3$.
*Piezīme. Par naturāla skaitļa $x$ faktoriālu $x!$ 
sauc reizinājumu $1\cdot{}2\cdot\ldots\cdot{}x$.*

<!--
Доказать, что $(2n)! < n^{2n}$
для каждого целого числа $n \geq 3$.
*Замечание. Факториалом $x!$ положительного целого числа $x$ называется
произведение $1\cdot{}2\cdot\ldots\cdot{}x$.*
-->

-----

# <lo-sample/> EE.LVT.2013.noorem.1

Kärt uzraksta uz tāfeles daļas $\frac{1}{2}$
un $\frac{1}{3}$, bet Märt uzraksta uz papīra $10$ 
naturālus skaitļus pēc savas izvēles, turklāt tos nerāda Kärt'am.
Pēc tam Kärt sāk pa vienai rakstīt klāt jaunas daļas
sekojošā veidā: katrā solī viņš izvēlas kādas uz tāfeles jau 
esošas daļas $\frac{a}{b}$ un $\frac{c}{d}$, 
un pievieno uz tāfeles daļu $\frac{a + c}{b + d}$ saīsinātā veidā.
(Piemēram, ja Kärt izvēlējās daļas
$\frac{1}{3}$ un $\frac{3}{5}$, tad viņš pievienos tām
daļu $\frac{1}{2}$, jo
$\frac{1 + 3}{3 + 5} = \frac{4}{8} = \frac{1}{2}$.)
Vai vienmēr Kärt spēs izvēlēties daļas tā, lai pēc kaut kāda soļu skaita
uz tāfeles parādītos daļa, kuras saucējs ir savstarpējs pirmskaitlis ar
visiem Märt uzrakstītajiem skaitļiem?

<!--
Карен записывает на доске дроби $\frac{1}{2}$
и $\frac{1}{3}$, а Маша записывает на бумаге
$10$ положительных целых чисел по своему выбору, причём Карену она их
не показывает. Затем Карен начинает по одной добавлять дроби на доску следующим образом: на каждом шагу он выбирает какие-то две уже
имеющиеся на доске дроби $\frac{a}{b}$ и $\frac{c}{d}$
и записывает на доску дробь $\frac{a + c}{b + d}$
в несократимом виде. (Например: если Карен выбрал дроби 
$\frac{1}{3}$ и $\frac{3}{5}$, то он
дописывает дробь $\frac{1}{2}$, потому что
$\frac{1 + 3}{3 + 5} = \frac{4}{8} = \frac{1}{2}$.)
Всегда ли Карен сможет выбрать дроби так, что после некоторого числа
шагов он запишет на доске дробь, знаменатель которой окажется взаимно
простым со всеми числами, записанными Машей?
-->

-----

# <lo-sample/> EE.LVT.2013.noorem.5

Atrast visus tos veselu skaitļu pārus $(a, b)$, kuriem
$(a + 1)(b − 1) = a^2b^2$.

<!--
Найти все такие пары целых чисел $(a, b)$, что 
$(a + 1)(b − 1) = a^2b^2$.
-->

----

# <lo-sample/> EE.LVT.2013.vanem.1

Ar $a$ un $b$ apzīmējam tādus naturālus skaitļus, ka $b$ dalās ar $a$, bet
pierakstot skaitļus $a$ un $b$ vienu aiz otra šajā secībā, 
iegūsim skaitli 
$(a + b)^2$. Pierādīt, ka $\frac{b}{a}=6$.

<!--
Пусть $a$ и $b$ такие положительные целые числа, что $b$ делится на $a$, а
записывая числа $a$ и $b$ друг за другом в этом порядке, получим число
$(a + b)^2$. Доказать, что $\frac{b}{a}=6$.
-->

----

# <lo-sample/> EE.LVT.2013.vanem.2

Ar $x$ un $y$ ir dažādi naturāli skaitļi. Pierādīt, ka 
$$\frac{x^2 + 4xy + y^2}{x^3 − y^3}$$
nav vesels skaitlis.

<!--
Пусть $x$ и $y$ различные положительные целые числа. Доказать, что
$$\frac{x^2 + 4xy + y^2}{x^3 − y^3}$$
не является целым числом
-->

----

# <lo-sample/> EE.LVT.2013.vanem.5

Atrast visas funkcijas $f$, kas definēta naturāliem skaitļiem
un pieņem naturālas vērtības, kas apmierina nosacījumu: 
Katriem naturāliem skaitļiem $k$ un
$a_1,\ldots,a_k$ skaitlis $f(a_1)+\ldots+f(a_k)$ dalās
ar skaitli $a_1 + \ldots + a_k$.

<!--
Найти все такие функции $f$ из множества положительных целых чисел в
это же самое множество, которые удовлетворяют условию: 
при любых положительных целых числах $k$ и 
$a_1,\ldots,a_k$ число $f(a_1)+\ldots+f(a_k)$ делится
на число $a_1 + \ldots + a_k$.
-->

----

# <lo-sample/> EE.LVS.2014.noorem.1

Volli grib no naturāliem skaitļiem
$1, 2, 3, \ldots, 100$ izvēlēties $x$ skaitļus tā, 
lai tieši četri no tiem dalītos ar $4$, tieši 
četri dalītos ar $5$ un tieši trīs skaitļi dalītos ar $6$. 
Atrast mazāko skaitļa $x$ vērtību. 

<!--
Витя желает выбрать среди натуральных чисел 
$1, 2, 3, \ldots, 100$ всего $x$ чисел так, 
чтобы ровно четыре из них делились на число $4$, 
ровно четыре из них делились на число $5$ и ровно 
три из них делились на число $6$. Найти
наименьшее возможное значение числа $x$.
-->



----

# <lo-sample/> EE.LVS.2014.noorem.2

Vienādiem burtiem atbilst vienādi cipari, 
bet dažādiem burtiem - dažādi cipari. 
Atrast visus veidus, kā aizstāt burtus ar cipariem tā, 
lai darbība izrādītos pareiza.

![Saskaitīšana stabiņā](EE.LVS.2014.noorem.2.png)

<!--
Одинаковым буквам соответствуют одинаковые цифры, 
а различным буквам − различные цифры. 
Найти все возможные способы замены букв цифрами так, 
чтобы данное действие было верным.
-->

----

# <lo-sample/> EE.LVS.2014.noorem.3

Doti naturāli skaitļi $a, b, c$, 
to lielākais kopīgais dalītājs ir $1$. 
Zināms, ka skaitļi $a+2b$ un $a^2 − b^2$
dalās ar $c$.
Pierādīt, ka arī $a-b$ dalās ar $c$.

<!--
Даны положительные целые числа $a, b, c$, 
наибольший общий делитель которых равен 1. 
Известно, что числа $a+2b$ и $a^2 − b^2$
делятся на число $c$.
Доказать, что на число $c$ делится также число $a − b$.
-->

----

# <lo-sample/> EE.LVS.2014.vanem.1

Atrast veselo daļu skaitlim 
$$A = \sqrt{2013 + \sqrt{2012 + \sqrt{2011 + \ldots \sqrt{2 +\sqrt{1}}}}}.$$
*Piezīme:* Par skaitļa $x$ veselo daļu sauc lielāko veselo skaitli, 
kurš nepārsniedz $x$.


<!--
Найти целую часть числа 
$$A = \sqrt{2013 + \sqrt{2012 + \sqrt{2011 + \ldots \sqrt{2 +\sqrt{1}}}}}.$$
Замечание: целой частью числа называется наибольшее 
целое число, которое не превышает данное число.
-->

----

# <lo-sample/> EE.LVS.2014.vanem.2

Atrast visus naturālos skaitļus $n$, kuriem atradīsies tādi 
pirmskaitļi $p$ un $q$, ka 
$$p(p + 1) + q(q + 1) = n(n + 1).$$


<!--
Найти все натуральные числа $n$, при которых найдутся такие простые
числа $p$ и $q$, что
$$p(p + 1) + q(q + 1) = n(n + 1).$$
-->

----

# <lo-sample/> EE.LVT.2014.noorem.1

Sauksim naturālu skaitli par *interesantu*, ja 
skaitlis, kuru veido jebkuri divi
blakusesoši cipari šajā skaitlī, dalās ar $19$ vai ar $21$. 
Piemēram, skaitlis $7638$ ir interesants, jo $76$ ir 
daudzkārtnis skaitlim $19$, 
$63$ ir daudzkārtnis skaitlim $21$, 
$38$ ir daudzkārtnis skaitlim $19$. 
Cik pavisam ir interesantu skaitļu, kuru 
pierakstā ir $2013$-cipari.

<!--
Назовём натуральное число интересным, если число, 
состоящее из любых двух рядом стоящих цифр этого числа, 
является кратным числу $19$ или числу $21$. 
Например, число $7638$ интересное, так как $76$ кратно числу 
$19$, $63$ кратно числу $21$, а $38$ кратно числу $19$. 
Сколько всего существует $2013$-значных интересных чисел?
-->

----

# <lo-sample/> EE.LVT.2014.noorem.3

Par naturāla skaitļa $n$ *nepāra daļu* sauksim lielāko 
nepāra naturālo skaitli, ar kuru dalās $n$.
Vai atradīsies tāds nepāru naturāls skaitlis, kuru 
nevar izteikt kā divu pēc kārtas sekojošu naturālu 
skaitļu nepāru daļu reizinājumu.

<!--
Нечётной частью положительного целого числа n назовём наибольшее
нечётное положительное целое число, на которое число n делится.
Найдётся ли такое нечётное положительное целое число, 
которое невозможно представить в виде произведения нечётных частей 
двух последовательных положительных целых чисел?
-->

----

# <lo-sample/> EE.LVT.2014.vanem.1

Atrast visus tos pozitīvu racionālu skaitļu pārus, 
kuriem pārī ietilpstošo skaitļu summa ir vesels skaitlis, 
un arī šo skaitļu apgriezto lielumu summa ir vesels skaitlis. 


<!--
Найти все такие пары положительных рациональных чисел, при которых
сумма входящих в пару чисел является целым числом, 
а также сумма обратных им чисел является целым числом.
-->

----

# <lo-sample/> EE.LVT.2014.vanem.5

a) Vai atradīsies tāds vesels skaitlis $c$ un polinoms $P(x)$ 
ar veseliem koeficientiem, kam $P(c) \neq c$, bet $P(P(c)) = c$?  
b) Vai atradīsies tāds vesels skaitlis $c$ un polinoms $P(x)$ 
ar veseliem koeficientiem, kam $P(c) \neq c$ un $P(P(c)) \neq c$, 
bet $P(P(P(c))) = c$?  
*Piezīme:* Par polinomu ar veseliem koeficientiem sauc
no $x$ atkarīgu izteiksmi
$P(x) = a_0 + a_1x + a_2x^2 +\ldots+ a_n x^n$,
kur $n$ − naturāls skaitlis un $a_0,a_1,a_2,\ldots,a_n$ - veseli skaitļi.

<!--
a) Найдётся ли такое целое число $c$ и многочлен $P(x)$ с целочисленными
коэффициентами, при которых $P(c) \neq c$, но $P(P(c)) = c$?  
b) Найдётся ли такое целое число c и многочлен $P(x)$ с целочисленными
коэффициентами, при которых $P(c) \neq c$ и $P(P(c)) \neq c$, 
но $P(P(P(c))) = c$?  
*Замечание:* многочленом с целочисленными коэффициентами называется
зависящее от переменной $x$ выражение 
$P(x) = a_0 + a_1x + a_2x^2 +\ldots+ a_n x^n$,
где $n$ − натуральное число и $a_0,a_1,a_2,\ldots,a_n$ − целые числа.
-->


----

# <lo-sample/> EE.LVS.2015.noorem.1

Atrast tādu vismazāko naturālo $n$, kuram katrs no cipariem 
no $0$ līdz $9$ būtu decimālpierakstā kaut vienam no 
sešiem pēc kārtas sekojošiem skaitļiem
$n+1$, $n+2$, $n+3$, $n+4$, $n+5$ 
un $n+6$.

<!--
Найти такое наименьшее натуральное число $n$, при котором каждая из
цифр от $0$ до $9$ присутствовала бы в записи хотя бы одного 
из шести последовательных чисел $n+1$, $n+2$, $n+3$, $n+4$, $n+5$ 
и $n+6$.
-->

----

# <lo-sample/> EE.LVS.2015.noorem.3

Vispirms uz lapiņas uzraksta skaitli $1$. 
Katrā solī zem pēdējā uzrakstītā skaitļa uzraksta 
vai nu skaitli, kurš par to tieši divreiz lielāks, 
vai arī skaitli, kuru iegūst pēdējā uzrakstītajā skaitlī 
mainot vietām ciparus (ņemot vērā, ka skaitļi 
nevar sākties ar ciparu $0$). Vai var gadīties, ka 
pēc galīga skaita šādu soļu uz lapiņas būs uzrakstīts  
a) skaitlis $1000000000$?  
b) skaitlis $9876543210$?

<!--
Сначала на листок бумаги записывают число 1. 
Каждым шагом под последним записанным числом записывают 
либо число, которое ровно в два
раза больше этого числа, либо число, полученное 
перестановкой цифр записанного последним числа 
(учитывая, что числа не могут начинаться с
цифры 0). Возможно ли после конечного числа таких шагов записать на
этом листке бумаги  
а) число $1000000000$?  
б) число $9876543210$?
-->

----

# <lo-sample/> EE.LVS.2015.noorem.4

Kurš no skaitļiem lielāks: $2^{2014}$ vai
$3^{303} \cdot 4^{404} \cdot 5^{505}$?

<!--
Какое из чисел больше, $2^{2014}$ или 
$3^303 \cdot 4^{404} \cdot 5^{505}$?
-->

----

# <lo-sample/> EE.LVS.2015.vanem.1

Atrast visus tos naturālos skaitļus $n$, kuriem 
vienādojumam 
$(x^2+y^2)^n = (xy)^{2014}$ 
ir atrisinājums naturālos skaitļos.


<!--
Найти все такие положительные целые числа $n$, 
при которых уравнение
$(x^2+y^2)^n = (xy)^{2014}$ имеет решение в положительных целых числах.
-->

-----

# <lo-sample/> EE.LVT.2015.noorem.1

Pēc kārtas sekojoši naturāli skaitļi, sākot
ar $1$, sadalīti grupās pa desmit tā, ka 
1.grupā atrodas skaitļi no $1$
līdz $10$, 2.grupā skaitļi no $11$ līdz $20$, 
3.grupā skaitļi no $21$ līdz $30$ utt.
Vai eksistē tāds vesels pozitīvs skaitlis, ka,
skaitli saskaitot ar viņa grupas numuru, iegūst 
$2014$?

<!--
Последовательные положительные целые числа, 
начиная с числа $1$, разбиты на группы по десять так, 
что в 1-ой группе находятся числа от $1$
до $10$, во 2-ой от $11$ до $20$, в 3-ой от $21$ до $30$ и т. д. 
Существует ли такое
положительное целое число, что сумма его 
самого с номером его группы равна $2014$?
-->

-----

# <lo-sample/> EE.LVT.2015.noorem.2

Ar $d_n$ apzīmējam skaitli vai skaitļa daļu, 
ko veido $n$ pēc kārtas sekojoši cipari $d$. 
Piemēram, pieraksts $4_3$ apzīmē skaitli $444$, bet $1_25_38_29_1$
apzīmē skaitli $11555889$. Zināms, ka ir spēkā vienādība
$3_a2_b5_c + 2_c5_a3_b = 5_38_17_d5_28_3$, 
kur $a$, $b$, $c$ un $d$ ir kaut kādi pozitīvi 
veseli skaitļi. Atrast $a$, $b$, $c$ un $d$.

<!--
Пусть $d_n$ обозначает число или часть числа, 
состоящюю из $n$ последовательных цифр $d$. 
Например, запись $4_3$ обозначает число $444$, а $1_25_38_29_1$
обозначает число $11555889$. Известно, что имеет место равенство
$3_a2_b5_c + 2_c5_a3_b = 5_38_17_d5_28_3$, 
где $a$, $b$, $c$ и $d$ какие-то положительные
целые числа. Найти числа $a$, $b$, $c$ и $d$.
-->

-----

# <lo-sample/> EE.LVT.2015.noorem.3

Pierādīt, ka patvaļīgu naturālu skaitļu $n$ un $m$
mazākā kopīgā dalāmā kvadrāts dalās ar to 
reizināmumu $nm$, bet 
$nm$ savukārt dalās ar skaitļu $n$ un $m$ 
lielākā kopīgā dalītāja kvadrātu. 

<!--
Доказать, что квадрат наименьшего общего 
кратного произвольных положительных целых 
чисел $n$ и $m$ делится на их произведение $nm$, а $nm$ в
свою очередь делится на квадрат 
наибольшего общего делителя чисел $n$ и $m$.
-->

-----

# <lo-sample/> EE.LVT.2015.vanem.1

Vai eksistē tāds vesels skaitlis $x$, ka 
$2 \leq x \leq m-1$, un $x^2 - x$ dalās ar $m$, ka  
a) $m = 2014$;  
b) $m = 2015$?

<!--
Существует ли такое целое число $x$, что $2 \leq x \leq m-1$, и 
$x^2 − x$ делится на $m$, если  
а) $m = 2014$;  
б) $m = 2015$?
-->


-----

# <lo-sample/> EE.LVT.2015.vanem.3

Atrast visus tos četrciparu naturālos skaitļus, kuru
dalījums ar savu ciparu summu ir mazākais iespējamais. 

<!--
Найти все такие четырёхзначные натуральные числа, результат деления
которых на сумму своих цифр будет наименьшим возможным.
-->


-----

# <lo-sample/> EE.LVS.2016.noorem.1

Skaitlī 
$$0,123456789101112\;\ldots\;998999$$
pēc komata ir visi pozitīvie skaitļi no $1$ līdz $999$.
Atrast šī skaitļa $2015$-to ciparu pēc komata.


<!--
В числе
$$0,123456789101112\;\ldots\;998999$$
после запятой идут подряд все положительные целые числа от $1$ до $999$.
Найти $2015$-ую после запятой цифру этого числа.
-->

----

# <lo-sample/> EE.LVS.2016.noorem.2

Nosauksim naturālu skaitli $n$ par interesantu, ja eksistē 
naturāls skaitlis $m$ un naturāli skaitļi $a$ un $b$, kas
mazāki par $m$, kuriem $\frac{m^2}{ab}=n$. Piemēram, skaitlis $10$ ir interesants, 
jo $\frac{20^2}{4\cdot{}10}=10$.  
Atrast vismazāko interesanto skaitli.

<!--
Назовём положительное целое число $n$ интересным, если существуют 
положительное целое число $m$ и положительные целые числа $a$ и $b$ меньшие
чем $m$, при которых $\frac{m^2}{ab}=n$. Например, число $10$ интересное, так как
$\frac{20^2}{4\cdot{}10}=10$.  
Найти наименьшее интересное число.
-->

----

# <lo-sample/> EE.LVS.2016.noorem.3

Katrā no trim gadījumiem, noskaidrot, vai 
eksistē divciparu skaitlis $n$, kurš nebeidzas ar nulli un apmierina attiecīgo nosacījumu:  
a) visi skaitļi, ko iegūst, ievietojot vienu vai dažas nulles starp tā cipariem, 
dalās ar sākotnējo skaitli.  
b) neviens skaitlis, ko iegūst, ievietojot vienu vai dažas nulles starp tā cipariem, 
nedalās ar sākotnējo skaitli.  
c) daži no skaitļiem, ko iegūst, ievietojot vienu vai dažas nulles starp tā cipariem, 
dalās, bet daži nedalās ar sākotnējo skaitli.

<!--
Существует ли не оканчивающееся на нуль двузначное число n такое, что  
а) все числа, получаемые при добавлении одного или нескольких нулей
между его цифрами, делятся на него?  
б) ни одно число, получаемое при добавлении одного или нескольких
нулей между его цифрами, не делится на него?  
в) какие-то из чисел, получаемых при добавлении одного или нескольких 
нулей между его цифрами, делятся, а какие-то не делятся на него?
-->

----

# <lo-sample/> EE.LVS.2016.noorem.6

Cik ir piecciparu skaitļu, kas dalās ar $8$ un nesatur savā pierakstā ciparu nulle?

<!--
Сколько пятизначных делящихся на 8 чисел не имеют в своей записи цифры нуль?
-->


----

# <lo-sample/> EE.LVS.2016.vanem.1

a) Atrast lielāko skaitli, kurš ir četru dažādu divciparu skaitļu lielākais kopīgais dalītājs.  
b) Atrast lielāko skaitli, kurš ir četru dažādu divciparu skaitļu mazākais kopīgais dalāmais.

<!--
а) Найти наибольшее число, являющееся наибольшим общим делителем
каких-то четырёх различных двузначных чисел.  
б) Найти наибольшее число, являющееся наименьшим общим кратным
каких-то четырёх различных двузначных чисел.
-->

----

# <lo-sample/> EE.LVS.2016.vanem.3

Dots naturāls skaitlis $n$, kam gan $n+1$, $n+3$, $n+7$ un $n+9$, gan arī
$n+31$, $n+33$, $n+37$ un $n+39$ - ir pirmskaitļi. Atrast atlikumu, dalot
skaitli $n$ ar $210$.

<!--
Дано натуральное число $n$ такое, что как $n+1$, $n+3$, $n+7$ и $n+9$, так и
$n+31$, $n+33$, $n+37$ и $n+39$ − простые числа. Найти остаток от деления
числа $n$ на $210$.
-->

----

# <lo-sample/> EE.LVT.2016.noorem.1

Kertu pieder viens cipars $4$ un cik patīk daudz ciparu $3$. 
Izvietojot šos ciparus kaut kādā secībā, Kertu nolēma izveidot skaitli, 
kurš dalītos ar iespējami daudziem skaitļiem no $1$ līdz $9$. 
Kāds ir mazākais šāds skaitlis, kuru viņa var izveidot, ja  
a) Kertu aplūko tikai tos skaitļus, kas satur abus ciparus?  
b) Skaitļiem nav noteikti jāsatur abi cipari?

<!--
У Карины есть одна цифра $4$ и сколько угодно цифр $3$. Располагая эти
цифры одну за другой, Карина решила составить число, 
которое бы делилось на как можно больше чисел от $1$ до $9$. 
Каково наименьшее такое число, если
а) Карина учитывает только те числа, которые содержат обе цифры?
б) числа не обязаны содержать обе цифры?
-->


----

# <lo-sample/> EE.LVT.2016.noorem.3

Veseli skaitļi $a,b,c,d,e,f$ apmierina nosacījumu $a+c+e=b+d+f$.
Pierādīt, ka $100000a + 10000b + 1000c + 100d + 10e + f$ dalās ar $11$.

<!--
Целые числа $a,b,c,d,e,f$ удовлетворяют условию $a+c+e=b+d+f$.
Доказать, что $100000a + 10000b + 1000c + 100d + 10e + f$ делится на $11$.
-->

----

# <lo-sample/> EE.LVT.2016.vanem.1

Vai eksistē tāds nepāru naturāls skaitlis $p$, ka 
no $p$ atšķirīgu skaitļa $p$ dalītāju summa ir lielāka par skaitli $p$? 

<!--
Существует ли такое нечётное положительное число $p$, 
что сумма отличных от $p$ положительных делителей числа $p$ больше числа $p$?
-->


----

# <lo-sample/> EE.LVT.2016.vanem.4

Izgudrotājs iepazīstināja karali ar savu jauno spēli uz rūtiņu laukuma ar
izmēru $9\times{}10$. Karalis apsolīja viņam par pirmo rūtiņu vienu 
rīsu graudiņu, par otru rūtiņu - arī vienu graudiņu, bet 
par katru nākamo rūtiņu - tik daudz graudiņu, cik ir iepriekšējās divās rūtiņās kopā.
Pierādīt, ka par pēdējo rūtiņu izgudrotājs, saskaņā ar karaļa solījumu, 
nopelnīs vairāk kā $2015^4$
rīsa graudiņu.


<!--
Мудрец представил королю свою новую интересную игру на клетчатом
поле размером $9\times{}10$. Король пообещал заплатить ему за первую 
клетку одно рисовое зёрнышко, за вторую клетку также одно зёрнышко, а за
каждую последующую клетку столько же зёрен, сколько за предыдущие
две клетки вместе. Доказать, что за последнюю клетку мудрец, согласно
обещанию короля, заработает более чем $2015^4$
рисовых зёрен.
-->


----

# <lo-sample/> EE.LVS.2017.noorem.2

Uz tāfeles uzrakstītas $11$ daļas, kuru skaitītāji un saucēji ir
visi naturālie skaitļi no $1$ līdz $22$. Kāds lielākais iespējamais
skaits no šīm daļām var būt veseli skaitļi? 

<!--
На доске записано $11$ дробей, числителями и знаменателями которых 
являются все целые числа от $1$ до $22$. Каково наибольшее возможное 
количество дробей, значения которых являются целыми числами?
-->

----

# <lo-sample/> EE.LVS.2017.noorem.3

Juku izvirzīja matemātiskā pulciņā šādu hipotēzi: Vienmēr, 
ja divu savstarpēju pirmskaitļu $x$ un $y$ reizinājums 
dalās ar citu divu savstarpēju pirmskaitļu $a$ un $b$ reizinājumu, 
tad vismaz viens no skaitļiem $x$ un $y$ dalās ar $a$ vai ar $b$. 
Vai Juku hipotēze ir patiesa?  
*Piezīme:* Divus veselus skaitļus $a$ un $b$ sauc par savstarpējiem 
pirmskaitļiem, ja to lielākais kopīgais dalītājs $\mbox{НОД}(a, b) = 1$.

<!--
Юра выдвинул на математическом кружке следующую гипотезу: всегда,
когда произведение двух взаимно простых целых чисел $x$ и $y$ делится на
произведение двух взаимно простых целых чисел $a$ и $b$, то хотя бы одно
из чисел $x$ и $y$ делится на $a$ или на $b$. Выполняется ли гипотеза Юры?
Примечание. Говорят, что целые числа $a$ и $b$ взаимно просты, если
$\mbox{НОД}(a, b) = 1$.
-->

----

# <lo-sample/> EE.LVS.2017.noorem.6

Vai eksistē tāds naturāls skaitlis $n$, kuram ir tieši $9$ pozitīvi 
dalītāji, bet visus tā dalītājus var novietot tabulā 
$3\times{}3$ tā, lai katrā rindiņā, katrā kolonnā un abās diagonālēs 
skaitļu reizinājums būtu viens un tas pats?

<!--
Найдётся ли такое положительное целое число $n$, у которого ровно 
$9$ положительных делителей, а все его делители можно расположить 
в таблице $3\times{}3$ таким образом, что произведение чисел каждой строки, каждого
столбца и обеих диагоналей будет одинаковым?
-->

----

# <lo-sample/> EE.LVS.2017.vanem.2

Definējam virkni $a_1=1$ un $a_n = n \cdot a_{\lfloor{}n/2\rfloor}$, 
visiem $n>1$. Pierādīt, ka $a_n>n^2$  
katram $n \geq 12$.
*Piezīme:* Skaitļa $x$ veselā daļa $\lfloor x \rfloor$ ir lielākais veselais skaitlis, kas 
nepārsniedz $x$. Piemēram, $\lfloor 4,6 \rfloor = 4$. Tātad $a_2 = 2 \cdot a_1$, 
$a_3 = 3 \cdot a_1$, $a_4 = 4 \cdot a_2$, 
$a_5 = 5 \cdot a_2$ utt.


<!--
Зададим $a_1=1$ и $a_n = n \cdot a_{\lfloor{}n/2\rfloor}$
для каждого $n>1$. Доказать, что $a_n>n^2$
для каждого $n \geq 12$.
*Примечание.* Целая часть $\lfloor x \rfloor$ числа $x$ − это наибольшее целое число, не
превышающее числа $x$. Например, $\lfloor 4,6 \rfloor = 4$. Т.е. $a_2 = 2 \cdot a_1$, 
$a_3 = 3 \cdot a_1$, $a_4 = 4 \cdot a_2$, 
$a_5 = 5 \cdot a_2$ и т.д.
-->

----

# <lo-sample/> EE.LVS.2017.vanem.3

Kati un Peeter spēlē sekojošu spēli. Vispirms Kati uzraksta uz tāfeles
kādu naturālu skaitli $a > 2016$. Pēc tam Peeter pieraksta jaunus skaitļus: 
katrā solī viņš pievieno skaitli $2016b + 1$, kur $b$
− lielākais skaitlis, kas tobrīd ir uz tāfeles. Peeter uzvar, 
ja viņš kādā solī uzraksta uz tāfeles skaitli, kas dalās ar $2017$. Ja viņš to nevar izdarīt, 
tad uzvar Kati. Vai Kati var uzvarēt, un ja jā, tad kāds ir mazākais skaitlis $a$, kas
viņai jāuzraksta uz tāfeles, lai uzvarētu? 

<!--
Катя и Петя играют в следующую игру. Вначале Катя записывает на доске
какое-то целое положительное число $a > 2016$. Затем Петя дописывает
на доску числа, на каждом шаге добавляя туда число $2016b + 1$, где $b$
− наибольшее на данный момент число на доске. Петя выиграет, если на
каком-то шаге запишет на доске число, делящееся на $2017$. Если он это
сделать не может, то выигрывает Катя. Может ли Катя выиграть игру и
если да, то каково наименьшее число $a$, которое она должна записать на
доске, чтобы выиграть?
-->

----

# <lo-sample/> EE.LVS.2017.vanem.6

Atrast visus naturālos skaitļus $n$, kuriem visus $n$ pozitīvos dalītājus
var bez atkārtošanās izrakstīt taisnstūrveida tabulā tā, lai katrā tabulas 
šūnā būtu tieši viens dalītājs, skaitļu summas visās tabulas rindiņās ir vienādas, 
un arī skaitļu summas visās tabulas kolonnās ir vienādas. 

<!--
Найти все целые положительные числа $n$, при которых все 
положительные делители числа $n$ можно без повторений расположить 
в прямоугольную таблицу так, что в каждой ячейке находится ровно один делитель,
сумма чисел в каждой строке одинакова, а также сумма чисел в каждом
столбце одинакова.
-->

----

# <lo-sample/> EE.LVT.2017.noorem.2

Juku iedomājās trīsciparu skaitli. Ja šī skaitļa ciparus pieraksta pretējā secībā, 
tad iegūst to pašu trīsciparu skaitli. Juku ievēroja, ka, pieskaitot iedomātajam 
skaitlim $2016$, iegūsim četrciparu skaitli, kurš arī nemainās, pierakstot
tā ciparus pretējā secībā. Kādu skaitli iedomājās Juku? 

<!--
Костя задумал трёхзначное число. Если записать цифры этого числа в обратном порядке, 
то получим то же самое трёхзначное число. Костя заметил, что если прибавить к 
задуманному числу $2016$, то получим четырёхзначное число, 
которое не изменится, если записать его цифры в обратном
порядке. Какое число задумал Костя?
-->

----

# <lo-sample/> EE.LVT.2017.noorem.3

Ar $n$ apzīmēts naturāls skaitlis. Pierādīt, ka mazākais kopīgais dalāmais 
jebkuriem $n$ pēc kārtas sekojošiem naturāliem skaitļiem dalās ar mazāko kopīgo 
dalāmo skaitļiem $1,2,\ldots,n$.  
*Piezīme:* Par jebkura skaitļu daudzuma mazāko kopīgo dalāmo sauc mazāko naturālo skaitli, 
kurš dalās ar visiem šiem skaitļiem. 

<!--
Пусть $n$ − положительное целое число. Доказать, что наименьшее общее
кратное любых $n$ последовательных положительных целых чисел делится
на наименьшее общее кратное чисел $1,2,\ldots,n$.  
*Примечание.* Наименьшим общим кратным любого количества положительных 
целых чисел называют наименьшее положительное целое число,
которое делится на все эти числа.
--> 

----

# <lo-sample/> EE.LVT.2017.noorem.4

a) Vai jebkuriem diviem vienādas paritātes skaitļiem $a$ un $b$ var atrast 
tādus daļskaitļus $x$ un $y$, ka gan $x+y$, gan $ax+by$ ir veseli skaitļi?  
b) Tas pats jautājums, ja $a$ un $b$ ir dažādas paritātes skaitļi.  
*Piezīme:* Par daļskaitli saucam skaitli, kas nav nav vesels.  
Paritāte izsaka, vai skaitlis dalās ar $2$. Tādējādi divi veseli skaitļi 
ar vienādu paritāti būs abi pāru vai abi nepāru. Bet no diviem dažādas paritātes
skaitļiem viens ir pāru un otrs ir nepāru.

<!--
а) Можно ли при любых заданных целых числах одинаковой чётности $a$
и $b$ найти такие дробные числа $x$ и $y$, что как $x+y$, так и $ax+by$
будут целыми числами?  
б) Тот же вопрос, если $a$ и $b$ разной чётности.  
*Примечание.* Дробным числом называют число, которое не является целым. 
Чётность показывает, делится ли число на $2$. Таким образом, два
целых числа одинаковой чётности либо оба чётные, либо оба нечётные, а
среди двух целых чисел разной чётности одно чётное и одно нечётное.
-->


----

# <lo-sample/> EE.LVT.2017.vanem.1

Sniegpārsliņas aplīšos ierakstīti visi naturālie skaitļi no $1$ līdz $13$ tā, 
ka piecu skaitļu summa uz katras no taisnēm un arī septiņu centrālo 
skaitļu summa visas ir vienādas savā starpā. Atrast šo summu, ja
zināms, ka tā ir mazākā iespējamā.

![Sniegpārsliņa](EE.LVT.2017.vanem.1.png)

<!--
В снежинке в кружках записаны все натуральные
числа от 1 до 13 так, что суммы пяти чисел, находящихся на каждой из прямых, 
а также сумма семи центральных чисел, все равны между собой. 
Найти эту сумму, если известно, что она наименьшая из возможных.
-->


----

# <lo-sample/> EE.LVT.2017.vanem.2

Cik veidos var aizstāt burtus ar cipariem tā, lai iegūtu pareizu 
saskaitīšanas darbību? Vienādiem burtiem visur atbilst vienādi cipari, 
dažādiem burtiem - dažādi cipari. 

![Skaitļu rēbuss](EE.LVT.2017.vanem.2.png)

<!--
Сколькими способами можно заменить буквы на цифры так, чтобы получилось 
корректное сложение? Одинаковым буквам везде соответствуют одинаковые цифры, 
разным буквам разные цифры.
-->

----

# <lo-sample/> EE.LVT.2017.vanem.3

Mašai dārzā ir elektriskais karuselis, kurā viņa katru dienu vizinās. 
Viņai patīk kārtība, tādēļ pēc lietošanas vienmēr atstāj karuseli 
vienā un tanī pašā stāvoklī. Tomēr katru nakti dārzā iezogas trīs lāči
un ķeras pie karuseļa griešanas. Lāču tēvs vienā solī pagriež karuseli 
tieši par $\frac{1}{7}$ no pilna apgrieziena. 
Lāču māte vienā solī pagriež karuseli tieši par 
$\frac{1}{9}$ no pilna apgrieziena. Mazais lācītis vienā solī pagriež karuseli 
tieši par $\frac{1}{32}$ no pilna apgrieziena. Katrs no lāčiem var griezt
karuseli tik reižu, cik vēlas. Cik dažādus karuseļa stāvokļus Maša var
ieraudzīt nākamajā rītā?

<!--
У Маши в саду есть электрическая карусель, на которой она катается
каждый день. Она любит порядок и поэтому после использования всегда
оставляет карусель в одном и том же положении. Однако каждую ночь
в сад прокрадываются три медведя и принимаются вращать карусель.
Мишка-папа за раз поворачивает карусель ровно на
$\frac{1}{7}$
оборота. Мишка-мама за раз поворачивает карусель ровно на
$\frac{1}{9}$ оборота. Медвежёнок за
раз поворачивает карусель ровно на
$\frac{1}{32}$ оборота. Каждый из медведей может вращать 
карусель столько раз, сколько захочет. Сколько различных
вариантов положения карусели может обнаружить Маша утром?
-->

----

# <lo-sample/> EE.LVS.2018.noorem.3

Mari ieraksta burtnīcā $8$ pirmskaitļus, kas mazāki par $200$ (starp 
šiem pirmskaitļiem var būt arī atkārtojumi). Pirmajam 
pirmskaitlim viņa pieskaita $1$, otrajam $2$, trešajam $3$, utt., pēdējam $8$. 
Pēc tam visas $8$ summas sareizina. Atrast lielāko $2$ pakāpi, ar kuru var 
dalīties iegūtais reizinājums.
<!--
Маша записывает в тетради $8$ простых чисел, меньших чем $200$ (среди
простых чисел могут быть повторяющиеся). Далее к первому простому
числу она прибавляет $1$, ко второму $2$, к третьему $3$ и т.д. 
пока не прибавит к последнему $8$, затем перемножает все полученные $8$ сумм. Найти
наибольшую степень числа $2$, на которую может делится полученное произведение.
-->

----

# <lo-sample/> EE.LVS.2018.noorem.4

Cik veidos zīmējumā var aizstāt burtus ar cipariem tā, lai rastos pareiza darbība? 
Vienādus burtus jāaizstāj ar vienādiem cipariem, dažādus burtus - ar dažādiem cipariem. 

![Skaitļu rēbuss](EE.LVS.2018.noorem.4.png)

<!--
Сколькими способами можно на рисунке заменить буквы цифрами так, 
чтобы получилось корректное действие? Одну и ту же букву нужно заменять на ту же
цифру, разные буквы на разные цифры.
-->

----

# <lo-sample/> EE.LVS.2018.vanem.2

Atrast lielāko naturālo skaitli, kas nepārsniedz $500$ un kuram 
nevar atrast citu naturālu skaitli, kas ir mazāks par $500$ un kurš
dalītos ar mazāk dažādiem pirmskaitļiem.

<!--
Найти наибольшее целое положительное число меньше чем 500, 
для которого не найдётся ни одного целого положительного числа меньше чем
$500$, имеющего больше различных простых делителей.
-->

----

# <lo-sample/> EE.LVS.2018.vanem.3

Par racionālu skaitļu $u$ un $v$ mediānu sauc skaitli $x = \frac{a + c}{b + d}$, kur
$\frac{a}{b}$ un $\frac{c}{d}$ Ir attiecīgi skaitļu $u$ un $v$ izteiksmes nesaīsināmu daļu veidā. 
Pierādīt, ka jebkuriem dažādiem pozitīviem racionāliem skaitļiem $u$ un $x$ var atrast
bezgalīgi daudzus pozitīvus racionaļus skaitļus $v$, kam $x$ ir $u$ un $v$ mediāna.

<!--
Медианта рациональных чисел $u$ и $v$ − это число $x = \frac{a + c}{b + d}$, где
$\frac{a}{b}$ и
$\frac{c}{d}$
являются соответственно представлениями чисел $u$ и $v$ в виде несократимых дробей.
Доказать, что для любых различных положительных рациональных чисел
$u$ и $x$ можно найти бесконечно много положительных рациональных чисел 
$v$ таких, что $x$ будет медиантой $u$ и $v$.
-->

----

# <lo-sample/> EE.LVT.2018.noorem.2

Pierakstā
$$0\;\;1\;\;2\;\;3\;\;4\;\;5\;\;6\;\;7\;\;8\;\;9$$
starp katriem diviem pēc kārtas sekojošiem cipariem liek zīmi "plus" vai "mīnuss".  
a) Atrast mazāko pozitīvo nepāru skaitli, kuru nevar iegūt kā šādas izteiksmes vērtību.  
b) Atrast mazāko pozitīvo pāru skaitli, kuru nevar iegūt kā šādas izteiksmes vērtību. 



<!--
В записи
$$0\;\;1\;\;2\;\;3\;\;4\;\;5\;\;6\;\;7\;\;8\;\;9$$
между каждыми двумя идущими подряд цифрами ставят знак "плюс" или
"минус".  
а) Найти наименьшее положительное нечётное число, которое невозможно получить как значение такого выражения.  
б) Найти наименьшее положительное чётное число, которое невозможно
получить как значение такого выражения.
-->

----

# <lo-sample/> EE.LVT.2018.noorem.3

Vai var atrast tādus četrus dažādus pirmskaitļus, no kuriem izvēloties jebkurus trīs, to summa arī ir pirmskaitlis. 

<!--
Найдутся ли четыре различных простых числа, сумма любых трёх из которых будет также простым числом?
-->


----

# <lo-sample/> EE.LVT.2018.vanem.2

Taisnleņka trijstūrī visi malu garumi ir veseli skaitļi. 
Vienas katetes garums ir nepāru pirmskaitlis $p$. Atrast divu 
pārējo šī trijstūra malu garumus. 

<!--
В прямоугольном треугольнике длины всех сторон целочисленны. Длина
одного катета − нечётное простое число $p$. Найти длины других двух
сторон этого треугольника.
--> 

----

# <lo-sample/> EE.LVT.2018.vanem.3

Vai eksistē pieci dažādi pirmskaitļi, no kuriem izvēloties jebkurus trīs, to summa arī ir pirmskaitlis?

<!--
Найдутся ли пять различных простых чисел, сумма каждых трёх из которых также является простым числом?
-->

----

# <lo-sample/> EE.LVS.2019.noorem.1

Skaitļus $1,2,\ldots,2018$ pieraksta vienu pēc otra bez atstarpēm, 
turklāt no pieraksta izlaiž visus ciparus $8$. Vai iegūtais skaitlis
dalās ar $3$?

<!--
Числа $1,2,\ldots,2018$ записываются одно за другим без промежутков,
причём все цифры $8$ при записи пропускаются. Делится ли полученное число
на $3$?
-->

----

# <lo-sample/> EE.LVS.2019.noorem.3

Naturāli skaitļi $n$, $m$ un $k$ ir tādi, ka $\mbox{MKD}(m,k)$ dalās ar
$n$, bet $\mbox{MKD}(n,k)$ dalās ar $m$. Pierādīt, ka
$n\cdot\mbox{LKD}(m,k) = m\cdot\mbox{LKD}(n,k)$.  
*Piezīme.* $\mbox{LDK}(a,b)$ apzīmē skaitļu $a$ un $b$ lielāko kopīgo dalītāju, bet
$\mbox{MKD}$ apzīmē skaitļu $a$ un $b$ mazāko kopīgo dalāmo. 


<!--
Целые положительные числа $n$, $m$ и $k$ таковы, что $\mbox{НОК}(m,k)$ делится на
$n$, а $\mbox{НОК}(n,k)$ делится на $m$. Доказать, что 
$n\cdot\mbox{НОД}(m,k) = m\cdot\mbox{НОД}(n,k)$.  
*Примечание.* $\mbox{НОД}(a,b)$ обозначает наибольший общий делитель чисел $a$
и $b$, а $\mbox{НОК}(a,b)$ – наименьшее общее кратное чисел $a$ и $b$.
-->

----

# <lo-sample/> EE.LVS.2019.noorem.4


Brālim Jüri ir māsa Mari. Viņu māte gaida dvīņus. Ja piedzimtu
abi puisīši, tad Jüri būs tieši $k$ reizes vairāk brāļu nekā māsu. 
Ja piedzimtu abas meitenītes, tad Mari būs $l$ reizes mazāk māsu nekā brāļu. 
Tomēr piedzima viens puisītis un viena meitenīte. Cik reizes piedzimušajam 
puisītim ir vairāk brāļu nekā māsu? Un cik reizes piedzimušajai meitenītei
mazāk māsu kā brāļu?

<!--
Мама Юры и Маши ждёт двойняшек. Если родятся мальчики, то у Юры
будет ровно в $k$ раз больше братьев, чем сестёр. Если родятся девочки, то
у Маши будет ровно в $l$ раз меньше сестёр, чем братьев. Однако подходит
время и рождаются мальчик и девочка. Во сколько раз у родившегося
мальчика больше братьев, чем сестёр, и во сколько раз у родившейся
девочки меньше сестёр, чем братьев?
-->

----

# <lo-sample/> EE.LVS.2019.noorem.6

Skaitļus no $1$ līdz $9$ ieraksta tabulā $3 \times 3$ rūtiņas tā, ka
ikvienā rūtiņā ir viens skaitlis un skaitļi neatkārtojas.
Atrast lielāko iespējamo skaitu ar tādu rūtiņu pāriem, kam ir 
kopīga mala un kur skaitlis no vienas rūtiņas dalās ar skaitli no otras rūtiņas.

<!--
Числа от $1$ до $9$ записываются в ячейки таблицы $3 \times 3$ 
так, что в каждой ячейке ровно одно число, причём числа не повторяются. 
Найти наибольшее возможное число пар имеющих общую сторону ячеек, 
где число из первой ячейки делится на число из второй ячейки.
-->

----

# <lo-sample/> EE.LVS.2019.vanem.3

Bēniņos atrastam kalkulatoram ir taustiņi no $1$ līdz $9$ 
un viens darbības taustiņš $\otimes$, kur 
$x \otimes y$ apzīmē skaitli $x+\frac{x\cdot{}y}{x-y}$. 
Pirmoreiz nospiežot darbības taustiņu, uz ekrāna paliek 
līdz tam ievadītais skaitlis, bet pēc katras nākamās 
šī taustiņa nospiešanas uz ekrāna parādās skaitlis $x \otimes y$, 
kur $y$ - vesels skaitlis, kurš ievadīts tieši pirms iepriekšējās darbības 
taustiņa nospiešanas, bet $x$ - skaitlis, kurš bija uz ekrāna 
līdz skaitļa $y$ ievadīšanai. Piemēram, ja lietotājs nospiež taustiņus 
secībā $2$, $2$, $\otimes$, 
$3$, $3$, $\otimes$, $4$, $4$, $\otimes$, 
tad uz ekrāna būs attiecīgi redzami skaitļi $2$, $22$, $22$, $3$, $33$, $-44$
(darbības $22 \otimes 33$ rezultāts), $4$, $44$, $-22$ 
(darbības $(-44) \otimes 44$ rezultāts).
Ja lietotājs nospiež darbības taustiņu pašā sākumā, nospiež to divreiz pēc 
kārtas vai pieļauj tādas darbības izpildi, kuras vērtība nav vesels skaitlis, 
tad kalkulators salūst. Vai uz šī kalkulatora var uz ekrāna iegūt skaitli $2018$? 

<!--
У найденного на чердаке калькулятора есть клавиши от $1$ до $9$ и клавиша
действия $\otimes$, где $x \otimes y$ обозначает число $x+\frac{x\cdot{}y}{x-y}$. 
При первоначальном
нажатии клавиши действия на экране остаётся введённое до этого число,
а после каждого следующего нажатия на экране появляется число $x \otimes y$,
где $y$ – целое число, введённое непосредственно перед нажатием клавиши
действия, а $x$ – число, бывшее на экране до ввода числа $y$. Например,
если пользователь нажимает клавиши в порядке $2$, $2$, $\otimes$, 
$3$, $3$, $\otimes$, $4$, $4$, $\otimes$, 
то на экране соответственно будут видны числа $2$, $22$, $22$, $3$, $33$, $-44$
(результат действия $22 \otimes 33$), $4$, $44$, $-22$ 
(результат действия $(-44) \otimes 44$).
Если пользователь нажимает клавишу действия в самом начале, нажимает
её два раза подряд или допускает выполнение действия, значения которого
не является целым числом, то калькулятор выходит из строя. Можно ли
на этом калькуляторе получить на экране число $2018$?
-->

----

# <lo-sample/> EE.LVT.2019.noorem.1

a) Vai eksistē divi dažādi naturāli skaitļi, kuru kvadrātu summa ir 
kāda vesela skaitļa kubs?  
b) Tas pats jautājums, ja kuba vietā ir ceturtā pakāpe. 

<!--
а) Найдутся ли два различных положительных целых числа, сумма
квадратов которых является кубом какого-то целого числа?
б) Тот же вопрос, если вместо куба четвёртая степень.
-->

----

# <lo-sample/> EE.LVT.2019.noorem.3

Nerātnais Juku nodzēsa desmitciparu skaitlim uz tāfeles 
divus ciparus tā, ka palika pieraksts 
$$\ast\,2\,0\,1\,8\ast2\,0\,1\,9$$ 
(zvaigznītes apzīmē nodzēstos ciparus). Atrast visas iespējas, 
kāds varēja būt sākotnējais skaitlis, ja zināms, ka tas
dalījās ar $99$. 

<!--
Шаловливый Юра стёр в написанном на доске десятизначном числе две
цифры так, что осталась запись $\ast{}2018\ast{}2019$ (звёздочки обозначают 
стёртые цифры). Найти все возможности, чему могло равняться изначальное
число, если известно, что оно делилось на $99$.
-->

----

# <lo-sample/> EE.LVT.2019.noorem.4

Uz datora ekrāna cits zem cita parādās skaitļi. 
Vienmēr, ja pēc kārtas parādījās skaitļi $a$ un $b$, 
tad nākamais tur parādīsies skaitlis $ab-1$. 
Pirmie uz ekrāna parādījās skaitļi $1$ un $2$. 
Atrast skaitli, kurš tur parādīsies kā $2018$-tais.

<!--
На экране компьютера одно под другим поочерёдно появляются числа.
Всегда, когда друг за другом появляются числа $a$ и $b$, 
следующим появляется число $ab-1$. 
Первыми на экране появились числа $1$ и $2$. Найти
число, которое появилось $2018$-м.
-->

----

# <lo-sample/> EE.LVT.2019.vanem.1

Sauksim skaitli par *skaistu*, ja tas atšķiras
no kāda vesela skaitļa kvadrāta mazāk nekā par $10\%$. 
Pierādīt, ka vienādojumam 
$$x^3 + y^3 = z^2$$
ir bezgalīgi daudz risinājumu, 
kur $x$, $y$ un $z$ ir skaisti naturāli skaitļi. 

<!--
Назовём число красивым, если оно отличается 
от квадрата какого-то целого числа меньше, 
чем на $10\%$. Доказать, что у уравнения
$$x^3 + y^3 = z^2$$
есть бесконечно много решений, 
где $x$, $y$ и $z$ – красивые целые положительные числа.
-->

----

# <lo-sample/> EE.LVT.2019.vanem.3

Naturāli skaitļi $a$ un $b$ ir tādi, 
ka daļas 
$$\frac{5a^4 + a^2}{b^4 + 3b^2 + 4}$$
vērtība ir vesels skaitlis. Pierādīt, ka $a$ ir salikts
skaitlis. 

<!--
Целые положительные числа $a$ и $b$ таковы, что значение дроби
$$\frac{5a^4 + a^2}{b^4 + 3b^2 + 4}$$
целочисленно. Доказать, что $a$ – составное число.
-->


