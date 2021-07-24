(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*) 

Require Import Classical_Prop.

(** Search on Twitter: 
#<br/><tt>from:mathslogicbot since:2020-12-01 until:2021-01-02</tt><br/># 
Also Check this URL: #<a href='https://bit.ly/35ZsvXx'>https://bit.ly/35ZsvXx</a>#
Students did one tautology each depending on their student ID. *)


(** ** Warmup Exercise *)

Lemma DubNeg: forall b: Prop, b -> ~~b.
Proof.
Admitted.


(** ** Problems in H2.P5 *)

Lemma Dec01: forall a: Prop, ~~(((a/\a)/\a)<->a).
Proof.
  Admitted.


Lemma Dec03: forall a b: Prop, ~~(((a/\b)/\b)-> b).
Proof.
  Admitted.


Lemma Dec04: forall a b c: Prop, ~ ~ (((a/\b)/\c) -> c).
Proof.
  Admitted.


Lemma Dec07: forall a b: Prop,  ~~(((a\/b)/\a)->a).
Proof.
  Admitted.


Lemma Dec16: forall a b: Prop, ~~((a/\~~~~b)->a).
Proof.
  Admitted.


Lemma Dec17: forall a b: Prop, ~~((a/\(a/\b))->b).
Proof.
  Admitted.

 
Lemma Dec18: forall a b: Prop, ~~((a /\( a <-> b))->b).
Proof.
  Admitted.

Lemma Dec19: forall a : Prop, ~~((a/\(a->a))->a).
Proof.
  Admitted.


Lemma Dec20: forall a b: Prop, ~~((a/\(b\/a))<->a).
Proof.
  Admitted. 


Lemma Dec21: forall a b: Prop, ~~((a/\(b<->a))->a).
Proof.
  Admitted.


Lemma Dec22: forall a b: Prop, ~~((a/\a)\/(b->b)).
Proof.
  Admitted. 
 

Lemma Dec24: forall a b: Prop, ~~((a/\b)\/(a<->a)).
Proof.
  Admitted.



 