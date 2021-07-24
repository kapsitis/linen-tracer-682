(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(**
This file contains all proofs taken from
SUNY Buffalo CSE 191 Course (by Knepley):
https://cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf
Pages 69-81
*)

(** ** Ch3_3: Function properties *)

Definition relation (X Y : Type) := X -> Y -> Prop. 

Definition partial_function {X Y: Type} (R: relation X Y) :=
forall x : X, forall y1 y2 : Y, R x y1 -> R x y2 -> y1 = y2.

Definition total_function {X Y: Type} (R: relation X Y) :=
partial_function R /\ (forall x : X, exists y : Y, R x y).

Definition injective {X Y : Type} (R: relation X Y) :=
forall x1 x2: X, forall y : Y, (R x1 y) -> (R x2 y) -> x1 = x2.

Definition surjective {X Y : Type} (R: relation X Y) := forall y : Y, exists x : X, R x y.

Definition bijective {X Y : Type} (R: relation X Y) := total_function R /\ injective R /\ surjective R.

Definition inverse {X Y : Type} (R : relation X Y) (S : relation Y X) := forall (x : X) (y : Y), R x y = S y x.


Lemma inverse_exists {X Y : Type} : forall R : relation X Y, bijective R -> exists S : relation Y X,
inverse R S /\ total_function S.
Proof. 
  intros R Rbij.
  pose (S := fun (y : Y) (x : X) => R x y).
  exists S.
  split.
  unfold inverse.
  intros x y.
  reflexivity.
  unfold total_function. 
  split.
  unfold partial_function.
  intros x y1 y2.
  intros H1 H2.
  unfold bijective in Rbij.
  destruct Rbij as [Rfunc Rinj Rsur].
  destruct Rinj as [Rinj Rsur].
  unfold injective in Rinj.
  apply Rinj with (x1 := y1) (x2 := y2) (y := x) in H1 as H3.
  exact H3.
  exact H2.
  intro x.
  unfold bijective in Rbij.
  destruct Rbij as [Rfunc Rinj].
  destruct Rinj as [Rinj Rsur].
  unfold surjective in Rsur.
  destruct (Rsur x) as [y H1].
  exists y.
  exact H1.
Qed.


Definition composition {X Y Z : Type} (R : relation X Z) (S : relation Z Y) (T : relation X Y) :=
forall (x : X) (y : Y), (exists z : Z, R x z /\ S z y) <-> T x y.

Lemma comp_exists {X Y Z : Type} : forall (R : relation X Z) (S : relation Z Y),
bijective R -> bijective S -> exists T : relation X Y, composition R S T /\ total_function T.
Proof.
  intros R S RBij SBij.
  pose (T := fun (x : X) (y : Y) => exists z : Z, R x z /\ S z y).
  exists T.
  split.
  unfold composition.
  intros x y.
  split.
  intro H1.
  destruct H1 as [z H1].
  exists z.
  exact H1.
  intro H1.
  destruct H1 as [z H1].
  exists z.
  exact H1.
  unfold total_function.
  split.
  unfold partial_function.
  intros x y1 y2 H1 H2.
  destruct H1 as [z1 H1].
  destruct H2 as [z2 H2].
  destruct H1 as [H1R H1S].
  destruct H2 as [H2R H2S].
  destruct RBij as [RTot RInjSur].
  destruct SBij as [STot SInjSur].


  destruct RTot as [RPartial RTot].
  destruct STot as [SPartial STot].
  unfold partial_function in RPartial.
  apply RPartial with (y1 := z1) (y2 := z2) in H1R as H3R.
  rewrite <- H3R in H2S.
  unfold partial_function in SPartial.
  apply SPartial with (y1 := y1) (y2 := y2) in H1S as H3S.
  exact H3S.
  exact H2S.
  exact H2R.
  intro x.
  destruct RBij as [RFunc RInjSur].
  destruct RFunc as [RPartial RTot].
  destruct (RTot x) as [z H1R].
  destruct SBij as [SFunc SInjSur].
  destruct SFunc as [SPartial STot].
  destruct (STot z) as [y H1S].
  exists y.
  exists z.
  split.
  exact H1R.
  exact H1S.
Qed.


Definition plus_1 := fun x y : nat => x+1=y.

Require Import Arith.

Theorem plus_1_inj : injective plus_1.
Proof.
  unfold injective.
  unfold plus_1.
  intros x1 x2 y H1 H2.
  apply Nat.succ_inj.
  rewrite Nat.add_1_r in H1.
  rewrite Nat.add_1_r in H2.
  rewrite H1.
  rewrite H2.
  reflexivity.
Qed.


Theorem plus_1_not_sur : ~surjective plus_1.
Proof. 
  unfold surjective.
  unfold plus_1.
  intro H.
  destruct (H 0).
  rewrite Nat.add_1_r in H0.
  inversion H0.
Qed.


(** Search for a pattern to cancel out same multiplier *)
Search (_ * _ = _ * _).
(** 
Find a lemma that we can cancel multiplier 'p' in equalities: 
<<
Nat.mul_cancel_l:
  forall n m p : nat, p <> 0 -> p * n = p * m <-> n = m
>>
*)

Definition double := fun x y => 2*x = y.

Theorem double_inj : injective double.
Proof. 
  unfold injective.
  unfold double.
  intros x1 x2 y H1 H2.
  rewrite <- H1 in H2.
  apply Nat.mul_cancel_l in H2.
  symmetry.
  exact H2.
  intro H3.
  discriminate.
Qed.


Require Import Lia.

Theorem double_not_sur: ~surjective double.
Proof. 
  unfold surjective.
  unfold double.
  intro H.
  destruct (H 1) as [x H1].
  lia.
Qed.


Require Import Psatz.

Lemma two_not_sq : forall x : nat, x*x <> 2.
Proof. 
  intro x.
  destruct x.
  simpl. discriminate.
  destruct x.
  discriminate.
  destruct x.
  simpl. discriminate.
  nia.
Qed.

Theorem Cantor X : ~exists f : X -> X -> Prop, surjective (fun (x : X) (y : X -> Prop) => (f x = y)).
Proof.
  intro.
  destruct H as [f A].
  unfold surjective in A.
  pose (g := fun x : X => ~ f x x).
  destruct (A g) as [x B].
  assert (C : g x <-> f x x).
  rewrite B.
  reflexivity.
  unfold g in C.
  tauto.
Qed.


(** Short, but tricky tautology - proven explicitly. *)
Lemma test (S : Prop) : (S <-> ~S) -> False.
Proof. 
  intro.
  destruct H.
  unfold not in H.
  apply H.
  apply H0.
  intro.
  apply H.
  assumption.
  assumption.
  apply H0.
  intro.
  apply H.
  assumption.
  assumption.
Qed.


(** Another proof of the same tautology. *)
Lemma test2: forall S : Prop, ~(S <-> ~S).
Proof. 
  intros S.
  intros H.
  destruct H as [H1 H2].
  unfold not in H1.
  apply H1.
  apply H2.
  intros H3.
  contradiction ((H1 H3) H3).
  apply H2.
  intros H3.
  contradiction ((H1 H3) H3).
Qed.
  

