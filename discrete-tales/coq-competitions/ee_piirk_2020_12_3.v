(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * EE.PIIRK.2020.9.1 *)

(** #<b>Problem.</b># Define the sequence (a_n) by 
setting a_1 = 4, a_2 = -7 and a_n = a_{n-1}a_{n-2} - 1
for every n>2. Does there exist a prime number that
does not divide any member of this sequence?
*)

(** See #<a href='https://bit.ly/32OWgHH'>Piirkonnavoor 2020</a>#, 
page p.10, p.22.
*)

Require Import Nat.
Require Import PeanoNat.
Require Import Arith Psatz.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

Fixpoint SeqD (k:nat):Z := 
  match k with 
  | 0%nat => 1
  | 1%nat => 4
  | 2%nat => -7
  | S k' => (SeqD k')*(SeqD (pred k')) - 1
  end.

Theorem ee_pirk_2020_12_3: forall (p:Z), exists (k:nat), 
  (prime p) -> (p | SeqD k).
Proof.
  Admitted.