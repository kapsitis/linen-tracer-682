(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * LT.RAJ.2020.11-12.3 *)

(** #<b>Problem:</b># Daina cut a piece of paper into 
n>1 smaller pieces and wrote numbers 
1, 2, 3, ..., 14 to those pieces - using 
every number exactly once. 
It turned out that the totals of the numbers on all the pieces
were the same (no piece of paper was left empty; but if a 
piece contains just one number, then the total equals that number). 
Find all possible values of n. 
*)

(** See #<a href='https://bit.ly/38i3HIp'>LT.RAJ #
#Užduotys ir Sprendimai</a>#, p.24.).
*)

(** The answer is this: n=3, 5, 7. *)
(**
If the sum s = 15, then n = 7. 
The numbers on the 7 pieces can be the following: 
(1, 14); (2, 13); (3, 12); (4, 11); (5, 10); (6, 9); (7, 8).
*)
(**
If the sum s = 21, then n = 5. 
The numbers on the 5 pieces can be the following: 
(1, 7, 13); (2, 5, 14); (3, 6, 12); (10, 11); (4, 8, 9).
*)
(**
If the sum s = 35, then n = 3. 
The numbers on the 3 pieces can be the following: 
(8, 13, 14); (2, 10, 11, 12); (1, 3, 4, 5, 6, 7, 9).
*)



(**
Coq's standard way to define n-tuples.
https://coq.inria.fr/library/Coq.Vectors.Fin.html#t
Defining a finite set of n elements in Coq.
https://stackoverflow.com/questions/42871971/how-to-define-finite-set-of-n-elements-in-coq
Ordinal numbers - constructors
http://www-sop.inria.fr/marelle/gaia/RR8407.pdf

https://coq.github.io/doc/master/stdlib/Coq.FSets.FSetInterface.html
https://coq.inria.fr/library/Coq.FSets.FSetEqProperties.html

https://stackoverflow.com/questions/36588263/how-to-define-set-in-coq-without-defining-set-as-a-list-of-elements/36593938
https://github.com/Barbichu/finmap/blob/master/finmap.v
https://github.com/math-comp/math-comp/blob/master/mathcomp/ssreflect/finset.v
*)


Require Import Nat.
Require Import PeanoNat.
Require Import Between.
Require Import Arith Psatz.

Open Scope nat_scope.

(*
Require Import ssreflect ssrbool ssrfun.
*)

Require Import ListSet.
Print ListSet.

Add LoadPath "ssreflect".


Record ordinal n := {
    val :> nat;
    _   : val < n;
}.

Compute (14 =? 14).


(*
Nat.lt_le_trans: forall n m p : nat, n < m -> m <= p -> n < p
*)

Definition ab:Set := (ordinal 14).

Lemma abc: forall x:ordinal 14, (val 14 x) <=15.
Proof. 
  intros x. 
  destruct x as [x0 H0].
  pose (Nat.lt_le_trans x0 14 15) as H1.
  assert (14 <= 15) as H2. lia.
  pose (H1 H0 H2) as H3.
  assert (val 14 (Build_ordinal 14 x0 H0) = x0) as H4. 
  simpl. reflexivity.
  rewrite H4.
  pose (H1 H0 H2) as H5.
  apply Nat.lt_le_incl.
  exact H5.
Qed.


Lemma stuff: 3 < 14. Proof. lia. Qed.



Definition apci:(ordinal 14) := Build_ordinal 14 3 stuff.


Lemma easy: forall n:(ordinal 14), n*n <200.
Proof. 
  intros n.
  destruct n.
Admitted.

(** Add arguments x that satisfy F(x)=k *)
Definition ii:(ordinal 14).



Theorem lt_raj_2020_11_3: forall (n:nat) (F: (ordinal 14) -> (ordinal n)),  
  forall (k:(ordinal n)) : 






