(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(**
This file contains all proofs taken from
SUNY Buffalo CSE 191 Course (by Knepley):
https://cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf
Pages 106-129
*) 

Require Import Nat.
Require Import PeanoNat.
Require Import Arith Psatz.

Open Scope nat_scope.



(** ** Subsection 4.5.1: Arithmetic Progressions *)

(** Add (1+1+...+1). Total is (n+1) copies of '1' *)
Fixpoint sum_1 (n : nat) := match n with
  0 => 1
  | S p => S (sum_1 p)
end.


(** Prove by induction that sum_1(n) equals (n+1) *)
Theorem sum_1_analytic : forall n : nat, sum_1 n = S n.
Proof. 
  induction n.
  simpl.
  reflexivity.
  simpl.
  rewrite IHn.
  reflexivity.
Qed.


Fixpoint sum_n n := match n with
  0 => 0
  | S p => p + sum_n p
end.


Lemma sum_n_p : forall n, 2 * sum_n n + n = n * n.
Proof.
  induction n.
  simpl.
  reflexivity.
  assert (SnSn : S n * S n = n * n + 2 * n + 1).
  ring.
  rewrite SnSn.
  rewrite <- IHn.
  simpl.
  ring.
Qed.



Theorem bigger : forall n : nat, n <= sum_n n + 1.
Proof. 
  induction n.
  simpl.
  apply le_S.
  apply le_n.
  destruct n.
  simpl.
  apply le_n.
  rewrite <- Nat.add_1_r.
  apply Nat.le_le_add_le with (n := S n) (m := sum_n (S n) + 1).
  assumption.
  rewrite Nat.add_1_r at 2.
  simpl.
  rewrite <- Nat.add_1_r.
  rewrite <- Nat.add_1_r with (n:=n).
  rewrite <- Nat.add_1_r with (n:=n + (n + sum_n n) + 1 + (n + 1)).
  apply plus_le_compat_r.
  rewrite <- plus_assoc with (n:=n) (m:=n + sum_n n) (p:=1).
  rewrite <- plus_assoc with (n:=n) (m:=n + sum_n n + 1) (p:=n+1).
  rewrite plus_comm with (n:=n + sum_n n + 1) (m:=n+1).
  rewrite plus_assoc with (n:=n) (m:=n+1).
  apply plus_le_compat_r.
  rewrite <- plus_O_n at 1.
  apply plus_le_compat_r.
  apply Peano.le_0_n.
Qed.



(** ** Subsection 4.5.2: Real Numbers: Geometric Progression *)

Require Import Reals.
Require Import Rfunctions.
Open Scope R_scope.
Fixpoint sum_geom (n:nat) (x:R) : R := match n with
  0 => 1
  | S p => x^n + sum_geom p x
end.


Lemma sum_geom_p : forall n:nat, forall x:R, 
    sum_geom n x * x + 1 = x^(n + 1) + sum_geom n x.
Proof. 
  induction n.
  intros x.
  simpl.
  rewrite Rmult_1_l.
  rewrite Rmult_1_r.
  reflexivity.
  intros x.
  simpl.
  rewrite Rmult_plus_distr_r.
  rewrite tech_pow_Rmult.
  rewrite tech_pow_Rmult.
  rewrite Rmult_comm with (r1:=x ^ S n) (r2:=x).
  rewrite tech_pow_Rmult.
  rewrite Rplus_assoc.
  rewrite IHn.
  rewrite Nat.add_1_r.
  reflexivity.
Qed.

Close Scope R_scope.




(** ** Subsection 4.5.3: Fibonacci Numbers *)


Require Import ZArith.
Require Import Znumtheory.
Open Scope Z_scope.
Fixpoint fibonacci (n:nat) : Z := match n with
  | O => 1
  | S O => 1
  | S (S n as p) => fibonacci p + fibonacci n
end.


Eval compute in (fibonacci 2).

Eval compute in (fibonacci 5).



Lemma fibonacci_pos : forall n, 0 <= fibonacci n.
Proof. 
  cut (forall N n, (n<N)%nat -> 0<=fibonacci n).
  intros H n.
  pose (Hn := H (S n) n).
  apply Hn.
  apply le_lt_n_Sm.
  apply le_n.
  induction N.
  inversion 1.
  intros n H.
  destruct n.
  simpl.
  auto with zarith.
  destruct n.
  simpl.
  auto with zarith.
  change (0 <= fibonacci (S n) + fibonacci n).
  pose (Hn := IHN n).
  pose (HSn := IHN (S n)).
  lia.
Qed.


Search (_ <= _).



Lemma fibonacci_monotone : forall n m, (n<=m)%nat -> fibonacci n <= fibonacci m.
Proof.
  induction 1.
  apply Z.le_refl.
  apply Z.le_trans with (m := (fibonacci m)).
  exact IHle.
  clear.
  destruct m.
  simpl.
  apply Z.le_refl.
  change (fibonacci (S m) <= fibonacci (S m)+fibonacci m).
  generalize (fibonacci_pos m).
  omega.
Qed.




Close Scope Z_scope.





