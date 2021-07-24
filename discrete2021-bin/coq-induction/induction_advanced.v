Require Import Nat.
Require Import PeanoNat.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

Require Import Arith Psatz.

Open Scope nat_scope. 

Definition divide x y := exists z, y=z*x.
Notation "( x | y )" := (divide x y) (at level 0) : nat_scope.

Fixpoint sumBy3 n := match n with
  0 => 0
  | S k => (sumBy3 k) + (k+1)*(k+2)*(k+3)
end.

Eval compute in (sumBy3 0).
Eval compute in (sumBy3 1).
Eval compute in (sumBy3 5).




(** 
This is just the proof of #<a href='../discretestructures-homework07.pdf'>Problem 4 from our Homework 7</a>#: 

See also 
#<a href="https://math.stackexchange.com/questions/2358838/use-mathematical-induction-to-prove-7n2-82n1-is-divisible-by-57-for">Inductive proof of divisibility by 57</a>.#

#<p>There are many similar results in the textbook. All can be proven in a similar way.</p>#

#<b>Problem 36 (Rosen2019, p.351)</b><br/>#
Prove that 21 divides 4^(n+1) + 5^(2n-1) whenever n is an odd positive integer.

#<b>Problem 37 (Rosen2019, p.351)</b><br/>#
Prove that, if n is a positive integer, then 133 divides 11^(n+1) +12^(2n-1).

#<b>Problem 11 (Rosen2019, p.400).</b><br/>#
Use mathematical induction to prove that 43 divides 6^(n+1) + 7^(2n-1) for every positive integer n.
*)
Lemma hw7_prob4: forall (n:nat), (57 | (7^(n+2) + 8^(2*n+1))).
Proof. 
  intros n. 
  induction n.
  simpl.
  unfold divide.
  exists 1.
  reflexivity.
  assert (2 * S n + 1 = S(S(2*n+1))) as H1.
  lia.
  rewrite H1.
  assert (S n + 2 = S (n+2)) as H2.
  reflexivity.
  rewrite H2.
  rewrite (Nat.pow_succ_r' 7 (n+2)).
  rewrite (Nat.pow_succ_r' 8 (S (2 * n + 1))).
  rewrite (Nat.pow_succ_r' 8 (2 * n + 1)).
  rewrite <- mult_assoc_reverse.
  assert (8*8 = 7+57) as H3.
  reflexivity.
  rewrite H3.
  rewrite Nat.mul_add_distr_r.
  rewrite <- plus_assoc_reverse.
  rewrite <- Nat.mul_add_distr_l.
  unfold divide in IHn.
  destruct IHn as [z IHn].
  rewrite IHn.
  unfold divide.
  exists (7*z +  8 ^ (2 * n + 1)).
  lia.
Qed.




(**
This lemma is obvious for most humans (n is less than n^5 for any natural 
number n. But it still needs a proof. Our proof is by induction 
(Separate case for n=0; after that the inequality can be proven by  'lia', 
since multiplying by a number (S n)=n+1 that is at least 1, the 
right hand side becomes larger.

Feel free to use this lemma for the homework assignment.
*)

Lemma Rosen2019_p351_p33_helper5: forall (n:nat), n <= n ^ 5.
Proof.
  induction n.
  simpl.
  lia.
  unfold pow.
  lia.
Qed.






(** This recursively computes factorial:#<br/>#
factorial(0) = 1,#<br/>#
factorial(k+1) = (k+1)*factorial(k).#<br/>#
*)
Fixpoint factorial (n : nat) := match n with
  0 => 1
  | S k => (S k)*(factorial k)
end.

Compute (factorial 0).
Compute (factorial 1).
Compute (factorial 5).
Compute (factorial 8).



(** Even logarithm in Coq is defined as a recursive function as a Fixpoint.
(In most other programming languages it would be computed 
using Taylor series, numeric integration and similar real number arithmetic.)


See #<a href='https://github.com/coq/coq/blob/master/theories/Init/Nat.v'>Nat.v</a># containing all the details.

<<
Fixpoint log2_iter k p q r :=
  match k with
    | O => p
    | S k' => match r with
                | O => log2_iter k' (S p) (S q) q
                | S r' => log2_iter k' p (S q) r'
              end
  end.

Definition log2 n := log2_iter (pred n) 0 1 0.
>>


*)
Compute (log2 4096).




(**
Some results used in this proof.

<<
mult_lt_compat_l: forall n m p : nat, n < m -> 0 < p -> p * n < p * m
Nat.lt_le_incl: forall n m : nat, n < m -> n <= m
Nat.lt_le_trans: forall n m p : nat, n < m -> m <= p -> n < p
>>
*)



Lemma Rosen2019_p351_p20_helper: forall (n:nat), 3^(n+7) < (factorial (n+7)).
Proof. 
  intros n. 
  induction n.
  simpl.
  lia.
  rewrite Nat.add_succ_l.
  rewrite (Nat.pow_succ_r' 3 (n + 7)).
  assert (factorial (S (n + 7)) = (S (n+7))*(factorial (n+7))) as H1.
  simpl.
  reflexivity.
  rewrite H1.
  assert (0<3) as H2. 
  lia. 
  pose (mult_lt_compat_l (3 ^ (n + 7)) (factorial (n + 7)) 3 IHn H2) as H3.
  assert (3 < S(n+7)) as H4.
  lia.
  assert (0 < factorial (n + 7)) as H5.
  lia.
  pose (mult_lt_compat_r 3 (S (n + 7))  (factorial (n + 7)) H4 H5) as H6.
  apply Nat.lt_le_incl in H6.
  pose (Nat.lt_le_trans 
    (3 * 3 ^ (n + 7)) 
    (3 * factorial (n + 7)) 
    (S (n + 7) * factorial (n + 7)) H3 H6) as H7.
  exact H7.
Qed.

(** 
Some theorems used in this proof: 

<<
Nat.add_succ_l: forall n m : nat, S n + m = S (n + m)
not_gt: forall n m : nat, ~ n > m -> n <= m
le_not_gt: forall n m : nat, n <= m -> ~ n > m
gt_le_S: forall n m : nat, m > n -> S n <= m
>>
*)



(**
How to write inductive proofs with some other base cases (such as starting with base case n=7). 

Some examples.#<br/>#
#<a href="https://stackoverflow.com/questions/64929788/induction-with-other-base-case-in-coq">Induction with other base case</a>;<br/>#
#<a href="https://math.stackexchange.com/questions/910741/constructive-proof-of-pigeonhole-principle">Constructive proof of Pigeonhole</a>#

The method suggested below - just repeating two tactics (destruct+omega) to get rid of the first 7 natural numbers in #[0;6]#. 
This is because our inductive proof has Base Case n=7. 
*)


Lemma Rosen2019_p351_p20: forall (n:nat), n>6 -> 3^n < (factorial n).
Proof. 
  intros n.
  intros H0.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  destruct n. 
  omega.
  assert (S (S (S (S (S (S (S n)))))) = n+7) as H1.
  lia.
  rewrite H1.
  apply Rosen2019_p351_p20_helper.
Qed. 



Close Scope nat_scope.




