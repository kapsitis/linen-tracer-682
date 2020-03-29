(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * Lab02 Solutions *)


Require Import Nat.
Require Import PeanoNat.

Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.

Require Import Arith Psatz.

(** * Lemmas 1-5 on Modular Arithmetic *)

(** ** Do not modify this line: sample2_1 *)

(** See Example1 from (Rosen2019, p.87): #<br/>#
If 'n' is an odd integer, then 'n^2' is odd. *)


Open Scope Z_scope.

Definition Even a := exists b, a = 2*b.
Definition Odd a := exists b, a = 2*b+1.


Lemma sample2_1: forall n: Z, (Odd n) -> (Odd (n^2)).
Proof. 
  intros n. 
  intros H.
  destruct H as [k H1].
  unfold Odd.
  exists (2*k^2 + 2*k). 
  rewrite H1.
  ring.
Qed.



(** #<b>Alternative exercise:</b>#
If you wish, you can prove a similar lemma for natural 
numbers (non-negative integers 0,1,2,etc.). 
In PeanoNat the definition of 'odd' is by induction 
rather than algebraic. So the proof would be different.
The lemma in the natural set:
<<
  Lemma sample2_1_natural: forall n: nat, 
      (odd n)=true -> (odd (n^2))=true.
  Proof.
    Admitted.
>>
The proof over naturals would likely be more interesting.
*)

Close Scope Z_scope.




(** ** Do not modify this line: sample2_2 *)

(** Just a fun lemma by Yale University about natural numbers: 
odd numbers can never equal even numbers.
See #<a href='https://bit.ly/2voDL0u'>Coq.Arith.Mult</a>.<br/>#
It is not used anywhere in this solution, 
but may suggest new proof tactics.
*) 
Theorem odd_even_lem : forall p q:nat, 2 * p + 1 <> 2 * q.
Proof.
  intros p; elim p; auto.
  intros q; case q; simpl in |- *.
  red in |- *; intros; discriminate.
  intros q'; rewrite (fun x y => plus_comm x (S y)); simpl in |- *; red in |- *;
  intros; discriminate.
  intros p' H q; case q.
  simpl in |- *; red in |- *; intros; discriminate.
  intros q'; red in |- *; intros H0; case (H q').
  replace (2 * q') with (2 * S q' - 2).
  rewrite <- H0; simpl in |- *; auto.
  repeat rewrite (fun x y => plus_comm x (S y)); simpl in |- *; auto.
  simpl in |- *; repeat rewrite (fun x y => plus_comm x (S y)); simpl in |- *;
  auto.
  case q'; simpl in |- *; auto.
Qed.

Open Scope Z_scope.

Require Import Classical_Prop.
Require Import BinInt.


(** Each integer should be even or odd. 
Cannot have integers that are neither even nor odd. *)
Lemma evenOrOdd: forall z: Z, (Even z) \/ (Odd z).
Proof. 
  intros z.
  induction z.
  left. unfold Even. exists 0. simpl. reflexivity.
  induction p.
  destruct IHp as [H1 | H2].
  right. unfold Odd. exists (Z.pos p). lia.
  right. unfold Odd. exists (Z.pos p). lia.
  left. unfold Even. exists (Z.pos p). lia.
  right. unfold Odd. exists 0. simpl. lia.
  induction p. 
  right. unfold Odd. exists ((Z.neg p)-1). lia.
  left. unfold Even. exists (Z.neg p). lia.
  right. unfold Odd. exists (-1). lia.
Qed.


Lemma isRem0: Remainder 0 2.
Proof. unfold Remainder. lia. Qed.

Lemma isRem1: Remainder 1 2.
Proof. unfold Remainder. lia. Qed.

(** Even numbers cannot be odd. *)
Lemma evenIsNotOdd: forall z: Z, (Even z) -> ~ (Odd z).
Proof. 
  intros z H1.
  destruct H1 as [k H2].
  intros H3.
  destruct H3 as [m H4].
  pose (Z.div_mod_unique 2 k m 0 1) as H5.
  pose (H5 isRem0 isRem1) as H6.
  assert (2 * k + 0 = 2 * m + 1) as H7.
  rewrite <- H2. rewrite <- H4. lia.
  pose (H6 H7) as H8. 
  destruct H8 as [_ H9].
  discriminate.
Qed.



(** Odd numbers cannot be even. *)
Lemma oddIsNotEven: forall z: Z, (Odd z) -> ~ (Even z).
Proof. 
  intros z H1.
  pose (evenOrOdd z) as H2.
  destruct H2 as [H2Even | H2Odd].
  pose (evenIsNotOdd z) as H3.
  pose (H3 H2Even) as H4.
  pose (H4 H1) as CONTRA.
  contradiction CONTRA.
  intros H5.
  pose (evenIsNotOdd z) as H6.
  pose (H6 H5) as CONTRA.
  contradiction CONTRA.
Qed.


(** See Example12 from (Rosen2019, p.91): #<br/>#
If '3n+2' is odd, then 'n' is odd. *)
Lemma sample2_2: forall n: Z, (Odd (3*n+2)) -> (Odd n).
Proof. 
  intros n. 
  intros H1.
  pose (classic (Odd n)) as H2.
  destruct H2 as [HOdd | HNotOdd].
  exact HOdd.
  pose (evenOrOdd n) as H3.
  destruct H3 as [HnEven | HnOdd].
  destruct HnEven as [k EvenExpr].
  assert (3*n + 2 = 6*k + 2) as H4.
  rewrite EvenExpr. lia. rewrite H4 in H1.
  assert (Even (6*k + 2)) as H5.
  unfold Even. exists (3*k + 1). lia.
  pose (evenIsNotOdd (6*k+2)) as H6.
  pose (H6 H5) as H7.
  pose (H7 H1) as CONTRA. 
  contradiction CONTRA.
  exact HnOdd.
Qed.



(** #<b>Alternative exercise:</b>#
A very similar lemma in the natural set:
<<
  Lemma sample2_2_natural: forall n: nat, 
      (odd (3*n+2))=true -> (odd n)=true.
Proof.
  Admitted.
>>
**)

Close Scope Z_scope.






(** ** Do not modify this line: sample2_3 *)


Lemma div_rem1: forall a b: nat, b > 1 -> (a*b + 1)/b = a.
Proof. 
  intros a b H0.
  pose (Nat.div_add_l a b 1) as H1.

  pose (gt_le_trans b 1 0) as H11.
  assert (0 <=1) as H12. lia.
  pose (H11 H0 H12) as H13.
  assert (b <> 0) as H14. lia.
  pose (H1 H14) as H6.
  assert (1/b = 0) as H3.
  pose (Nat.div_1_l b) as H4.
  assert (1 < b) as H5. lia.
  pose (H4 H5) as H7. exact H7.
  rewrite H6.
  rewrite H3. lia.
Qed.



Lemma mul_mod1: forall a b: nat,  b > 1 -> ((a * b + 1) mod b)=1.
Proof.
  intros a b H0.
  pose (Nat.mod_add 1 a b) as H1.
  assert (b>1 -> b<>0) as H2. lia.
  pose (H1 (H2 H0)) as H3.
  rewrite (Nat.add_comm 1 (a*b)) in H3.
  rewrite (Nat.mod_1_l b H0) in H3.
  exact H3.
Qed.

Lemma mul_mod0: forall a b: nat,  b <> 0 -> ((a * b) mod b)=0.
Proof.
  intros a b H0.
  pose (Nat.div_mul a b) as H1.
  pose (H1 H0) as H2.
  pose (Nat.div_mod (a*b) b) as H3.
  pose (H3 H0) as H4.
  rewrite H2 in H4.
  pose (plus_minus (a*b) (b*a) ((a*b) mod b)) as H5.
  pose (H5 H4) as H6.
  rewrite H6.
  lia.
Qed.

Lemma notEvenAreOdd: forall n: nat, Nat.even n <> true -> Nat.odd n = true.
Proof. 
  intros n H.
  unfold Nat.odd.
  assert (Nat.even n = false).
  destruct (Nat.even n).
  contradiction H.
  reflexivity.
  reflexivity.
  rewrite H0.
  simpl.
  reflexivity.
Qed.



(** See Problem44 from (Rosen2019, p.259): #<br/>#
Show that if 'n' is an integer, then 'n^2' is congruent to 0 or 1 (mod 4).
*)
Lemma sample2_3: forall n: nat, (n^2 mod 4 = 0) \/ (n^2 mod 4 = 1).
Proof.
  intros n.
  pose (classic ((Nat.even n) = true)) as H1.
  destruct H1 as [H1Even | H1NotEven].
  pose (Nat.even_spec n) as H2.
  destruct H2 as [H2RIGHT H2LEFT].
  pose (H2RIGHT H1Even) as H3.
  destruct H3 as [k H4].
  left. 
  rewrite H4.
  unfold pow. 
  assert (2 * k * (2 * k * 1) = 4*(k*k)) as H5. lia.
  rewrite H5.
  pose (mul_mod0 (k*k) 4) as H6.
  assert (4<>0) as H7. discriminate.
  pose (H6 H7) as H8.
  assert (4 * (k * k) = k * k * 4) as H9. lia.
  rewrite H9.
  exact H8.
  pose (notEvenAreOdd n) as H10.
  pose (H10 H1NotEven) as H11.
  pose (Nat.odd_spec n) as H12.
  destruct H12 as [H12RIGHT H12LEFT].
  pose (H12RIGHT H11) as H13.
  destruct H13 as [k H14].
  right. 
  rewrite H14.
  unfold pow.
  assert ((2*k + 1)*((2*k + 1)*1) = 4*(k*k + k) + 1) as H15.
  lia.
  rewrite H15.
  pose (mul_mod1 (k * k + k) 4) as H16.
  assert (4>1) as H17. lia.
  pose (H16 H17) as H18.
  assert (4 * (k * k + k) = (k * k + k) * 4) as H19. lia.
  rewrite H19.
  exact H18.
Qed.





(** ** Do not modify this line: sample2_4 *)

(** See Problem45 from (Rosen2019, p.259): #<br/># 
Show that if 'm' is a positive integer of the form '4k+3' 
for some nonnegative integer 'k', then 'm' is not 
the sum of the squares of two integers.
*)


Lemma equiv3_mod4: forall m:nat, (exists k:nat, m =4*k+3) -> (m mod 4) = 3.
Proof.
  intros m H0.
  destruct H0 as [k H1].
  pose (Nat.div_mod (4 * k + 3) 4) as H2.
  assert (4 <> 0) as H3. discriminate.
  pose (H2 H3) as H4.
  pose (Nat.div_add 3 k 4) as H5.
  pose (H5 H3) as H6.
  assert ((3 + k * 4)  = (4 * k + 3)) as H7. lia. 
  rewrite H7 in H6.
  rewrite H6 in H4.
  assert ((3/4 + k) = k) as H8. simpl. reflexivity.
  rewrite H8 in H4.
  pose (plus_minus (4 * k + 3) (4 * k) ((4 * k + 3) mod 4)) as H9.
  pose (H9 H4) as H10.
  rewrite <- H1 in H10 at 1.
  rewrite H10.
  lia.
Qed.


(**
https://stackoverflow.com/questions/29189073/coq-induction-on-modulo
*)
Lemma mod_diff : forall n m : nat, n>=m /\ m <> 0 -> (n - m) mod m = n mod m.
  intros n m [H1 H2].
  rewrite <- (Nat.mod_add _ 1); try rewrite mult_1_l, Nat.sub_add; auto.
Qed.


Lemma my_add_mod4: forall a b:nat, (a+b) mod 4 = (a mod 4 + b mod 4) mod 4.
Proof.
  intros a b.
  pose (Nat.add_mod a b 4) as H1.
  assert (4 <> 0) as H2.
  discriminate.
  pose (H1 H2) as H3.
  exact H3.
Qed.


Lemma sample2_4: 
  forall m: nat, (exists k:nat, m = 4*k+3) -> (forall a b:nat, a^2 + b^2 <> m).
Proof.
  intros m H0.
  intros a b. 
  pose (sample2_3 a) as H2.
  pose (sample2_3 b) as H3.
  pose (equiv3_mod4 m) as H4.
  pose (H4 H0) as H5.
  pose (classic (a ^ 2 + b ^ 2 = m)) as H6.
  destruct H6 as [H6EQ | H6NEQ].

  destruct H2 as [H2A | H2B].

  - { 
    destruct H3 as [H3A | H3B].
    - {
      pose (my_add_mod4 (a^2) (b^2)) as H6.
      rewrite H2A in H6. rewrite H3A in H6. 
      rewrite H6EQ in H6. rewrite H5 in H6. discriminate H6.
    }
    - {
      pose (my_add_mod4 (a^2) (b^2)) as H6.
      rewrite H2A in H6. rewrite H3B in H6. 
      rewrite H6EQ in H6. rewrite H5 in H6. discriminate H6.
    }
  }
  - {
    destruct H3 as [H3A | H3B].
    - {
      pose (my_add_mod4 (a^2) (b^2)) as H6.
      rewrite H2B in H6. rewrite H3A in H6. 
      rewrite H6EQ in H6. rewrite H5 in H6. discriminate H6.
    }
    - {
      pose (my_add_mod4 (a^2) (b^2)) as H6.
      rewrite H2B in H6. rewrite H3B in H6. 
      rewrite H6EQ in H6. rewrite H5 in H6. discriminate H6.
    }
  }
  - exact H6NEQ.
Qed.









(** ** Do not modify this line: sample2_5 *)

(** See Problem46 from (Rosen2019, p.259): #<br/>#  
Prove that if 'n' is an odd positive integer, then 
'n^2' is congruent to 1 (mod 8).
*)
Lemma sample2_5_helper: forall (n:nat), exists (k:nat), (2*n + 1)^2 = 8*k + 1.
Proof.
  induction n as [| n [m IH]].
  - now exists 0.
  - exists (S n + m). rewrite Nat.pow_2_r in *. lia.
Qed.

Lemma sample2_5_stuff: forall n:nat, Nat.odd n = true -> (exists (m:nat), n = 2*m+1).
Proof. 
  intros n H0. 
  pose (Nat.odd_spec n) as H1.
  destruct H1 as [H1RIGHT H1LEFT].
  pose (H1RIGHT H0) as H2.
  destruct H2 as [k H3].
  exists k. rewrite H3. reflexivity.
Qed.



(** See also the following proof that odd squares are all 
congruent to 1 modulo 8: 
#<a href='https://bit.ly/3cmbWXi'>(Stackexchange, 2018)</a># - 
'Writing proofs of simple arithmetic in Coq'.
*)
Lemma sample2_5: forall n: nat, (odd n) = true -> (n^2 mod 8 = 1).
Proof.
  intros n. 
  intros H1.
  pose (sample2_5_stuff n) as H2.
  pose (H2 H1) as H3.
  destruct H3 as [m H4].
  pose (sample2_5_helper m) as H5.
  rewrite <- H4 in H5. 
  destruct H5 as [kk H6].
  rewrite H6.
  pose (mul_mod1 kk 8) as H7.
  assert (8>1) as H8. lia.
  pose (H7 H8) as H9.
  assert ((8 * kk + 1) = (kk * 8 + 1)) as H10. lia.
  rewrite H10. rewrite H9. reflexivity.
Qed.







(** * Lemmas 6-10 on Mathematical Induction *)

(** Define divisibility relation between natural numbers; 
it is a predicate with two arguments, can take values
True or False. The second line introduces a shorthand
notation for divisibility using vertical bar (pipe symbol). 
You can always 'unfold' such notation. *)

Definition divide x y := exists z, y=z*x.
Notation "( x | y )" := (divide x y) (at level 0) : nat_scope.


(** ** Do not modify this line: sample2_6 *)

Fixpoint SeqA (n : nat) := match n with
  0 => 0
  | S k => (SeqA k) + (k + 1) * (3 * (k + 1) + 1)
end.


(** See Problem1 from the Latvian Regional Olympiad study material: 
#<a href='https://bit.ly/2OTn6c7'>(NMS2020)</a>:#
Prove that for each positive integer 'n' the following equality holds:#<br/>#
1*4 + 2*7 + 3*10 + ... + n*(3n+1) = n*(n + 1)^2.
*)


Lemma sample2_6: forall n, SeqA n = n * (n + 1)^2.
Proof.
  intros n. 
  induction n.
  simpl. reflexivity.
  assert ((SeqA (S n)) = (SeqA n) + (n + 1) * (3 * (n + 1) + 1)) as H.
  simpl. reflexivity.
  rewrite H.
  rewrite IHn.
  unfold pow.
  simpl. lia.
Qed.






(** ** Do not modify this line: sample2_7 *)

Fixpoint SeqB (n : nat) := match n with
  0 => 0
  | S k => (SeqB k) + (k+1)^3
end.

Fixpoint SeqC (n : nat) := match n with
  0 => 0
  | S k => (SeqC k) + (k+1)
end.

(** See Problem2 from the Latvian Regional Olympiad study material: 
#<a href='https://bit.ly/2OTn6c7'>(NMS2020)</a>:#
Prove that for each positive integer 'n' 
the following equality holds:#<br/>#
1^3 + 2^3 + 3^3 + ... + n^3 = (1 + 2 + 3 + ... + n)^2.
*)

Compute (SeqC 0).
Compute (SeqC 1).
Compute (SeqC 2).
Compute (SeqC 3).



Lemma sample2_7_helper: forall n: nat, 2*(SeqC n) = n*(n+1).
Proof. 
  intros n.
  induction n as [|k IH].
  simpl. reflexivity.
  assert ((SeqC (S k)) = (SeqC k) + (k+1)) as H2.
  simpl. reflexivity.
  rewrite H2.
  pose (Nat.mul_add_distr_l 2 (SeqC k) (k+1)) as H3.
  rewrite H3. rewrite IH.
  ring.
Qed.



Lemma square_2sides: forall m n: nat, m = n -> m^2 = n^2.
Proof.
  intros m n.
  intros H.
  rewrite H. reflexivity.
Qed.

Lemma double_square: forall n: nat, 4*n^2 = (2*n)^2.
Proof.
  intros n.
  unfold pow.
  lia.
Qed.


Lemma sample2_7: forall n: nat, (SeqB n)=(SeqC n)^2.
Proof.
  intros n.
  induction n.
  simpl. reflexivity.
  assert ((SeqB (S n)) = (SeqB n) + (n+1)^3).
  simpl. reflexivity.
  rewrite H.
  rewrite IHn.

  pose (Nat.mul_cancel_l (SeqC n ^ 2 + (n + 1) ^ 3) (SeqC (S n) ^ 2) 4) as H3.
  assert (4 <> 0). discriminate.

  pose (H3 H0) as H4.
  apply H4.
  pose (Nat.mul_add_distr_l 4 (SeqC n ^ 2) ((n + 1) ^ 3)) as H5.
  rewrite H5.
  pose (double_square (SeqC n)) as H6. rewrite H6.
  pose (double_square (SeqC (S n))) as H7. rewrite H7.

  pose (sample2_7_helper n) as H8.
  pose (sample2_7_helper (S n)) as H9.
  rewrite H8.
  rewrite H9.
  unfold pow.
  lia.
Qed.






(** ** Do not modify this line: sample2_8 *)

Definition SeqD (n: nat) := 7^n + 3^(n+1).

(** See Problem3 from the Latvian Regional Olympiad study material: 
#<a href='https://bit.ly/2OTn6c7'>(NMS2020)</a>:#
Show that for all positive integers 'n', 
7^n + 3^(n+1) is divisible by 4.
*)
Lemma sample2_8: forall n: nat, (4 | (SeqD n)).
Proof.
  induction n as [| k IH].
  assert (SeqD 0 = 4).
  simpl. reflexivity.
  rewrite H.
  unfold divide. exists 1. simpl. reflexivity.
  assert (SeqD (S k) = 7*(SeqD k) - 4*3^(k+1)) as H1.
  unfold SeqD.
  pose (Nat.pow_succ_r' 7 k) as H2. rewrite H2.
  assert (S k + 1 = S (k+1)) as H3. lia.
  rewrite H3.
  pose (Nat.pow_succ_r' 3 (S k)) as H4.
  simpl. lia.
  destruct IH as [m H5].
  unfold divide.
  exists (7*m  - 3^(k+1)).
  rewrite H1.
  rewrite H5.
  assert (forall M:nat, 7*(m*4) - 4*M = (7*m - M)*4).
  intros M. lia.
  pose (H (3 ^ (k + 1))) as H6.
  exact H6.
Qed.





 







(** ** Do not modify this line: sample2_9 *)

Definition SeqE (n: nat):nat := 3*n^5 + 5*n^4 - 8*n.

(** See Problem4 from the Latvian Regional Olympiad study material: 
#<a href='https://bit.ly/2OTn6c7'>(NMS2020)</a>:#
Prove that for any positive integer 'n' the expression
3n^5 + 5n^4 - 8n is divisible by 10.
*)

(** Any number divisible by 2 and by 5 is also divisible by 10. *)
Lemma div10_with2and5: forall a b: nat, 
  (2 | a) -> (5 | b) -> (10 | (a*b)).
Proof. 
  intros a b H1 H2.
  destruct H1 as [u H1A].
  destruct H2 as [v H2A].
  unfold divide.
  exists (u*v).
  rewrite H1A. rewrite H2A.
  lia.
Qed.

(** If we multiply any number 'b' by an even number 'a'
from the left side, the product 'a*b' is even *)
Lemma mul_by_even_l: forall a b: nat, 
  Nat.Even a -> Nat.Even (a*b).
Proof. 
  intros a b H0.
  pose (Nat.even_add_mul_even  0 a b) as H1.
  rewrite (Nat.add_0_l (a*b)) in H1.
  assert (Nat.even (a*b) = true).
  rewrite (H1 H0).
  simpl. reflexivity.
  pose (Nat.even_spec (a*b)) as H2.
  destruct H2 as [H3 _].
  apply (H3 H).
Qed.

(** Same result, if we multiply with an even 'a' from the right. *)
Lemma mul_by_even_r: forall a b: nat, 
  Nat.Even b -> Nat.Even (a*b).
Proof.
  intros a b H0.
  rewrite (Nat.mul_comm a b).
  apply (mul_by_even_l b a).
  exact H0.
Qed.



(** The product of two odd numbers is odd. *)
Lemma mul_odd_by_odd: forall a b: nat, 
  Nat.Odd a -> Nat.Odd b -> Nat.Odd (a*b).
Proof. 
  intros a b H1 H2.
  destruct (Nat.odd_spec a) as [_ H3].
  pose (H3 H1) as H4.
  destruct (Nat.odd_spec b) as [_ H5].
  pose (H5 H2) as H6.
  pose (Nat.odd_mul a b) as H7.
  rewrite H4 in H7.
  rewrite H6 in H7.
  assert ((true && true)%bool = true) as H8. simpl. reflexivity.
  rewrite H8 in H7.
  destruct (Nat.odd_spec (a*b)) as [H9 _].
  apply (H9 H7).
Qed.


(** Any natural power of an odd number is odd. *)
Lemma mul_odd_power: forall a n: nat, 
  Nat.Odd a -> Nat.Odd (a^n).
Proof. 
  intros a n H0.
  induction n.
  unfold pow. unfold Nat.Odd. exists 0. reflexivity.
  pose (Nat.pow_succ_r a n) as H1.
  pose (Peano.le_0_n n) as H2.
  pose (H1 H2) as H3.
  pose (mul_odd_by_odd a (a^n) H0 IHn) as H4.
  rewrite H3.
  exact H4.
Qed.



Lemma even_npptn_helper: forall k:nat,
  Nat.Odd k -> Nat.Even (3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7).
Proof. 
  intros k H0.
  pose (mul_by_even_l 10 (k^2)) as H2.
  assert (Nat.Even 10) as H3. unfold Nat.Even. exists 5. reflexivity.
  pose (H2 H3) as H4.
  pose (mul_by_even_l 12 k) as H5.
  assert (Nat.Even 12) as H6. unfold Nat.Even. exists 6. reflexivity.
  pose (H5 H6) as H7.
  assert (Nat.Odd 3) as H8. unfold Nat.Odd. exists 1. reflexivity.
  pose (mul_odd_power k 3) as H9.
  pose (H9 H0) as H10.
  pose (mul_odd_by_odd 3 (k^3)) as H11.
  pose (H11 H8 H10) as H12.
  assert (Nat.Odd (3 * k ^ 3 + 10 * k ^ 2 + 12*k + 6)).
  pose (Nat.odd_add_mul_2 (3*k^3)  (5*k^2 + 6*k + 3)) as H13.
  destruct (Nat.odd_spec (3*k^3)) as [_ H14].
  rewrite (H14 H12) in H13.
  destruct (Nat.odd_spec (3*k^3+10*k^2+12*k + 6)) as [H15 _].
  assert (3 * k ^ 3 + 10 * k ^ 2 + 12*k + 6 = 
    3 * k ^ 3 + 2 * (5 * k ^ 2 + 6 * k + 3)) as H16. 
  unfold pow. lia.
  rewrite <- H16 in H13.
  apply (H15 H13).
  destruct (Nat.Even_succ (3 * k ^ 3 + 10 * k ^ 2 + 12*k + 6)) as [_ H17].
  assert (S (3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 6) = 
    3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7) as H18. unfold pow. lia.
  rewrite H18 in H17.
  apply (H17 H).
Qed.


Lemma even_nppn: forall k:nat, 
  Nat.Even (k*(3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7)).
Proof.
  intros k.
  pose (Nat.Even_or_Odd k) as H1.
  destruct H1 as [KEven | KOdd].
  apply (mul_by_even_l k (3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7)).
  exact KEven.
  pose (even_npptn_helper k) as H12.
  pose (H12 KOdd) as H13.
  pose (mul_by_even_r k  (3*k^3 + 10*k^2 + 12*k + 7)) as H14.
  pose (H14 H13) as H15.
  exact H15.
Qed.



Lemma sample2_9_nppn: forall k:nat, 
  (2 | k*(3*k^3 + 10*k^2 + 12*k + 7)).
Proof.
  intros k.
  unfold divide.

  pose (classic ((Nat.even k) = true)) as H1.
  destruct H1 as [H1Even | H1NotEven].
  pose (Nat.even_spec k) as H2.
  destruct H2 as [H2RIGHT H2LEFT].
  pose (H2RIGHT H1Even) as H3.
  destruct H3 as [k2 H4].
  exists (k2 * (3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7)).
  rewrite <- (Nat.mul_assoc k2 (3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7)  2).
  rewrite (Nat.mul_comm (3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7)  2).
  rewrite (Nat.mul_assoc k2 2 (3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7)).
  rewrite (Nat.mul_comm k2 2).
  rewrite H4.
  reflexivity.

  pose (notEvenAreOdd k) as H10.
  pose (H10 H1NotEven) as H11.
  pose (even_nppn k) as H12.
  destruct H12 as [m H13].
  exists m.
  rewrite H13.
  apply (Nat.mul_comm 2 m).
Qed.






Lemma div10_with2and5_app: forall k:nat, 
  (10 | (5*k*(3*k^3 + 10*k^2 + 12*k + 7))).
Proof. 
  intros k.
  assert (5 | 5) as H1.
  unfold divide. exists 1. simpl. reflexivity.
  pose (sample2_9_nppn k) as H2.
  pose (div10_with2and5 
    (k*(3*k^3 + 10*k^2 + 12*k + 7)) 5) as H3.
  pose (H3 H2 H1) as H4.
  rewrite (Nat.mul_comm (5 * k) (3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7)).
  rewrite (Nat.mul_comm k (3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7)) in H4.
  rewrite <- (Nat.mul_assoc 
    (3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7)  k   5) in H4.
  rewrite (Nat.mul_comm k 5) in H4.
  exact H4.
Qed.



(** Newton's binomial formula for n=5 *)
Lemma binomial5: forall a b:nat, 
  (a + b)^5 = a^5 + 5*a^4*b + 10*a^3*b^2 + 10*a^2*b^3 + (5*a*b^4 + b^5).
Proof. 
  intros a b.
  unfold pow. lia.
Qed.

(** Newton's binomial formula for n=4 *)
Lemma binomial4: forall a b:nat, 
  (a + b)^4 = a^4 + 4*a^3*b + 6*a^2*b^2 + (4*a*b^3 + b^4).
Proof. 
  intros a b.
  unfold pow. lia.
Qed.


(** Simple algebra for Nat numbers may become tricky. 
At every step when we move around terms with 'minus' sign, 
need to ensure that the intermediate results do not go below 0. *)
Lemma sample2_9_recombine: forall a b c d:nat, 
  b <= a -> b <= c -> a - b + (c + d) = a + (c - b + d).
Proof.
  intros a b c d.
  intros H1 H2.
  pose (Nat.add_sub_swap a (c + d) b) as H3.
  pose (H3 H1) as H4.
  rewrite <- H4.
  pose (Nat.add_sub_assoc a (c+d) b) as H5.
  assert (b <= c+d) as H6.
  assert (0 <= d) as H7. lia.
  pose (Nat.add_le_mono b c 0 d) as H8.
  pose (H8 H2 H7) as H9.
  rewrite <- (plus_n_O b) in H9.
  exact H9.
  pose (H5 H6) as H10.
  rewrite <- H10.
  rewrite (Nat.add_sub_swap c d b).
  reflexivity.
  exact H2.
Qed.


Lemma sample2_9_helperAA: forall k:nat, k <= k^5.
Proof.
  induction k.
  unfold pow. lia.
  assert (S k = k+1) as H1. lia.
  rewrite H1. 
  pose (binomial5 k 1) as H2.
  rewrite H2.
  unfold pow. lia.
Qed.

Lemma sample2_9_helperAB: forall k:nat, k <= k^4.
Proof.
  induction k.
  unfold pow. lia.
  assert (S k = k+1) as H1. lia.
  rewrite H1. 
  pose (binomial4 k 1) as H2.
  rewrite H2.
  unfold pow. lia.
Qed.



Lemma sample2_9_helperA: forall k:nat,
  8 * k <= 3 * k ^ 5 + 5 * k ^ 4.
Proof. 
  intros k.
  assert (3*k <= 3*k^5) as H1.
  pose (sample2_9_helperAA k) as H2.
  assert (0 <= 3) as H3. lia.
  pose (Nat.mul_le_mono_nonneg_l k (k ^ 5) 3) as H4.
  pose (H4 H3 H2) as H5.
  exact H5.
  assert (5*k <= 5*k^4) as H11.
  pose (sample2_9_helperAB k) as H12.
  assert (0 <= 5) as H13. lia.
  pose (Nat.mul_le_mono_nonneg_l k (k ^ 4) 5) as H14.
  pose (H14 H13 H12) as H15.
  exact H15.
  pose (Nat.add_le_mono (3 * k) (3 * k ^ 5)
    (5 * k) (5 * k ^ 4)) as H21.
  pose (H21 H1 H11) as H22.
  assert (8*k = 3*k + 5*k) as H23. lia.
  rewrite H23.
  exact H22.
Qed.




Lemma sample2_9: forall n: nat, (10 | (SeqE n)).
Proof.
  intros n.
  induction n as [| k IH].
  assert ((SeqE 0) = 0) as H1.
  unfold SeqE. unfold pow. reflexivity.
  rewrite H1. unfold divide. exists 0. reflexivity.
  assert (SeqE (S k) = (SeqE k) + (5*k*( 3*k^3 + 10*k^2 + 12*k + 7))).
  unfold SeqE.
  pose (binomial4 k 1) as H1.
  assert (S k = k+1) as H2. lia.
  rewrite H2.
  rewrite H1.
  rewrite (Nat.mul_add_distr_l 5 
    (k^4 + 4*k^3*1 + 6*k^2*1^2) (4*k*1^3 + 1^4)).
  rewrite (Nat.mul_add_distr_l 5 
    (4*k*1^3) (1^4)).
  assert (5 * (4 * k * 1 ^ 3) + 5 * 1 ^ 4 = 20*k + 5) as H3.
  unfold pow. lia.
  rewrite H3.
  rewrite (Nat.add_comm 
    (5*(k^4 + 4*k^3*1 + 6*k^2*1^2))
    (20*k + 5)).
  pose (binomial5 k 1) as H4. rewrite H4.
  rewrite (Nat.mul_add_distr_l 3 
    (k^5 + 5*k^4*1 + 10*k^3*1^2 + 10*k^2*1^3)
    (5*k*1^4 + 1^5)).
  clear H1 H2 H4.

  assert (3 * (5 * k * 1 ^ 4 + 1 ^ 5) = 15*k + 3) as H5. 
  unfold pow. lia.
  rewrite H5.
  rewrite (Nat.add_assoc 
    (3*(k^5 + 5*k^4*1 + 10*k^3*1^2 + 10*k^2*1^3) + (15*k + 3)) 
    (20 * k + 5) 
    (5 *(k^4 + 4*k^3*1 + 6*k^2*1^2))).
  rewrite <- (Nat.add_assoc 
    (3*(k^5 + 5*k^4*1 + 10*k^3*1^2 + 10*k^2*1^3)) 
    (15*k + 3) (20 * k + 5)).
  assert (15 * k + 3 + (20 * k + 5) = 35*k + 8) as H6. lia.
  rewrite H6.
  rewrite <- (Nat.add_assoc 
    (3*(k^5 + 5*k^4*1 + 10*k^3*1^2 + 10*k^2*1^3))
    (35*k+8) 
    (5*(k ^ 4 + 4 * k ^ 3 * 1 + 6 * k ^ 2 * 1 ^ 2))).
  pose (Nat.add_sub_assoc 
(3 * (k ^ 5 + 5 * k ^ 4 * 1 + 10 * k ^ 3 * 1 ^ 2 + 10 * k ^ 2 * 1 ^ 3))
(35 * k + 8 + 5 * (k ^ 4 + 4 * k ^ 3 * 1 + 6 * k ^ 2 * 1 ^ 2)) 
(8 * (k + 1))) as H7.
  assert (8 * (k + 1) <=
     35 * k + 8 + 5 * (k ^ 4 + 4 * k ^ 3 * 1 + 6 * k ^ 2 * 1 ^ 2)) as H8.
  lia.
  pose (H7 H8) as H9. 
  rewrite <- H9. clear H7 H8 H9.
  rewrite (Nat.add_comm 
    (35*k+8)
    ( 5 * (k ^ 4 + 4 * k ^ 3 * 1 + 6 * k ^ 2 * 1 ^ 2))).
  pose (Nat.add_sub_assoc 
    (5 * (k ^ 4 + 4 * k ^ 3 * 1 + 6 * k ^ 2 * 1 ^ 2)) 
    (35 * k + 8)
    (8 * (k + 1))) as H10.
  assert (8 * (k + 1) <= 35 * k + 8) as H11. lia.
  pose (H10 H11) as H12. 
  rewrite <- H12. clear H10 H11 H12.
  assert (35 * k + 8 - 8 * (k + 1) = 27*k) as H13. lia.
  rewrite H13.

  assert (3 * k ^ 3 + 10 * k ^ 2 + 12 * k + 7 = 
    7 + (3 * k ^ 3 + 10 * k ^ 2 + 12 * k)) as H14. lia.
  rewrite H14.
  rewrite (Nat.mul_add_distr_l (5 * k) 7
    (3 * k ^ 3 + 10 * k ^ 2 + 12 * k)).
  assert (5*k*7 = 35*k) as H15. lia. rewrite H15.
  clear H13 H14 H15.

  pose (sample2_9_recombine 
    (3*k^5 + 5*k^4) (8*k)
    (35*k) (5*k*(3*k^3 + 10*k^2 + 12*k))) as H16.
  pose (sample2_9_helperA k) as H17. 
  pose (H16 H17) as H18.
  assert (8 * k <= 35 * k) as H19. lia.
  pose (H18 H19) as H20.
  rewrite H20.
  assert (35 * k - 8 * k = 27*k) as H21. lia.
  rewrite H21.
  unfold pow.
  lia.

  pose (div10_with2and5_app k) as H22.
  destruct H22 as [u H23].
  destruct IH as [v H24].
  unfold divide.
  exists (v+u).
  rewrite H.
  rewrite H24.
  rewrite H23.
  lia.
Qed.




(** ** Do not modify this line: sample2_10 *)

Fixpoint SeqFF (n : nat):nat := match n with
  | 0 => 0
  | S n' => match n' with 
      | 0 => 1 
      | 1 => 5
      | S n'' => 5*(SeqFF n') - 6*(SeqFF n'')
      end
  end.


Compute (SeqFF 0). (* 0 *)
Compute (SeqFF 1). (* 1 *)
Compute (SeqFF 2). (* 5 *)
Compute (SeqFF 3). (* 19 *)
Compute (SeqFF 4). (* 65 *)


(** This Lemma seems obvious *)
(** Still, do not know (yet) how to prove this:
<<
Lemma is_this_easy: forall n, 
  SeqFF (S (S n)) = 5 * SeqFF (S n) - 6 * SeqFF n.
Proof.
  Admitted.
>>
For this reason, we would define 
another sequence: not #<tt>(SeqFF n)</tt>#, 
but #<tt>(SeqF n)</tt>#.
*)


(** Need a different implementation of SeqF *)
Fixpoint SeqF (n : nat):nat := match n with
  | 0 => 0
  | 1 => 1
  | (S n') => 5*(SeqF n') - 6*(SeqF (pred n'))
  end.

Compute (SeqF 0). (* 0 *)
Compute (SeqF 1). (* 1 *)
Compute (SeqF 2). (* 5 *)
Compute (SeqF 3). (* 19 *)
Compute (SeqF 4). (* 65 *)


(** See Problem5 from the Latvian Regional Olympiad study material: 
#<a href='https://bit.ly/2OTn6c7'>(NMS2020)</a>:#
Sequence x(n) is defined recursively as#<br/>#
x(n+2) = 5x(n+1) - 6x(n) and x(1) = 1, x(2) = 5.#<br/>#
Prove that every member of this sequence satisfies this equality:
x_n = 3^n - 2^n.
*)
(* 
https://stackoverflow.com/questions/53998991/can-i-tell-coq-to-do-induction-from-n-to-n2
https://www.cs.cornell.edu/courses/cs3110/2017fa/l/22-coq-induction/lec.pdf
https://softwarefoundations.cis.upenn.edu/sf-4.0/IndPrinciples.html
*)



Lemma power_two: forall n:nat, 2^(S n) = 2*2^n.
Proof. 
  intros n. 
  pose (Nat.pow_succ_r 2 n) as H1.
  pose (Peano.le_0_n n) as H2.
  pose (H1 H2) as H3.
  rewrite H3. reflexivity.
Qed.

Lemma power_three: forall n:nat, 3^(S n) = 3*3^n.
Proof. 
  intros n. 
  pose (Nat.pow_succ_r 3 n) as H1.
  pose (Peano.le_0_n n) as H2.
  pose (H1 H2) as H3.
  rewrite H3. reflexivity.
Qed.


Definition Predicate10(n:nat):Prop := SeqF n = 3^n - 2^n.

Lemma sample2_10_ineq: forall A B:nat, 
  (A >= B) -> (6 * A - 6 * B <= 10 * A - 10 * B).
Proof.
  intros A B H0.
  rewrite <- (Nat.mul_sub_distr_l A B 6).
  rewrite <- (Nat.mul_sub_distr_l A B 10).
  lia.
Qed.

Lemma sample2_10_ineq_another: forall n:nat, 3^n >= 2^n.
Proof.
  induction n.
  unfold pow.
  lia.
  pose (power_three n) as H1. rewrite H1.
  pose (power_two n) as H2. rewrite H2.
  lia.
Qed.



Lemma sample2_10_algebra: forall A B:nat, 
  A >= B -> 5*(3*A - 2*B) - 6*(A - B) = 3*(3*A) - 2*(2*B).
Proof.
  intros A B H0.
  rewrite (Nat.mul_sub_distr_l (3*A) (2*B) 5).
  rewrite (Nat.mul_sub_distr_l A B 6).
  rewrite (Nat.mul_assoc 5 3 A).
  rewrite (Nat.mul_assoc 5 2 B).
  rewrite (Nat.mul_assoc 3 3 A).
  rewrite (Nat.mul_assoc 2 2 B).
  assert (5*3 = 15) as H1. reflexivity. rewrite H1.
  assert (5*2 = 10) as H2. reflexivity. rewrite H2.
  assert (3*3 = 9) as H3. reflexivity. rewrite H3.
  assert (2*2 = 4) as H4. reflexivity. rewrite H4.

  assert (10 * A - 10 * B  - (6*A - 6*B) =  4*A - 4*B) as H5.
  lia.
  assert (15*A = 5*A + 10*A) as H6. lia. rewrite H6.
  rewrite <- (Nat.add_sub_assoc (5*A) (10*A) (10*B)).
  pose (Nat.add_sub_assoc (5*A) (10*A-10*B) (6*A-6*B)) as H7.
  pose (sample2_10_ineq A B) as H8.
  pose (H8 H0) as H9.
  pose (H7 H9) as H10.
  rewrite <- H10.
  rewrite H5.
  lia.
  lia.
Qed.


Lemma sample2_10_helper: forall n:nat, 
  Predicate10 n -> Predicate10 (S n) -> Predicate10 (S (S n)).
Proof. 
  unfold Predicate10.
  intros n IH0 IH1.
  assert (SeqF (S (S n)) = 5 * SeqF (S n) - 6 * SeqF n) as H3.
  reflexivity.
  rewrite H3.
  rewrite IH1.
  rewrite IH0.
  pose (power_three (S n)) as H4. rewrite H4.
  pose (power_two (S n)) as H5. rewrite H5.
  pose (power_three n) as H6. rewrite H6.
  pose (power_two n) as H7. rewrite H7.
  pose (sample2_10_algebra (3^n) (2^n)) as H8.
  pose (sample2_10_ineq_another n) as H9.
  pose (H8 H9) as H10.
  exact H10.
Qed.


(** Unlike earlier induction examples, this 
one needs a reasoning scheme: If a predicate is true 
for P(0) and P(1) and if also (P(n) /\ P(n+1)) -> P(n+2), 
then it must be true for all numbers. 
See #<a href='https://bit.ly/3983iJN'>Can I tell Coq # 
#to do induction from n to n+2?</a>#
for more hints on this.
*)
Lemma pair_induction (P : nat -> Prop) :
  P 0 -> P 1 ->
  (forall n, P n -> P (S n) -> P (S (S n))) ->
  forall n, P n.
Proof.
  intros H0 H1 Hstep n.
  enough (P n /\ P (S n)) by easy.
  induction n; intuition.
Qed.


(** This lemma uses the abovementioned 'pair_induction': 
If P(0) and P(1) are both true and 
P(k) and P(k+1) imply P(k+2). then the predicate
P(k) is always true. *)
Lemma sample2_10: forall n: nat, (SeqF n) = 3^n - 2^n.
Proof.
  pose (pair_induction Predicate10) as InductionScheme.
  assert (Predicate10 0) as H0. 
  unfold Predicate10. simpl. reflexivity.
  assert (Predicate10 1) as H1. 
  unfold Predicate10. simpl. reflexivity.
  pose (InductionScheme H0 H1 sample2_10_helper) as H2.
  intros n.
  pose (H2 n) as H3.
  destruct H3.
  reflexivity.
Qed.








(** * Lemmas 11-15 are Properties of Lists of Non-Negative Integers *)

(** You do not need to modify anything in 
this intro section. These function definitions and notations
will be used below in samples 11 to 15. *)

Inductive natlist : Type :=
  | nil
  | cons (n : nat) (L : natlist).

Notation "x :: L" := (cons x L)
                     (at level 60, right associativity).
Notation "[ ]" := nil.

Notation "[ x ; .. ; y ]" := (cons x .. (cons y nil) ..).

(** The function repeats numbers. For example,
this should return the list #<tt>[5;5;5;5;5;5;5]</tt>#:
<<
  Compute (repeat 5 7).
>>
*)
Fixpoint repeat (n count : nat) : natlist :=
  match count with
  | O => nil
  | S count' => n :: (repeat n count')
  end.


(** The function returns the length of the list. For example, this should return 5:
<<
  Compute (length [1;2;4;8;16]).
>> 
*)
Fixpoint length (L:natlist) : nat :=
  match L with
  | nil => O
  | h :: t => S (length t)
  end.




(** The function appends one list at the end of another. For example, 
this should return #<tt>[1;2;4;8;16;3;5]</tt>#:
<<
  Compute (app [1;2;4;8;16] [3;5]).
>>
*)
Fixpoint app (L1 L2 : natlist) : natlist :=
  match L1 with
  | nil => L2
  | h :: t => h :: (app t L2)
  end.


(** Appending lists will be expressed as an infix operator #<tt>++</tt># *)
Notation "x ++ y" := (app x y)
                     (right associativity, at level 60).


(** The function to reverse a list. For example, #<tt>(rev [1,2,3])</tt># 
is #<tt>[3,2,1]</tt># *)
Fixpoint rev (L:natlist) : natlist :=
  match L with
  | nil => nil
  | h :: t => rev t ++ [h]
  end.

(** The function returns the list of all natural numbers from 1 to n. 
It is empty, if n=0 *)
Fixpoint rangeTo(n:nat): natlist :=
  match n with
  | 0 => []
  | (S n') => (rangeTo n') ++ [n]
  end.


Fixpoint nonzeros (l:natlist) : natlist := 
  match l with
  | nil => nil
  | 0 :: t => nonzeros(t)
  | h :: t => h :: nonzeros(t)
  end.

Example test_nonzeros:
  nonzeros [0;1;0;2;3;0;0] = [1;2;3].
Proof. 
  simpl. reflexivity.
Qed.



Fixpoint oddmembers (l:natlist) : natlist :=
  match l with
  | nil => nil
  | h :: t => if odd h
      then h :: oddmembers(t)
      else oddmembers(t)
  end.

Example test_oddmembers:
  oddmembers [0;1;0;2;3;0;0] = [1;3].
Proof. simpl. reflexivity. Qed.

Definition countoddmembers (l:natlist) : nat :=
  length (oddmembers l).

Example test_countoddmembers1:
  countoddmembers [1;0;3;1;4;5] = 4.
Proof. simpl. reflexivity. Qed.

Example test_countoddmembers2:
  countoddmembers [0;2;4] = 0.
Proof. simpl. reflexivity. Qed.

Example test_countoddmembers3:
  countoddmembers nil = 0.
Proof. simpl. reflexivity. Qed.





(** ** Do not modify this line: sample2_11 *)

(** See the Theorem #<tt>'rev_app_distr'</tt># from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#. 
This lemma tells how to reverse a concatentation of two lists: 
#<tt>rev([1;2;4]++[7;11]) = [11;7]++[4;2;1].</tt>#
*)

Lemma concat_nil_r: forall L: natlist, L ++ [] = L.
Proof. 
  intros L.
  induction L as [| n LL IHL].
  simpl. reflexivity.
  simpl. 
  rewrite IHL.
  reflexivity.
Qed.

Lemma concat_h_tail_tail: forall (n:nat) (L1 L2: natlist), 
  (n::L1)++L2 = n::(L1++L2).
Proof. 
  intros n L1 L2.
  induction L1 as [| m L1TAIL IH].
  simpl. reflexivity.
  simpl. reflexivity.
Qed.



Lemma concat_assoc: 
  forall L1 L2 L3: natlist, (L1 ++ L2) ++ L3 = L1 ++ L2 ++ L3.
Proof. 
  intros L1 L2 L3.
  induction L1 as [| n L1TAIL IH].
  simpl. reflexivity.
  pose (concat_h_tail_tail n L1TAIL L2) as H2. rewrite H2.
  simpl.
  rewrite IH. reflexivity.
Qed. 


Lemma sample2_11: forall L1 L2 : natlist,
  rev (L1 ++ L2) = rev L2 ++ rev L1.
Proof.
  intros L1 L2.
  induction L1 as [| n L11 IHL1].
  simpl.
  pose (concat_nil_r (rev L2)) as H2. rewrite H2.
  reflexivity.
  simpl. rewrite IHL1.
  pose (concat_assoc (rev L2) (rev L11) [n]) as H3.
  exact H3.
Qed.




(** ** Do not modify this line: sample2_12 *)

(** See the Theorem #<tt>'rev_involutive'</tt># from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#. 
This lemma tells that reversing any list two times returns the
original list: #<tt>rev(rev([1;2;4])) = rev([4;2;1]) = rev([1;2;4])</tt>#. 
*)

Lemma concat_single: forall (n:nat) (L:natlist), 
  n::L = [n] ++ L.
Proof. 
  intros n L.
  induction L as [| m LTAIL IH].
  simpl. reflexivity.
  simpl. reflexivity.
Qed.


Lemma sample2_12: forall L : natlist,
  rev (rev L) = L.
Proof.
  intros L.
  induction L as [| n LTAIL IH].
  simpl. reflexivity.
  pose (concat_single n LTAIL) as H1.
  rewrite H1.
  pose (sample2_11 [n] LTAIL) as H2.
  rewrite H2.
  pose (sample2_11 (rev LTAIL) (rev [n])) as H3.
  rewrite H3.
  rewrite IH. simpl. reflexivity.
Qed.
  



(** ** Do not modify this line: sample2_13 *)

(** See the Theorem 'app_assoc4' from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#.
This lemma tells that list concatenation is associative; 
one can regroup as long as the order of lists does not change.
*)

Lemma sample2_13: forall L1 L2 L3 L4 : natlist,
  L1 ++ (L2 ++ (L3 ++ L4)) = ((L1 ++ L2) ++ L3) ++ L4.
Proof.
  intros L1 L2 L3 L4.
  pose concat_assoc as H1.
  rewrite H1.
  rewrite H1.
  reflexivity.
Qed.


(** A longer proof can use associativity with special substitutions, 
but this is longer. 
<<
  Lemma sample2_13: forall L1 L2 L3 L4 : natlist,
    L1 ++ (L2 ++ (L3 ++ L4)) = ((L1 ++ L2) ++ L3) ++ L4.
  Proof.
    intros L1 L2 L3 L4.
    pose (concat_assoc L1 L2 L3) as H1.
    rewrite H1.
    pose (concat_assoc L1 (L2 ++ L3) L4) as H2.
    rewrite H2.
    pose (concat_assoc L2 L3 L4) as H3.
    rewrite H3.
    reflexivity.
  Qed.
>>
*)



(** ** Do not modify this line: sample2_14 *)

(** See the Theorem 'rev_injective' from the Coq textbook
#<a href='https://bit.ly/2uuX1ZK'>Lists: Working with Structured Data</a>#.
This lemma tells that reversing a list is an injection: different lists
must lead to different reversed lists.
*)

Lemma list_refl: forall L: natlist, L = L.
Proof. reflexivity. Qed.

Lemma sample2_14:  forall L1 L2 : natlist, rev L1 = rev L2 -> L1 = L2.
Proof.
  intros L1 L2.
  intros H. 
  pose (list_refl (rev (rev L1))) as H1.
  rewrite H in H1 at 2.
  pose (sample2_12 L1) as H2.
  pose (sample2_12 L2) as H3.
  rewrite H2 in H1.
  rewrite H3 in H1.
  exact H1.
Qed.









(** ** Do not modify this line: sample2_15 *)

(** See #<a href='https://bit.ly/2tM6N9C'>Latvian Open Math Olympiad, 2004</a>#, 
Grade 8, Problem 5.#<br/>#
In an increasing sequence there are all positive integers from 1 to 2004; 
every number is written exactly once.
We remove all numbers that are written in the positions 
n=1, n=4, n=7, n=10, and so on. 
From the remaining sequence we again remove all numbers in 
the positions n=1, n=4, n=7, n=10.#<br/>#
We repeat this procedure until there is only one number left. 
Which one is it? *)

(** This function should return a new list where 
1st, 4th, 7th, etc. members are removed *)
Fixpoint sample15_rm_one_third (L: natlist) : natlist := 
 match L with
  | nil => nil
  | h1 :: nil => nil
  | h1 :: h2 :: nil => h2 :: nil
  | (h1 :: h2 :: h3 :: t) => h2 :: h3 :: (sample15_rm_one_third t)
  end.


(* FILL IN HERE. (Returning list 'L' as is done now would be wrong). *) 

(** These are 10 unit tests. Once the function is 
defined correctly, each proof here can be replaced
by #<tt>'Proof. simpl. reflexivity. Qed'</tt># or similar.*)
Example sample15_test0: sample15_rm_one_third [] = [].
Proof. simpl. reflexivity. Qed.
Example sample15_test1: sample15_rm_one_third [1] = [].
Proof. simpl. reflexivity. Qed.
Example sample15_test2: sample15_rm_one_third [1;2] = [2].
Proof. simpl. reflexivity. Qed.
Example sample15_test3: sample15_rm_one_third [1;2;3] = [2;3].
Proof. simpl. reflexivity. Qed.
Example sample15_test4: sample15_rm_one_third [1;2;3;4] = [2;3].
Proof. simpl. reflexivity. Qed.
Example sample15_test5: sample15_rm_one_third [1;2;3;4;5] = [2;3;5].
Proof. simpl. reflexivity. Qed.
Example sample15_test6: sample15_rm_one_third [1;2;3;4;5;6] = [2;3;5;6].
Proof. simpl. reflexivity. Qed.
Example sample15_test7: sample15_rm_one_third [1;2;3;4;5;6;7] = [2;3;5;6].
Proof. simpl. reflexivity. Qed.
Example sample15_test8: sample15_rm_one_third [1;2;3;4;5;6;7;8] = [2;3;5;6;8].
Proof. simpl. reflexivity. Qed.
Example sample15_test9: sample15_rm_one_third [1;2;3;4;5;6;7;8;9] = [2;3;5;6;8;9].
Proof. simpl. reflexivity. Qed.


(** This function is supposed to return the last number that
remains, if we apply #<tt>'sample15_rm_one_third'</tt># until  
the last number remains. *)


Fixpoint recursive_remove (j:nat) (k:nat) (L:natlist) (M:natlist): nat :=
  match k with 
  | 0 => 
      match M with 
      | nil => 0
      | MHead :: MTail => MHead
      end
  | S k' => 
      match L with 
      | nil => 
          match M with 
          | nil => (recursive_remove 0 k' [] [])
          | MHead::nil => (recursive_remove 0 k' [] [MHead])
          | MHead::MTail => (recursive_remove 1 k' (MHead::MTail) [])
          end
      | LHead::LTail => 
          match j with 
          | 1 => (recursive_remove 2 k' LTail M)
          | 2 => (recursive_remove 3 k' LTail (M++[LHead]))
          | _ => (recursive_remove 1 k' LTail (M++[LHead]))
          end
      end
  end.

Definition sample15_rm_until_last (L: natlist) : nat := 
  match L with 
  | nil => 0
  | LHead::nil => LHead
  | _ => recursive_remove 1 (3*(length L)) L []
  end.



Example sample15_test10: sample15_rm_until_last [] = 0.
Proof. simpl. reflexivity. Qed.
Example sample15_test11: sample15_rm_until_last [1] = 1.
Proof. simpl. reflexivity. Qed.
Example sample15_test12: sample15_rm_until_last [1;2] = 2.
Proof. simpl. reflexivity. Qed.
Example sample15_test13: sample15_rm_until_last [1;2;3] = 3.
Proof. simpl. reflexivity. Qed.
Example sample15_test14: sample15_rm_until_last [1;2;3;4] = 3.
Proof. simpl. reflexivity. Qed.
Example sample15_test15: sample15_rm_until_last [1;2;3;4;5] = 5.
Proof. simpl. reflexivity. Qed.





(** The following lemma may cause Coq to crash, so it was replaced
by a simple 'Compute' call instead of a proper testcase:
<<
  Lemma sample2_15: (sample15_rm_until_last (rangeTo 2004)) = 1598.
  Proof. simpl. reflexivity. Qed.
>>
*)


Compute (sample15_rm_until_last (rangeTo 2004)).


(** * Lemmas 16-20 are Number Theory in Z *)

(** The remaining 5 proofs are about the integer divisibility.
See #<a href='http://linen-tracer-682.appspot.com/discrete-bin/coq-numbertheory/CSEnotes_numbertheory.html'>Integer Arithmetic #
#(Buffalo CSE191, p.110-137)</a>#
*)



Open Scope Z_scope. 

(** A warm-up example: Prove that (Zis_gcd 6 15 (-3)) is True. This means
that (-3) satisfies all properties of a GCD. It divides both 6 and 15, and
any other divisor of 6 and 15 is also a divisor of (-3). *)

(** In the scope of 'nat' (not Z), the GCD always equals 3, not (-3):
<<
  Compute (gcd 6%nat 15%nat).
>>
The above line should return #<tt>3%nat</tt>#, so it cannot be (-3). 
In the arithmetic of Z (all integers), there are two feasible values
of GCD. GCD(6,15) can be both '+3' and '-3'. 
*)

Example gcd_6_16_warmup: (Zis_gcd 6 15 (-3)).
Proof.
  apply Zis_gcd_intro.
  - unfold Z.divide. exists (-2). reflexivity.
  - unfold Z.divide. exists (-5). reflexivity.
  - { 
    intros x H1 H2.
    unfold Z.divide in H1. destruct H1 as [u H11].
    unfold Z.divide in H2. destruct H2 as [v H22].
    unfold Z.divide.
    exists (v - 3*u).
    rewrite Z.mul_sub_distr_r.
    rewrite <- H22. rewrite <- Z.mul_assoc. rewrite <- H11.
    reflexivity.
  }
Qed.



(** ** Do not modify this line: sample2_16 *)

(** See #<a href='https://che.gg/2umW71y'>Properties of GCD</a>.<br/>#
Note that Item (a) from that list is already solved as #<tt>Lemma div_a_perp_b</tt># in
#<a href='https://cse.buffalo.edu/~knepley/classes/cse191/ClassNotes.pdf'>(Knepley2019, p.135)</a>.<br/>#
#<b>Lemma:</b> If gcd(a,b)=1 and c divides a, then gcd(b,c)=1.#
*)



Open Scope Z_scope.

Lemma sample2_16_div_transitive: forall a b c: Z, (a | b) -> (b | c) -> (a | c).
Proof. 
  intros a b c.
  intros H1 H2.
  destruct H1 as [u H3].
  destruct H2 as [v H4].
  unfold Z.divide.
  exists (v*u).
  rewrite H4. rewrite H3.
  ring.
Qed.





Lemma sample2_16: forall a b c: Z, 
     (Zis_gcd a b 1) -> (c | a) -> (Zis_gcd b c 1).
Proof.
  intros a b c.
  intros H.
  destruct H as [_ _ H1].
  intros H2.
  apply Zis_gcd_intro.
  - pose (Z.divide_1_l b) as H3. exact H3. 
  - pose (Z.divide_1_l c) as H4. exact H4. 
  - {
    intros xx.
    intros H5 H6.
    pose (sample2_16_div_transitive xx c a) as H7.
    pose (H7 H6 H2) as H8.
    pose (H1 xx H8 H5) as H9. exact H9.
  }
Qed.



(** ** Do not modify this line: sample2_17 *)

(** #<b>Lemma:</b> If gcd(a,b)=1, then then gcd(ac,b)=gcd(c,b).# *)


Lemma mul_1_left: forall n: Z, 1 * n = n.
Proof.
 now destruct n.
Qed.


Lemma div_multiple_left: forall a b c:Z,  (a | b) -> (a | c * b).
Proof. 
  intros a b c. 
  intros H.
  unfold Z.divide in H.
  destruct H as [zz H1].
  unfold Z.divide. 
  exists (c*zz).
  rewrite H1.
  ring.
Qed.



Lemma sample2_17_helper: forall a b c xx: Z, 
  (Zis_gcd a b 1) -> (xx | a*c) -> (xx | b) -> (xx | c).
Proof. 
  intros a b c xx.
  intros HGCD L1 L2.
  unfold Z.divide.
  pose (rel_prime_bezout a b) as H1.
  pose (H1 HGCD) as H2.
  destruct H2 as [u v H3]. 
  pose (mul_1_left c) as H4.
  rewrite <- H3 in H4.
  destruct L1 as [zAC L11].
  destruct L2 as [zB L22].
  exists (u*zAC + v*zB*c).
  rewrite <- H4 at 1.
  pose (Z.mul_add_distr_r (u*a) (v*b) c) as H5.
  rewrite H5.
  pose (Z.mul_assoc u a c) as H6.
  rewrite <- H6.
  rewrite L11.
  rewrite L22.
  ring.
Qed.

Lemma sample2_17: forall a b c k: Z, 
  (Zis_gcd a b 1) -> ((Zis_gcd (a*c) b k) <-> (Zis_gcd c b k)).
Proof.
  intros a b c k.
  intros H.
  split.
  intros LEFT.
  destruct LEFT as [L1 L2 L3].
  apply Zis_gcd_intro.
  pose (sample2_17_helper a b c k) as H100.
  pose (H100 H L1 L2) as H101.
  exact H101.
  exact L2.
  
  intros xx.
  intros H11 H12.
  pose (L3 xx) as L33.
  pose (div_multiple_left xx c a) as H3.
  apply H3 in H11.
  pose (L33 H11 H12) as H4.
  exact H4.

  intros RIGHT.
  destruct RIGHT as [R1 R2 R3].
  apply Zis_gcd_intro.
  unfold Z.divide.
  destruct R1 as [m R11].
  exists (a*m).
  rewrite R11.
  ring.

  exact R2.

  intros xx.
  intros H21 H22.
  pose (sample2_17_helper a b c xx) as H23.
  pose (H23 H H21 H22) as H24.
  pose (R3 xx) as H25.
  pose (H25 H24 H22) as H26.
  exact H26.
Qed. 



(** ** Do not modify this line: sample2_18 *)

Lemma Z_minus_two_eq: forall a b c d,
  a = b -> c = d -> a-c = b-d.
Proof. 
  intros a b c d.
  intros H1 H2.
  rewrite H1.
  rewrite H2.
  reflexivity.
Qed.



Lemma sample2_18_helper: forall a b c: Z, 
  (Zis_gcd a b 1) -> (c | (a+b)) -> (Zis_gcd a c 1).
Proof. 
  intros a b c.
  intros H1 H2.
  destruct H1 as [_ _ GCD3].
  unfold Z.divide in H2.
  destruct H2 as [u H3].  
  
  apply Zis_gcd_intro.
  apply (Z.divide_1_l a).
  apply (Z.divide_1_l c).
  intros xx. 
  intros H4 H5.
  pose (GCD3 xx H4) as GCD4.

  destruct H4 as [v H6].
  destruct H5 as [w H7].
  assert (xx | b).
  exists (w*u - v).
  pose (Z_minus_two_eq (a+b) (u*c) (a) (v*xx)) as H8.
  pose (H8 H3 H6) as H9.
  rewrite H7 in H9.
  pose (Z.add_simpl_l a b) as H10.
  rewrite H10 in H9.
  rewrite H9.
  ring.
  pose (GCD4 H) as H10.
  exact H10.
Qed.


(** #<b>Lemma:</b> If gcd(a,b)=1 and c divides (a+b), then gcd(a,c)=gcd(b,c)=1.# *)
Lemma sample2_18: forall a b c: Z, 
  (Zis_gcd a b 1) -> (c | (a+b)) -> ((Zis_gcd a c 1) /\ (Zis_gcd b c 1)).
Proof.
  intros a b c.
  intros H1 H2.
  split.
  pose (sample2_18_helper a b c) as H3.
  pose (H3 H1 H2) as H4.
  exact H4.
  pose (sample2_18_helper b a c) as H5.
  pose (Z.add_comm a b) as H6.
  rewrite H6 in H2.
  pose (Zis_gcd_sym a b 1) as H7.
  pose (H7 H1) as H8. 
  pose (H5 H8 H2) as H9.
  exact H9.
Qed.



(** ** Do not modify this line: sample2_19 *)
(** #<b>Lemma:</b> If gcd(a,b)=1; d divides ac; d divides bc, then d divides c.# *)
Lemma sample2_19: forall a b c d: Z, 
  (Zis_gcd a b 1) -> (d | (a*c)) -> (d | (b*c)) -> (d | c).
Proof.
  intros a b c d.
  intros H1 H2 H3.
  pose (rel_prime_bezout a b) as H4.
  pose (H4 H1) as H5.
  destruct H5 as [x y H6].
  destruct H2 as [u H22].
  destruct H3 as [v H33].
  unfold Z.divide.
  exists (x*u + y*v).
  pose (Z.mul_add_distr_r (x*u) (y*v) d) as H7.
  rewrite H7.
  pose (mul_1_left c) as H8.
  rewrite <- H6 in H8.
  pose (Z.mul_assoc x u d) as H9. rewrite <- H9. rewrite <- H22.
  pose (Z.mul_assoc y v d) as H10. rewrite <- H10. rewrite <- H33.
  pose (Z.mul_assoc x a c) as H11. rewrite H11.
  pose (Z.mul_assoc y b c) as H12. rewrite H12.
  pose (Z.mul_add_distr_r (x*a) (y*b) c) as H13. rewrite <- H13.
  rewrite H6. ring.
Qed.



(** ** Do not modify this line: sample2_20 *)
(** #<b>Lemma:</b> If gcd(a,b)=1, then gcd(a^2,b^2)=1.# *)
Lemma sample2_20_help: forall a b: Z, 
  (Zis_gcd a b 1) -> (Zis_gcd (a*a) b 1).
Proof.
  intros a b.
  intros H.
  pose (sample2_17 a b a 1) as H1.
  destruct H1 as [_ H2].
  exact H.
  pose (H2 H) as H3.
  exact H3.
Qed.


Lemma sample2_20: forall a b: Z, 
  (Zis_gcd a b 1) -> (Zis_gcd (a^2) (b^2) 1).
Proof.
  intros a b.
  intros H.
  pose (sample2_20_help a b) as H2.
  pose (H2 H) as H3.
  pose (Zis_gcd_sym (a*a) b 1) as H4.
  pose (H4 H3) as H5.
  pose (sample2_20_help b (a*a)) as H6.
  pose (H6 H5) as H7.
  pose (Zis_gcd_sym (b*b) (a*a) 1) as H8.
  pose (H8 H7) as H9.
  simpl. unfold Z.pow_pos. simpl.
  pose (Z.mul_assoc a a 1) as H10. rewrite H10.
  pose (Z.mul_assoc b b 1) as H11. rewrite H11.
  pose (Z.mul_1_r (a*a)) as H12. rewrite H12.
  pose (Z.mul_1_r (b*b)) as H13. rewrite H13.
  exact H9.
Qed.



Close Scope Z_scope.


