(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(** ** The solution of H6.P5 *)

Require Import ZArith.
Require Import Znumtheory.

Section Homework6_Problems.

Open Scope Z_scope.

(** See Theorem1 (i), p.252 in the textbook *)
Lemma sample6_1: forall a b c:Z, (a | b) -> (a | c) -> (a | b+c).
Proof. 
  unfold Z.divide.
  intros a b c.
  intros [z1 H1] [z2 H2].
  exists (z1+z2).
  rewrite H1.
  rewrite H2.
  ring.
Qed.



(** See Theorem1 (ii), p.252 in the textbook *)
Lemma sample6_2: forall a b c:Z, (a | b) -> (a | b*c).
Proof. 
  unfold Z.divide.
  intros a b c.
  intros [z1 H1].
  rewrite H1.
  exists (c*z1).
  ring.
Qed.



(** See Theorem1 (iii), p.252 in the textbook *)
Lemma sample6_3: forall a b c: Z, (a | b) -> (b | c) -> (a | c).
Proof. 
  unfold Z.divide.
  intros a b c.
  intros [z1 H1] [z2 H2].
  exists (z1*z2).
  rewrite H2.
  rewrite H1.
  ring.
Qed.



(** See Theorem4, p.255 in the textbook *)

(*
Search (_ mod _ = _ mod _).
Search (_ | _).

Z.mod_divide: forall a b : Z, b <> 0 -> a mod b = 0 <-> (b | a)
Zminus_mod_idemp_r: forall a b n : Z, (a - b mod n) mod n = (a - b) mod n
Zminus_mod_idemp_l: forall a b n : Z, (a mod n - b) mod n = (a - b) mod n
*)



Lemma sample6_4_helper: forall a b m: Z, (m <> 0) ->
  ((a mod m) = (b mod m) -> (m | a - b)).
Proof.
  intros a b m H0 H1.
  apply (Z.mod_divide (a-b) m H0).
  assert (((a mod m - b mod m) mod m) = ((a - b) mod m)) as H2.
  pose (Zminus_mod_idemp_r a b m) as H3.
  rewrite <- H3.
  pose (Zminus_mod_idemp_l a (b mod m) m) as H4.
  rewrite <- H4.
  reflexivity.
  rewrite <- H2.
  rewrite <- H1.
  assert (a mod m - a mod m = 0) as H5.
  ring.
  rewrite H5.
  reflexivity.
Qed. 



Lemma sample6_4: forall a b m: Z, (m <> 0) ->
    ((a mod m) = (b mod m) <-> (exists k:Z, a = b+k*m)).
Proof.
  intros a b m H.
  split.
  intros H1.
  pose (sample6_4_helper a b m H H1) as H2.
  destruct H2 as [z H3].
  exists z. 
  rewrite <- H3. 
  ring.
  intros H1.
  destruct H1 as [z H2].
  assert (a mod m = a mod m) as H3.
  reflexivity.
  rewrite H2 in H3 at 2.
  rewrite H3.
  exact (Z_mod_plus_full b z m).
Qed.



Lemma sample6_5 : forall a b c : Z, (a|b) \/ (a|c) -> (a| b*c).
Proof. 
  unfold Z.divide.
  intros a b c.
  intros H.
  destruct H as [H2|H3].
  destruct H2 as [z2 H2].
  rewrite H2.
  exists (z2*c).
  ring.
  destruct H3 as [z3 H3].
  rewrite H3.
  exists (b*z3).
  ring.
Qed. 




(** ** Optional Task *)
(** Once the homework is proven, you can 
obtain useful corollaries. *)

Corollary divide_lincombination: 
    forall a b c m n, (a | b) /\ (a | c) -> (a | m*b + n*c).
Proof. 
  intros a b c m n.
  intros H. 
  destruct H as [H1 H2].
  pose (sample6_2 a b m) as H3.
  apply H3 in H1 as H4.
  pose (sample6_2 a c n) as H5.
  apply H5 in H2 as H6.
  clear H3 H5.
  pose (sample6_1 a (m*b) (n*c)) as H7.
  rewrite (Z.mul_comm b m) in H4.
  pose (H7 H4) as H8.
  rewrite (Z.mul_comm c n) in H6.
  pose (H8 H6) as H9.
  unfold Z.divide. 
  unfold Z.divide in H9.
  destruct H9. 
  exists (x).
  exact H.
Qed.



Lemma Zmod_divide_ALT: forall a b:Z, b > 0 -> a mod b = 0 -> (b | a).
Proof.
intros a b H H0.
apply Zdivide_intro with (a / b).
pattern a at 1 in |- *; rewrite (Z_div_mod_eq a b H).
rewrite H0; ring.
Qed.

Lemma Zdivide_mod : forall a b:Z, b > 0 -> (b | a) -> a mod b = 0.
Proof.
intros a b; simple destruct 2; intros; subst.
change (x * b) with (0 + x * b) in |- *.
rewrite Z_mod_plus; auto.
Qed.



Lemma sample6_5_ALT: forall a b c : Z, (a|b) \/ (a|c) -> (a| b*c).
Proof.
simple induction 1.
simple induction 1.
intros h1 h2.
apply Zdivide_intro with (h1 * c).
rewrite h2.
ring.
simple induction 1.
intros h3 h4.
apply Zdivide_intro with (h3 * b).
rewrite h4.
ring.
Qed.

Lemma sample6_2_ALT: forall a b c:Z, (a | b) -> (a | b*c).
Proof.
simple induction 1.
intros h1 h2.
apply Zdivide_intro with (h1 * c).
rewrite h2.
ring.
Qed.




Close Scope Z_scope.

End Homework6_Problems.

