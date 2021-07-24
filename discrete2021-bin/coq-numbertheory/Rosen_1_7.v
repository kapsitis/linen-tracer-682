(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)


Require Import ZArith.
Require Import Znumtheory.
Require Import Arith Psatz.

(* Examples from Rosen2019, Ch1.7 *)
Section Rosen_1_7.

Open Scope Z_scope.

Definition Even a := exists b, a = 2*b.
Definition Odd a := exists b, a = 2*b+1.

(* ****************** *)
(* EXAMPLE 1, page 87 *)
(* ****************** *)
Lemma example1: forall n: Z, (Odd n) -> (Odd (n^2)).
Proof.
  intros n.
  intros H.
  destruct H as [k H1].
  unfold Odd.
  exists (2*k^2 + 2*k).
  rewrite H1.
  ring.
Qed.


(* ****************** *)
(* EXAMPLE 2, page 87 *)
(* ****************** *)


Definition PerfectSquare n := exists k, n = k*k.

Lemma example2: forall m n: Z, ((PerfectSquare m) /\ (PerfectSquare n) ->
    (PerfectSquare (m*n))).
Proof.
  intros m n.
  intros H. 
  destruct H as [H1 H2].
  unfold PerfectSquare.
  unfold PerfectSquare in H1. 
  destruct H1 as [k1 HH1].
  destruct H2 as [k2 HH2].
  exists (k1*k2).
  rewrite HH1.
  rewrite HH2.
  ring.
Qed.






(* ************************** *)
(* Properties of Even and Odd *)
(* ************************** *)

(* THEOREM1: Every integer number is either even or odd. *)
(* Used proof by induction; will be covered in Chapter 5. *)
(* For now just ignore this; assume that it is true. *)
(* If you know a simpler proof, please let us know. *)
Theorem evenOrOdd: forall z: Z, (Even z) \/ (Odd z).
Proof.
  intros z.
  induction z.
  left. unfold Even. exists 0. simpl. reflexivity.
  induction p.
  destruct IHp as [H1 | H2].
  right. unfold Odd. exists (Z.pos p). lia.
  right. unfold Odd. exists (Z.pos p). lia.
  left. unfold Even. exists (Z.pos p). lia.
  right. unfold Odd. exists 0. simpl. lia.
  induction p.
  right. unfold Odd. exists ((Z.neg p)-1). lia.
  left. unfold Even. exists (Z.neg p). lia.
  right. unfold Odd. exists (-1). lia.
Qed.

(* THEOREM2: If a number is even, then it cannot be odd. *)
Lemma EvenIsNotOdd: forall n: Z, (Even n) -> ~(Odd n).
Proof.
  intros n.
  intros H1.
  unfold Even in H1.
  destruct H1 as [b1 HH1].
  unfold not.
  unfold Odd.
  intros H2.
  destruct H2 as [b2 HH2].
  rewrite HH1 in HH2.
  lia.
Qed.


(* Tautology: If Q is false, but P\/Q is true, then P must be true *)
Lemma dropDisjunction: forall P Q: Prop, ~Q -> (P \/ Q) -> P.
Proof.
  intros P Q.
  intros H_QFalse.
  intros H_PorQ.
  destruct H_PorQ as [H_PTrue|H_QTrue].
  exact H_PTrue.
  contradiction (H_QFalse H_QTrue).
Qed.





(* THEOREM3: If a number is not odd, then it must be even. *)
Lemma notOddIsEven: forall n: Z, ~(Odd n) -> (Even n).
Proof.
  intros n. 
  intros H1.
  pose (dropDisjunction (Even n) (Odd n)) as H2.
  apply (H2 H1). 
  exact (evenOrOdd n).
Qed.





(* Non-Constructive Tautology: Contrapositive (~Q -> ~P) implies that (P -> Q) *)
Require Import Classical_Prop.
Lemma contraposition: forall P Q: Prop, (~Q -> ~P) -> (P -> Q).
Proof.
  intros P Q.
  intros H.
  intros Hyp_PTrue.
  apply NNPP.
  unfold not.
  intros Hyp_QFalse.
  pose (H Hyp_QFalse) as Hyp_PFalse.
  contradiction (Hyp_PFalse Hyp_PTrue).
Qed.



(* ****************** *)
(* EXAMPLE 3, page 87 *)
(* ****************** *)
Lemma example3: forall n: Z, (Odd (3*n+2)) -> (Odd n).
Proof.
  intros n.
  assert (~(Odd n) -> ~(Odd (3 * n + 2))).
  intros H1.
  pose (notOddIsEven n H1) as H2.
  unfold Even in H2.
  destruct H2 as [b2 HH2].

  assert (Even (3*n + 2)).
  unfold Even.
  rewrite HH2.
  exists (3*b2+1).
  ring.
  pose (EvenIsNotOdd (3*n+2) H) as H3.
  exact H3.
  apply contraposition.
  exact H.
Qed.



(* ****************** *)
(* EXAMPLE 5, page 88 *)
(* ****************** *)
Definition P n := ((n > 1) -> (n^2 > n)).

(* This is a 'vacuous lemma' - it is true just because the condition is false *)
Lemma example5: P(0).
Proof. 
  unfold P.
  assert (~(0>1)).  
  lia.
  intros H1.
  contradiction (H H1).
Qed.

Close Scope Z_scope.



End Rosen_1_7.














