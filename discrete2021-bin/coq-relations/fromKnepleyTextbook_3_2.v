(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(**
This file contains all proofs taken from
SUNY Buffalo CSE 191 Course (by Knepley):
https://cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf
Pages 60-68
*)


(** ** Ch3_2: Binary Relations *)

Definition relation (X Y : Type) := X -> Y -> Prop.

Definition reflexive {X: Type} (R: relation X X) := forall a : X, R a a.

Definition transitive {X: Type} (R: relation X X) := forall a b c : X, (R a b) -> (R b c) -> (R a c).

Definition symmetric {X: Type} (R: relation X X) := forall a b : X, (R a b) -> (R b a).

Definition antisymmetric {X: Type} (R: relation X X) := forall a b : X, (R a b) -> (R b a) -> a = b.

Inductive le (n : nat) : nat -> Prop :=
le_n : (le n n)
| le_S : forall m : nat, (le n m) -> (le n (S m)).

Lemma n_le_Sn : forall n, (le n (S n)).
Proof.
  intro.
  apply le_S.
  apply le_n.
Qed.


Definition order {X:Type} (R: relation X X) := (reflexive R) /\ (antisymmetric R) /\ (transitive R).

Theorem le_reflexive : reflexive le.
Proof. 
  unfold reflexive.
  intro a. 
  apply le_n.
Qed.


Theorem le_trans : transitive le.
Proof. 
  unfold transitive.
  intros a b c Hab Hbc.
  induction Hbc.
  assumption.
  apply le_S.
  assumption. 
Qed.


Lemma Sn_le_Sm__n_le_m : forall n m, le (S n) (S m) -> le n m.
Proof. 
  intros n m HSnm.
  inversion HSnm.
  apply le_n.
  apply le_trans with (b := S n).
  apply n_le_Sn.
  apply H0.
Qed.


Theorem le_antisymmetric : antisymmetric le.
Proof. 
  unfold antisymmetric.
  induction a.
  intros b H0b Hb0.
  inversion Hb0.
  reflexivity.
  intros b HSab HbSa.
  destruct b. 
  inversion HSab.
  apply Sn_le_Sm__n_le_m in HSab.
  apply Sn_le_Sm__n_le_m in HbSa.
  apply IHa in HSab.
  rewrite HSab.
  reflexivity.
  exact HbSa.
Qed.


Theorem le_order : order le.
Proof.
  unfold order.
  split.
  apply le_reflexive.
  split.
  apply le_antisymmetric.
  apply le_trans.
Qed.

Definition equivalence {X:Type} (R: relation X X) := (reflexive R) /\ (symmetric R) /\ (transitive R).




