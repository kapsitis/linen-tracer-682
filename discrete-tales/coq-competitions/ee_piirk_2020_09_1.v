(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * EE.PIIRK.2020.9.1 *)

(** #<b>Problem:</b> Find all positive integers a,b, such that
a^2 - b^2 = 2020
*)

(** See #<a href='https://bit.ly/32OWgHH'>Piirkonnavoor 2020</a>#, 
page p.10, p.22.
*)

Require Import Nat.
Require Import PeanoNat.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

Require Import Arith Psatz.

Open Scope Z_scope.

Lemma isPrime2: prime 2.
Proof.
  apply prime_intro.
  red; auto.
  intros n (H,H'); Z.le_elim H; auto with zarith.
  contradict H'; auto with zarith.
  rewrite <- H. apply rel_prime_1.
Qed.

Lemma isPrime5: prime 5.
Proof. 
  apply prime_intro.
  red; auto.
  intros n (H,H'); Z.le_elim H; auto with zarith.

  assert (3*2 + (-1)*5 = 1) as H0. reflexivity.
  pose (Bezout_intro 2 5 1 3 (-1)) as H1.
  pose (bezout_rel_prime 2 5 (H1 H0)) as H2.

  assert (2*3 + (-1)*5 = 1) as H3. reflexivity.
  pose (Bezout_intro 3 5 1 2 (-1)) as H4.
  pose (bezout_rel_prime 3 5 (H4 H3)) as H5.

  assert ((-1)*4 + 1*5 = 1) as H6. reflexivity.
  pose (Bezout_intro 4 5 1 (-1) 1) as H7.
  pose (bezout_rel_prime 4 5 (H7 H6)) as H8.
Admitted.

(*
1; 2020
2: 1010 *
4; 505
5; 404
10; 202 *
20; 101
*)




Theorem ee_piirk_2020_09_1: forall a b:Z, 
  a>0 -> b>0 -> a^2 - b^2 = 2020 -> 
    ((a,b) = (506,504) \/ (a,b) = (106,96)).
Proof.
  Admitted.


Close Scope Z_scope.