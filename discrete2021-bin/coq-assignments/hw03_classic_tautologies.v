(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

Require Import Classical_Prop.

(** ** Problems in H3.P5 *)

Lemma ImplToDisjClassic: forall a b: Prop, (a -> b) -> (~a \/ b).
Proof.
  Admitted.


Lemma PeirceLaw: forall a b: Prop, ((a -> b) -> a) -> a.
Proof. 
  Admitted.


Lemma NNPPUsingClassic:
    forall a: Prop, ~~a -> a.
Proof.
  Admitted.

