(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** #<b>Abstract:</b># Our first Lab Exercise contains
a few samples, which require so called 'classical axioms'. 
This document explains, how to use them.
*)

(** * What is Intuitionistic logic *)

(** Propositional logic expressions that are 
straightforward to prove using Coq tactics
are part of the Intuitionistic (Constructive) logic.
It does not allow existence proofs 'from the contrary'.
In such proofs we first assume that some object does not
exist, get a contradiction and conclude that the
object therefore must exist.
*)

(** Such proofs are problematic, because 
they do not provide even a totally impractical method
allowing the construct the
objects that presumably should exist.
Most contemporary mathematicians do not care about this 
difference, they simply use classical logic.
Computer scientists should at least understand the 
difference, because non-constructive proofs cannot
yield any algorithms. *)

(** * Classical proofs in 'real' mathematics *) 

(** Classical (non-constructive) proofs may appear in
answering various natural-looking questions. 
For example, 
#<ul><li><a href='https://bit.ly/2Rpbeju'>Can an irrational number raised to #
#an irrational power be a rational number?</a></li>#
#<li><a href='https://bit.ly/2Ruu5tL'>Intermediate Value Theorem</a>: #
#If a continuous real-valued function defined on a #
#closed interval <tt>[a;b]</tt> has two different values #
#<tt>f(a)</tt> and <tt>f(b)</tt>, then it also takes all the #
#intermediate values on that segment.</li>#
#<li>Consider game 'Chomp' where cookies are laid out in a #
#rectangular grid, and the cookie in the upper left corner is #
#poisoned. Even though there must exist a (constructive) winning strategy #
#for one of the players, it is possible to provide a nonconstructive #
#proof that the 1st player always wins without any deep analysis. #
#(See Example 12, p.102, in Chapter 1.8 of the K.Rosen's textbook).</li></ul>#
#Many of these results can be stated and proved in a constructive #
#way as well. Sometimes though, there is a deeper reason, why #
#some math result is not constructive.#
*)


(** * Classical proofs in Coq *)

(** All the non-constructive things can be imported from 
Coq library #<tt>Classical_Prop</tt>#
Furthermore, if you wish to try non-constructive things in Coq and
see some proofs, there is a chapter in the Software Foundations
textbook: 
#<a href='https://bit.ly/38Io0Q7'>Classical vs. Constructive Logic</a>#.
*)
(** At the very end of this chapter, it is stated, that there 
are multiple possible formulations of 'nonconstructive' (i.e. classical) 
axiom. They are all logically equivalent. Assuming any one 
of them immediately means that you can prove all the others. 
Therefore, there is only one 'flavor' of nonconstructive 
mathematics. The textbook leaves as an exercise to prove
that from any statement you can prove any other one.
*)
(** Here are the five main nonconstructive statements.
Any one of them can be picked as an 'Axiom' (something you want to assume
without any proof), the remaining four can be 'Lemmas' - they 
can be proven using that axiom and the proof tactics from Coq.
*)

(** ** Excluded Middle *)

(** In the Coq library #<tt>Classical_Prop</tt>#
this is the only axiom, but if you assume another axiom, 
this can also become Lemma. This is the rule known 
in the Ancient logic textbooks - either 'P' or 'not P' 
must be true. (Also known with the Latin name: 'Tertium Non Datur')
<<
  Axiom excluded_middle: forall P: Prop,
    P \/ ~P.
>>
*)

(** ** Pierce Lemma *)

(** Here is another result (written without negations, 
which surprisingly, also allows you to prove all kinds 
of nonconstructive proofs 'from the contrary'. 
It happens to be also #<tt>sample1_3</tt># in our lab exercise.
<<
  Lemma peirce: forall P Q: Prop,
    ((P -> Q) -> P) -> P.
>>
*)

(** ** Double Negation Lemma *)

(** This lemma tells that we can always drop two 
negations, and the proposition will stay valid. 
<<
  Lemma double_negation_elimination: forall P:Prop,
    ~~P -> P.
>>
*) 

(** ** De Morgan's Law *)

(** This is just one variant; other De Morgan's 
laws can be written by switching the order in the implication 
or changing disjunction to conjunction and vice versa. 
Some of these laws can be proven constructively, but this 
one cannot.
<<
  Lemma de_morgan_not_and_not: forall P Q:Prop,
    ~(~P /\ ¬Q) -> P \/ Q.
>> 
*) 

(** ** Implication expressed as disjunction *) 

(**
<<
  Lemma implies_to_or: forall P Q:Prop,
    (P -> Q) -> (~P \/ Q).
>>
*) 



(** * Sample Proofs *)


(** Any non-constructive proofs start by 
importing this external library. 
If you want to see what's inside this library, you can do 
one of the following: 
#<ul><li>Read HTML documentation: #
#<a href='https://bit.ly/2RP8gnt'>Classical_Prop.html</a></li> #
#<li>Inspect the same source code in GitHub: #
#<a href='https://bit.ly/2vi7DuY'>Classical_Prop.v</a></li> #
#<li>Import and then print the definitions in that library.</li></ul>#
<<
  Require Import Classical_Prop.
  Print Classical_Prop.
>>
The above two commands will display all the available
definitions in a compact, readable format.
*)


Require Import Classical_Prop.


(** ** Double Negation Proofs *)

(** This can be verified by truth tables: 
<<
  forall a: Prop, a <-> ~~a.
>>
It means an obvious thing: Every proposition is 
equivalent to the double negation of that
proposition. As it turns out, a half of this
statement is not constructive.
*)
(** In the Coq library #<tt>Classical_Prop</tt>#
this lemma is called #<tt>NNPP</tt># *)

Lemma double_negation_elimination: forall a: Prop, ~~a -> a. 
Proof.
  intros a. 
  unfold not.
  intros H.
  destruct (classic a) as [aTrue | aFalse].
  exact aTrue.
  pose (H aFalse) as CONTRA.
  contradiction CONTRA.
Qed.

(** Next, let us consider #<tt>'a -> ~~a'</tt># The opposite implication is intuitionist,
it does not need any classical lemmas:
  - Peel off the 'forall' variable. Write #<tt>'intros a'</tt># to avoid renaming the variable.
  - Rewrite not: #<tt>'~~a'</tt># becomes #<tt>'a -> ((a -> False) -> False)'</tt>#.
  - Assume that #<tt>'a'</tt># is true (introduce hypothesis #<tt>'a'</tt># 
  - Next assume that #<tt>'a'</tt># is false (introduce hypothesis #<tt>'a-&gt;False'</tt>#.
  - Now both hypotheses are contradictory.
  - Therefore any goal (#<tt>False</tt># in our case) is proven: #<tt>'a'</tt># 
  and #<tt>'a-&gt;False'</tt># imply anything.

In Coq this proof looks like this:
*)


Lemma double_negation_rev: forall a: Prop, a -> ~~a.
Proof.
  intros a.
  unfold not. 
  intros aTrue.
  intros aFalse.
  pose (aFalse aTrue) as CONTRA.
  contradiction CONTRA.
Qed.

(** Once we have both negation manipulation lemmas, we can 
prove some variations. In this example we proceed like this:
  - Peel of the #<tt>forall a</tt># variable.
  -.Apply the #<tt>double_negation_rev</tt># lemma to get 
rid of two negations in the beginning: #<tt>~ ~ (~ ~ a -&gt; a)</tt>#
becomes #<tt>~ ~ a -&gt; a</tt>#.
  - Next, use the #<tt>double_negation_elimination</tt># to get exactly 
the same result we have to prove.
*)

Lemma double_negation_variant: forall a, ~ ~ (~ ~ a -> a).
Proof. 
  intros a. 
  apply double_negation_rev.
  pose (double_negation_elimination a) as H.
  exact H.
Qed.





(** ** Contrapositive lemmas *)
(** Same as before: it turns out that contrapositive law
is 'classical' (non-constructive) in one direction, 
but is constructive/intuitionist in the opposite direction. 

This result uses
#<tt>double_negation_elimination</tt>#, which in turn relies on the 
#<tt>classic</tt># axiom.
*)


Lemma hard_contrapos: forall a b:Prop, (~b -> ~a) -> (a -> b).
Proof.
  intros a b. 
  intros H1.
  intros aTrue.
  apply double_negation_elimination.
  intros H2.
  apply H1 in H2.
  contradiction.
Qed.

(** In contrast to the previous example, which 
used earlier (non-constructive/classical) 
This does not require to import any external libraries: *)

Lemma easy_contrapos: forall a b:Prop, (a->b)->(~b->~a).
Proof. 
  intros a b. 
  intros H1.
  intros bFalse.
  unfold not.
  intros aTrue.
  apply bFalse.
  apply H1.
  exact aTrue.
Qed.


(** ** Some proofs of Peirce lemmas *)
(** This proof uses #<tt>double_negation_elimination</tt>#
also known as #<tt>NNPP</tt># lemma to prepend 
two negations.
*)

Lemma Peirce1 : forall a:Prop, ((a -> False) -> a) -> a.
Proof.
  intros.
  apply double_negation_elimination.
  unfold not.
  intros aFalse.
  pose (H aFalse) as aTrue.
  pose (aFalse aTrue) as CONTRA.
  contradiction CONTRA.
Qed.

(** Now the same lemma is proven using the #<tt>classic</tt>#
axiom. It is named #<tt>Peirce2</tt># since the names of 
lemmas must not be conflicting.
*)

Lemma Peirce2 : forall a:Prop, ((a -> False) -> a) -> a.
Proof.
  intros a. 
  intros H. 
  destruct (classic a) as [aTrue | aFalse].
  exact aTrue.
  pose (H aFalse) as aTrue.
  exact aTrue.
Qed.


(** ** De Morgan's laws *)

(** As we already saw in other lemmas, 
one direction of a lemma may be 'classic' (requiring
the law of excluded middle). 
*)

Lemma de_morgan_not_and_not: forall a b:Prop,
  ~(~a /\ ~b) -> a \/ b.
Proof. 
  intros a b.
  unfold not.
  intros H.
  pose (classic a) as H1.
  destruct H1 as [aTrue | aFalse]. 
  left; exact aTrue.
  pose (classic b) as H2.
  destruct H2 as [bTrue | bFalse].
  right; exact bTrue.
  assert (~a /\ ~b) as H3.
  split.
  exact aFalse.
  exact bFalse.
  pose (H H3) as CONTRA.
  contradiction CONTRA.
Qed.

(** And the other direction does not need any classical things.
This proof is intuitionist.
*)


Lemma de_morgan_not_rev: forall a b:Prop,
  a \/ b -> ~(~a /\ ~b).
Proof. 
  intros a b.
  intros H1.
  unfold not.
  intros H2.
  destruct H2 as [H3 H4].
  destruct H1 as [H5 | H6].
  contradiction. 
  contradiction.
Qed.

(** ** Rewrite implication as a disjunction *)
(** Such manipulations also need the 'classic' axioms.
*)


Lemma implies_to_or: forall a b:Prop,
  (a -> b) -> (~a \/ b).
Proof. 
  intros a b.
  intros H1.
  pose (classic a) as H2.
  destruct H2 as [aTrue | aFalse].
  pose (H1 aTrue) as bTrue.
  right; exact bTrue.
  left; exact aFalse.
Qed.



