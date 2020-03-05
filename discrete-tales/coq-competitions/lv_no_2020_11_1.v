(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * LV.NO.2020.11.1 *)

(** See #<a href='https://bit.ly/2VLBCH8'>LV Regional 
Olympiad Problems</a>#. *)

(** #<b>Problem:</b># Show that for all positive integers n, 
6^(2n) + 19^n - 2^(n+1) is divisible by 17.
*)



Require Import Nat.
Require Import PeanoNat.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

Require Import Arith Psatz.


Definition SeqB (n: nat):nat := 6^(2*n) + 19^n - 2^(n+1).

SearchRewrite (_ mod _).

Open Scope nat_scope.


Theorem lv_no_2020_11_1: forall n: nat, (SeqB n) mod 17 = 0.
Proof.
  Admitted.


Close Scope nat_scope.
