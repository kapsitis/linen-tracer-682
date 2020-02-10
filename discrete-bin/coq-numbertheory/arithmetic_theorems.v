(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * Arithmetic Theorems from the Rosen book *)

Require Import ZArith.
Open Scope Z_scope.



(** ** Transitivity of Division *)

(** Theorem 1.i from 4.1 (Rosen2019, p.252). *)

Theorem divide_sum: forall a b c, (a | b) -> (a | c) -> (a | b+c).
Proof. 
  intros a b c. 
  unfold Z.divide.
  intros H1 H2. 
  destruct H1. 
  destruct H2.
  exists (x+x0).
  rewrite H.
  rewrite H0.
  ring.
Qed.


(** Theorem 1.ii from 4.1 (Rosen2019, p.252). *)

Theorem divide_multiple: forall a b c, (a | b) -> (a | b*c).
Proof. 
  intros a b c.
  unfold Z.divide.
  intros H1.
  destruct H1.
  exists (x*c).
  rewrite H.
  ring.
Qed.

(** This is strange that we need this axiom despite commutativity *)
Theorem divide_multiple_left: forall a b c, (a | b) -> (a | c*b).
Proof. 
  intros a b c.
  unfold Z.divide.
  intros H1.
  destruct H1.
  exists (x*c).
  rewrite H.
  ring.
Qed.





(** ** Transitivity of Division *)

(** #<b>Theorem:</b># Let n,m,p be 
any integers. If n divides m 
and m divides p, then n divides p. 
See (Rosen2019, p.252), Theorem 1.iii *)

(** The Coq proof is quoted from (Knepley2019, p.111) *)

Theorem divide_trans : forall a b c, (a | b) -> (b | c) -> (a | c).
Proof.
  intros a b c.
  unfold Z.divide.
  intros H1 H2.
  destruct H1.
  destruct H2.
  exists (x0*x).
  rewrite H0.
  rewrite H.
  ring.
Qed.


Corollary divide_lincombination: 
    forall a b c m n, (a | b) /\ (a | c) -> (a | m*b + n*c).
Proof. 
  intros a b c m n.
  intros H. 
  destruct H as [H1 H2].
  pose (divide_multiple_left a b m) as H3.
  apply H3 in H1 as H4.
  pose (divide_multiple_left a c n) as H5.
  apply H5 in H2 as H6.
  clear H3 H5.
  pose (divide_sum a (m*b) (n*c)) as H7.
  pose (H7 H4) as H8.
  pose (H8 H6) as H9.
  unfold Z.divide. 
  unfold Z.divide in H9.
  destruct H9. 
  exists (x).
  exact H.
Qed.


 


