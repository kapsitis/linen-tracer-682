(** #<a href="../../discrete/assignments.html">Back to Discrete Assignments</a># *)

(** * Proving Propositional Tautologies *) 

(**
Date: 2020-01-02. Tested with Coq version 8.8.1.
------------------------
The following examples are based on the 
#<a href="http://www.cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf">Class Notes</a>#
from SUNY Buffalo 
#<a href="https://cse.buffalo.edu/~knepley/classes/cse191/Syllabus.html">CSE 191 "Discrete Structures"</a>#, Pages 12-20. This document adds different comments to these Coq examples.
*)

(** ** Introduction *)
(** #<b>Definition:</b># Boolean expressions 
that always take value #<tt>True</tt>#
regardless of the truth values of 
their variables are called #<i>tautologies</i>#.
*)
(** Tautologies in logic are much like identities
in algebra (formulas for #<tt>(a+b)<sup>2</sup>=a<sup>2</sup>+2ab+b<sup>2</sup></tt># 
and many others). 
They can be used to substitute all kinds of subexpressions 
in order to get results that are always true. 
*)

(** #<b>Naive Algorithm:</b># Check, if a Boolean Expression 
is a tautology by computing its truth table.
If the truth table always shows value "true", then it is a tautology.
#<br/><br/>#
Using this algorithm can be #<b>inefficient</b>#. If there are #<i>n</i># variables
in a Boolean expression, the truth table
has #<i>2<sup>n</sup></i># rows.
Once we start proving statements about infinite sets (such as 
natural or integer numbers), truth tables are #<b>impossible</b># to 
use, since there are infinitely many values that one can substitute in the formulas.
#<br/><br/>#
Therefore logic usually uses other methods of proof, based on 
symbolic manipulation of languages.
*)

(** ** Proving tautologies in Coq *)


Variables P Q R S : Prop.

Lemma id_P : P->P.
Proof.
  intros pTrue.  (*r stuff *)
  exact pTrue.
Qed. 

(** ** Universal Quantifier *)

(** Declaring constant propositions (with "Variables" as we just did)
is unnecessary, since we handle universal logical truths that 
should not depend on specific variable notation. 
In algebra 
#<br/>#
Can we write a Boolean formula (tautology or any other) without
using specific variable symbols? In the high-school algebra
the formula for #<tt>(a+b)<sup>2</sup></tt># is identical to the formula
for #<tt>(x+y)<sup>2</sup></tt># or even #<tt>(a+17)<sup>2</sup></tt>#. 
#<br/>#
For this reason we want to "bind" the variables in the formula using
"universal quantifier". We tell that the variable notation does not 
matter; the tautology would still hold, if you replace 
#<tt>p,q,r</tt># with different letters of subexpressions.
*)

Lemma id_P_same: forall p:Prop, p -> p. 
Proof. 
  intros p. 
  intros pTrue. 
  exact pTrue. 
Qed. 

Lemma imp_trans: forall p q r: Prop, (p->q)->(q->r)->p->r.
Proof. 
  intros p q r. 
  intros pIMPLq.
  intros qIMPLr.
  intros pTrue.
  apply qIMPLr.
  apply pIMPLq. 
  exact pTrue.
Qed. 

(** For conjunctions there are other tactics 
used to handle hypotheses and goals. 
If you have a conjunction in a hypothesis, you can 
use tactic #<tt>destruct</tt># to break the hypothesis
into two hypotheses.
*)
(** If you have a conjunction in the goal, you can 
use tactic #<tt>split</tt># to get two subgoals (need to prove both).
*)

Lemma and_comm: forall p q: Prop, (p /\ q) -> (q /\ p).
Proof.
  intros p q. 
  intros H. 
  destruct H as [pTrue qTrue].
  split.
  exact qTrue.
  exact pTrue.
Qed.

(** This command prints the most recent proof: *)

Show Script.

(** For disjunctions in hypothesis you can #<tt>destruct</tt># it into 
two subcases. Unlike conjunctions, you need to use #<b>either</b># one 
of the parts #<b>or</b># the other.
If you have disjunction in the goal, you can use tactics 
#<tt>left</tt># and #<tt>right</tt># - to pick, which part of the 
disjunction you want to prove.
*)


Lemma or_comm: forall p q: Prop, (p \/ q) -> (q \/ p).
Proof. 
  intros p q.
  intros H. 
  destruct H as [pTrue | qTrue].
  right; exact pTrue.
  left; exact qTrue.
Qed. 


(** The tactic "destruct" can be expressed in more detail
as explained in 
#<a href="https://coq.inria.fr/tutorial/1-basic-predicate-calculus">Coq documentation</a>#.
*)

Lemma or_commutative : forall a b: Prop, a \/ b -> b \/ a.
Proof. 
  intros A B H.
  elim H.
  intro HA.
  clear H.
  right.
  exact HA.
  intro HB.
  left.
  exact HB.
Qed.

(** This is small and trivial example shows that you can 
combine conjunctions and disjunctions.
It tells that whenever "#<tt>p</tt># AND #<tt>q</tt>#" are both true, then 
"#<tt>p</tt># OR #<tt>r</tt>#" is also true, since we can use hypothesis #<tt>pTrue</tt>#
stating that #<tt>p</tt># is true regardless of what is #<tt>r</tt>#.
In order to do that we first destruct the original hypothesis (into 
two hypotheses #<tt>pTrue</tt># and #<tt>qTrue</tt>#)
and then take just the left part of #<tt>p \/ r</tt>#. 
*)

Lemma prob3a : forall p q r: Prop, (p /\ q) -> (p \/ r).
Proof.
  intros p q r.
  intros H.
  destruct H as [pTrue qTrue].
  left; exact pTrue.
Qed.


Lemma prob3b : forall p r: Prop, p->(r->p).
Proof. 
  intros p r. 
  intros H1 H2.
  exact H1.
Qed. 




