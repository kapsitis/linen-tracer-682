(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

Require Import Arith.

(*
Inductive even : nat -> Prop :=
  even0 : even 0
  | evenS : forall x:nat, even x -> even (S (S x)).
*)

Inductive odd: nat -> Prop :=
  odd1 : odd (S 0)
  | oddS : forall x:nat, odd x -> odd (S (S x)).

(** This is Chapter 1.7 from the textbook (Rosen2019, p.87) *)

Theorem example1: forall n: nat, (odd n) -> (odd (n*n)).
Proof. 
  induction n.


Inductive even : nat -> Prop :=
| ev_0 : even 0
| ev_SS (n : nat) (H : even n) : even (S (S n)).

Eval compute in (even 1).

Fail Inductive wrong_ev (n : nat) : Prop :=
  | wrong_ev_0 : wrong_ev 0
  | wrong_ev_SS : wrong_ev n  wrong_ev (S (S n)).
(* ===> Error: Last occurrence of "wrong_ev" must have "n"
        as 1st argument in "wrong_ev 0". *)
