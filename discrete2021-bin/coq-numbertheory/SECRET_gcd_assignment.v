Require Import Nat.
Require Import PeanoNat.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

Require Import Arith Psatz.



Open Scope Z_scope.


Lemma sample6_5_1: forall a b c: Z, 
    (Zis_gcd a b 1) -> (Zis_gcd a c 1) -> (Zis_gcd a (b*c) 1).
Proof.
  intros a b c.
  intros H1.
  intros H2.
  destruct H1 as [H1A H1B H1C].
  destruct H2 as [H2A H2B H2C].
  split.
  exact H1A.
  unfold Z.divide.
  exists (b*c).
  ring.
  intros x. 
  intros H3.
  intros H4.
  apply H1C.
  exact H3.
  clear H1A H1B.
  clear H2A H2B.
  unfold Z.divide.
Admitted.


(*
Search (_ = 1).
Z.divide_1_r: forall n : Z, (n | 1) -> n = 1 \/ n = - (1)
*)

Lemma sample6_5_2: forall a b c: Z, 
     (Zis_gcd a b 1) -> (c | a) -> (c | b) -> ((c=1) \/ (c=-1)).
Proof.
  intros a b c.
  intros H1 H2 H3.
  destruct H1 as [H1A H1B H1C].
  pose (H1C c H2 H3) as H4.
  apply Z.divide_1_r. 
  exact H4.
Qed.



Lemma sample6_5_3: forall a b c: Z, 
  (Zis_gcd a b c) -> (Zis_gcd (a*a) (b*b) (c*c)).
Proof.
  intros a b c.
  intros H1.
  destruct H1 as [H1A H1B H1C].
  split.
  unfold Z.divide in H1A.
  destruct H1A as [z H1A].
  unfold Z.divide.
  exists (z*z). 
  rewrite H1A.
  ring.

  unfold Z.divide in H1B.
  destruct H1B as [z H1B].
  unfold Z.divide.
  exists (z*z).
  rewrite H1B.
  ring.
  intros x. 
  intros H2 H3.
  destruct H1A.
  destruct H1B.
Admitted.

  



Lemma sample6_5_4: forall a b d x y: Z, (d | a) -> (d | b) -> (a*x + b*y = d) -> 
    (Zis_gcd a b d).
Proof. 
  intros a b d x y.
  intros H1 H2 H3.
  pose (Zis_gcd_bezout a b) as H4.
Admitted.  




Lemma sample6_5_5: forall p:Z, prime p -> forall m:Z, (Zis_gcd p m p) \/ (Zis_gcd p m 1).
Proof. 
Admitted.




Close Scope Z_scope.
