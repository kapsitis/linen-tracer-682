(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * LV.NO.2020.12.1 *)

(** See #<a href='https://bit.ly/2VLBCH8'>LV Regional 
Olympiad Problems</a>#. *)

(** #<b>Problem:</b> 
The sequence (x_n) is defined by a recurrence: x_1 = 1, x_2 = -3, 
x_3 = -29 and x_{n+3} = 9x_{n+2} - 26x_{n+1} + 24x_n for all 
positive integers n.
Prove that x_n = 2^n + 3^n - 4^n
for all positive integers n.
*)


Require Import Nat.
Require Import PeanoNat.
Require Import Arith Psatz.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.


Open Scope Z_scope.

Fixpoint SeqC (k : nat):Z := 
  match k with
  | 0%nat => 1
  | 1%nat => 1
  | 2%nat => -3
  | 3%nat => -29
  | (S k') => 9*(SeqC k') - 26*(SeqC (pred k')) + 24*(SeqC (pred (pred k')))
  end.

Locate "^".


Theorem lv_no_2020_12_1: forall n:nat, 
  SeqC n = 2^(Z.of_nat n) + 3^(Z.of_nat n) - 4^(Z.of_nat n).
Proof.
  Admitted.


Close Scope Z_scope.
