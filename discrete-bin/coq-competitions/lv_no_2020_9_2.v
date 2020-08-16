(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * LV.NO.2020.9.2 *)

(** See #<a href='https://bit.ly/2VLBCH8'>LV Regional 
Olympiad Problems</a>#. *)

(** #<b>Problem:</b># Show that 1/(1*3) + 1/(3*5) + 1/(5*7) + ... + 
1/(2019*2021) = 1010/2021.

#<br/>#
This problem uses mathematical induction on natural numbers, 
but the sequence uses rational numbers. Therefore, the problem 
has to deal with many technical lemmas that translate between 
several sets: #<br/># 
#<tt>nat</tt># - natural numbers (non-negative integers), #<br/>#
#<tt>Z</tt># - all integers, #<br/>#
#<tt>positive</tt># - all positive integers#<br/>#
#<tt>Q</tt># - rational numbers (in Coq they are pairs where
a numerator from #<tt>Z</tt># is divided by a denominator 
from #<tt>positive</tt>#). #<br/>#

In Coq the set Q is, in fact, setoid (a collection of equivalence 
classes between different notations of rational numbers). 
In this world 1/2 is not quite the same as 2/4; their 
equivalence is denoted by two equals signs #<tt>==</tt># rather
than a single equals sign.#<br/>#

It may happen that there is a more shorter proof, if we
embed our sequence in the field of real numbers, because
the results in the set of reals might be easier. But this 
has not been tried yet.
*)


Require Import Field.
Require Import QArith.
Require Import Qcanon.
Require Import Znumtheory.
Require Import Eqdep_dec.

Require Setoid.


Require Import ZArith.
Require Import Znumtheory.
Require Import BinInt.
Require Import Arith Psatz.
Require Import Gt.
Require Import Znat.



Open Scope Q_scope.



Fixpoint SeqA (k:nat):Q :=
  match k with 
  | 0%nat => 0
  | S k' => (SeqA k') + 
    (1#((Pos.of_nat (2*k-1))*(Pos.of_nat (2*k+1))))
  end.


(** ** Some Inequalities of Rational Numbers *)

(** 0 < 1 (as rational numbers) *)
Lemma Q_lt_0_1: 0 < 1. 
Proof. 
  unfold Qlt. simpl.
  apply Z.lt_0_1.
Qed.

(** 0 < 2 (as rational numbers) *)
Lemma Q_lt_0_2: 0 < 2. 
Proof. 
  unfold Qlt. simpl.
  apply Z.lt_0_2.
Qed.

(** 0 < 3 (as rational numbers) *)
Lemma Q_lt_0_3: 0 < 3. 
Proof. 
  unfold Qlt. simpl.
  lia.
Qed.



(** ** Basic Properties of Rationals *)

(** Unless it is 0, any natural number converted to integer is positive *)
Lemma helperNatsArePositive: forall n, n <> 0%nat -> (Z.of_nat n > 0)%Z.
Proof.
  intros n.
  intros H1.
  pose (inj_gt n 0) as H2.
  pose (gt_0_eq n) as H3.
  unfold not in H1.
  destruct H3.
  pose (H2 H) as H4.
  assert (Z.of_nat 0 = 0)%Z as H5.
  simpl. reflexivity.
  rewrite H5 in H4.
  exact H4.
  rewrite H in H1.
  assert (n = n). reflexivity.
  contradiction (H1 H0).
Qed.

(** Natural number n, when transformed to a rational n/1, is non-negative *)
Lemma nat_to_Qnonneg: forall (n:nat), 0 <= (inject_Z (Z.of_nat n)).
Proof. 
  intros n.
  unfold Qle.
  simpl.
  rewrite (Z.mul_1_r (Z.of_nat n)).
  apply (Zle_0_nat n).
Qed.


(** (a + b)/p = (a/p) + (b/p) *)
Lemma add_numerators: forall (a:Z) (b:Z) (p:positive),
  (a + b) # p == (a#p) + (b#p).
Proof. 
  intros a b p.
  unfold Qplus.
  simpl.
  unfold Qeq.
  simpl.
  pose (Pos2Z.inj_mul p p) as H1.
  rewrite H1.
  rewrite (Z.mul_assoc (a + b) (Z.pos p) (Z.pos p) ).
  rewrite (Z.mul_add_distr_r  a  b (Z.pos p)).
  reflexivity.
Qed.


(** If k*a = b, then a = (1/k)*b *) 
Lemma invert_z_pos: forall (a b:Q) (k:Z), 
  (0 < k)%Z -> (inject_Z k)*a == b -> a == (1#Z.to_pos k)*b.
Proof.
  intros a b k.
  intros H1.
  intros H2.
  rewrite <- H2.
  rewrite (Qmult_assoc (1 # Z.to_pos k)  (inject_Z k) a).
  assert ((1 # Z.to_pos k) * inject_Z k == 1) as H0.
  unfold Qeq.
  simpl.
  induction k.
  pose (Z.lt_irrefl 0) as H3.
  contradiction (H3 H1).
  simpl.
  reflexivity.
  pose (Pos2Z.neg_is_neg p) as H4.
  pose (Z.lt_trans 0 (Z.neg p) 0 H1 H4) as H5.
  pose (Z.lt_irrefl 0) as H3.
  contradiction (H3 H5).
  rewrite H0.
  field.
Qed.




(** ** Type Conversions Between Positive Integers *)

(** If n is a non-zero natural number, then you can cast it to 
'positive' type, then back to 'nat' type, and you will get the original number *)
Lemma helperNatPNat: forall n, n <> 0%nat -> Pos.to_nat (Pos.of_nat n) = n.
Proof. 
  intros n. 
  intros H1.
  apply (Nat2Pos.id n H1).
Qed.


Lemma helperPNatZ: forall p:positive, Z.of_nat (Pos.to_nat p) = Z.pos p.
Proof.
  intros p.
  destruct (Pos2Nat.is_succ p) as (n,H).
  rewrite H. simpl. f_equal. now apply SuccNat2Pos.inv.
Qed.


Lemma helperPZP: forall p:positive, (Z.to_pos (Z.pos p)) = p.
Proof.
  intros p.
  apply (Pos2Z.id p).
Qed.


Lemma helperZPZ: forall z:Z, (z>0)%Z -> (Z.pos (Z.to_pos z)) = z.
Proof.
  intros z. 
  intros H1.
  pose (Pos2Z.id (Z.to_pos z)) as H2.
  pose (Z2Pos.inj (Z.pos (Z.to_pos z)) z) as H4.
  pose (Zgt_pos_0 (Z.to_pos z)) as H5.
  pose (Z.gt_lt (Z.pos (Z.to_pos z)) 0 H5) as H6.
  pose (Z.gt_lt z 0 H1) as H7.

  pose (H4 H6 H7) as H8.
  pose (helperPZP (Z.to_pos z)) as H9.
  exact (H8 H9).
Qed.


Lemma helperNatZP: forall n:nat, n<>0%nat -> Z.to_pos (Z.of_nat n) = Pos.of_nat n.
Proof.
  intros n.
  intros H1.
  pose (helperNatsArePositive n H1) as H2.
  pose (helperPNatZ (Pos.of_nat n)) as H3.
  pose (helperNatPNat n H1) as H4.
  rewrite H4 in H3.
  assert (Z.to_pos (Z.of_nat n) = Z.to_pos (Z.of_nat n)) as H5.
  reflexivity.
  rewrite H3 in H5 at 2.
  pose (helperPZP (Pos.of_nat n)) as H6.
  rewrite H6 in H5.
  exact H5.
Qed.


Lemma helperNatPZ: forall n:nat, n<>0%nat -> (Z.pos (Pos.of_nat n)) = Z.of_nat n.
Proof.
  intros n.
  intros H1.
  pose (helperPZP (Pos.of_nat n)) as H2.
  pose (helperNatZP n H1) as H3.
  rewrite <- H3 in H2.
  assert (Z.to_pos (Z.of_nat n) = Pos.of_nat n) as H4.
  rewrite H3.
  reflexivity.
  assert (Z.pos (Pos.of_nat n) = Z.pos (Pos.of_nat n)) as H5.
  reflexivity.
  rewrite  <- H4 in H5.
  pose (helperZPZ (Z.of_nat n)) as H6.
  pose (helperNatsArePositive n H1) as H7.
  pose (H6 H7) as H8.
  rewrite <- H8.
  pose (helperNatZP n H1) as H9.
  rewrite H9. 
  reflexivity.
Qed.





(** ** Inequalities of Linear Expressions *)

(** We have ak + b > 0, if a,k are non-negative, but b is positive. *)
Lemma helper1: forall k a b:Q, 0 <= k -> 0 <= a -> 0 < b -> a*k + b > 0.
Proof.
  intros k a b.
  intros H1 H2 H3.
  pose (Qmult_le_0_compat a k H2 H1) as H4.
  pose (Qplus_lt_le_compat 0 b (a*k) (a*k))  as H8.
  apply H8 in H3 as H9.
  rewrite (Qplus_0_l (a*k)) in H9.
  rewrite (Qplus_comm b (a*k)) in H9.
  pose (Qle_lt_trans 0 (a*k) (a*k + b)) as H10.
  apply H10 in H4.
  exact H4.
  exact H9.
  apply (Qle_refl (a*k)).
Qed.

(** ak+b is not zero, if a,k are non-negative, bt b is positive. *)
Lemma helper2: forall k a b:Q, 0 <= k -> 0 <= a -> 0 < b -> ~ a * k + b == 0.
Proof.
  intros k a b.
  intros H1 H2 H3.
  pose (helper1 k a b H1 H2 H3) as H4.
  pose (Qlt_not_eq 0 (a * k + b) H4) as H5.
  unfold not. intros H6.
  rewrite H6 in H5.  
  unfold not in H5. 
  apply H5.
  reflexivity.
Qed.


Lemma helper3: forall k a b:nat, (0 < b -> a*k + b > 0)%nat.
Proof.
  intros k a b.
  intros H1.
  pose (Nat.lt_lt_add_r 0 b (a*k) H1) as H2.
  rewrite (plus_comm b (a*k)) in H2.
  apply (not_le (a*k + b) 0).
  unfold not. intros H3.
  pose (lt_le_trans 0 (a * k + b) 0 H2 H3) as H4. 
  pose (Nat.lt_irrefl 0) as H5.
  contradiction (H5 H4).
Qed.




(** ** Problem-specific algebra statements *)

(** For every non-negative k, we have the algebraic identity: #<br/>#
2*(1/((2*k+1)*(2*k+3))) == 1/(2*k+1) - 1/(2*k+3) *)
Lemma helper4: forall k:Q, 0 <= k -> 2*(1/((2*k+1)*(2*k+3))) == 1/(2*k+1) - 1/(2*k+3).
Proof.
  intros k.
  intros H1.
  field.
  pose Q_lt_0_1 as H2.
  pose (Qlt_le_weak 0 2 Q_lt_0_2) as H3.
  pose Q_lt_0_3 as H4.
  split.
  apply (helper2 k 2 3 H1 H3 H4).
  apply (helper2 k 2 1 H1 H3 H2).
Qed.


(** For all natural numbers a,b:  a/1 + b/1 = (a+b)/1. *)
Lemma qOfNat_inj_add: forall (a b:nat),
  ((inject_Z (Z.of_nat a))  + (inject_Z (Z.of_nat b)) == 
  (inject_Z (Z.of_nat (a+b))) ).
Proof. 
  intros a b.
  assert ((inject_Z (Z.of_nat a)) == ((Z.of_nat a))#1) as H1.
  unfold inject_Z. reflexivity.
  assert ((inject_Z (Z.of_nat b)) == ((Z.of_nat b))#1) as H2.
  unfold inject_Z. reflexivity.
  assert (inject_Z (Z.of_nat (a + b)) == ((Z.of_nat (a+b)#1))) as H3.
  unfold inject_Z. reflexivity.
  rewrite H1. 
  rewrite H2.
  rewrite H3.
  pose (add_numerators (Z.of_nat a) (Z.of_nat b) 1) as H4.
  rewrite <- H4.
  destruct (inject_Z_injective (Z.of_nat a + Z.of_nat b) ( Z.of_nat (a + b))) as [_ H5].
  apply H5.
  pose (Nat2Z.inj_add a b) as H6.
  rewrite H6.
  reflexivity.
Qed.

(** For all natural numbers a,b:  (a/1)* (b/1) = (a*b)/1. *)
Lemma qOfNat_inj_mul: forall (a b:nat),
  ((inject_Z (Z.of_nat a))  * (inject_Z (Z.of_nat b)) == 
  (inject_Z (Z.of_nat (a*b))) ).
Proof. 
  intros a b.
  assert ((inject_Z (Z.of_nat a)) == ((Z.of_nat a))#1) as H1.
  unfold inject_Z. reflexivity.
  assert ((inject_Z (Z.of_nat b)) == ((Z.of_nat b))#1) as H2.
  unfold inject_Z. reflexivity.
  assert (inject_Z (Z.of_nat (a * b)) == ((Z.of_nat (a*b)#1))) as H3.
  unfold inject_Z. reflexivity.
  rewrite H1. 
  rewrite H2.
  rewrite H3.
  unfold Qmult.
  unfold Qnum.
  unfold Qden.
  simpl.
  destruct (inject_Z_injective (Z.of_nat a * Z.of_nat b) ( Z.of_nat (a * b))) as [_ H4].
  apply H4.
  pose (Nat2Z.inj_mul a b) as H5.
  rewrite H5.
  reflexivity.
Qed.


(** For all natural numbers a,b,n: converting (a*n+b) to a rational number
is equal to ((a/1)*(n/1) + (b/1)). *)
Lemma helper5: forall (n a b:nat),
  ((inject_Z (Z.of_nat a))  * (inject_Z (Z.of_nat n))  + (inject_Z (Z.of_nat b)) == 
  (inject_Z (Z.of_nat (a*n+b))) ).
Proof.
  intros n a b.
  assert ((inject_Z (Z.of_nat a))  * (inject_Z (Z.of_nat n)) == (inject_Z (Z.of_nat (a*n)))).
  apply (qOfNat_inj_mul a n).
  rewrite H.
  apply (qOfNat_inj_add (a*n) b).
Qed.



Lemma helper6: forall (n a b:nat) (k:Q), 
   (k == (inject_Z (Z.of_nat n))) -> (b>0)%nat ->
   (Z.pos (Pos.of_nat (a * n + b)) # 1) == (inject_Z (Z.of_nat a)) * k + (inject_Z (Z.of_nat b)). 
Proof.
  intros n a b k. 
  intros H1 H2.
  rewrite H1.
  pose (helper5 n a b) as H3.
  rewrite H3.
  pose (helperNatPZ (a * n + b)) as H4.
  pose (helper3 n a b H2) as H5.
  assert ((a * n + b)%nat <> 0%nat) as H6.
  unfold not. intros H7.
  rewrite H7 in H5.
  pose (gt_irrefl 0) as H8.
  contradiction (H8 H5).
  pose (H4 H6) as H9.
  rewrite H9.
  unfold inject_Z.
  reflexivity.
Qed.

Lemma helper7: forall (n:nat) (k:Q), 
  (k == (Z.of_nat n) #1) -> 1 /(2*k +1) == (1 # Pos.of_nat (2 * n + 1)).
Proof.
  intros n k. 
  intros H1.
  pose (Qmake_Qdiv 1 (Pos.of_nat (2 * n + 1))) as H2.
  unfold inject_Z in H2.
  pose (helper6 n 2 1 k H1) as H3.
  assert (1 > 0)%nat as H4. lia.
  pose (H3 H4) as H5.
  rewrite H5 in H2.
  rewrite H2.
  reflexivity.
Qed.


Lemma helper8: forall (n:nat) (k:Q), 
  (k == (Z.of_nat n) #1) -> 1 /(2*k +3) == (1 # Pos.of_nat (2 * n + 3)).
Proof.
  intros n k. 
  intros H1.
  pose (Qmake_Qdiv 1 (Pos.of_nat (2 * n + 3))) as H2.
  unfold inject_Z in H2.
  pose (helper6 n 2 3 k H1) as H3.
  assert (3 > 0)%nat as H4. lia.
  pose (H3 H4) as H5.
  rewrite H5 in H2.
  rewrite H2.
  reflexivity.
Qed.


Lemma helper9: forall (n:nat) (k:Q), (k == inject_Z (Z.of_nat n)) ->
  1/((2*k+1)*(2*k+3)) == (1 # Pos.of_nat (2 * n + 1) * Pos.of_nat (2 * n + 3)).
Proof.
  intros n k.
  intros H1.
  pose (helper7 n k H1) as H2.
  pose (helper8 n k H1) as H3. 
  assert ( (1 / (2 * k + 1)) * (1 / (2 * k + 3)) == 1 / ((2 * k + 1) * (2 * k + 3))) as H4.
  field.
  pose (nat_to_Qnonneg n) as H5.
  rewrite <- H1 in H5.
  pose (Qlt_le_weak 0 2 Q_lt_0_2) as H6.
  pose Q_lt_0_3 as H7.
  pose Q_lt_0_1 as H8.
  split.
  apply (helper2 k 2 3 H5 H6 H7).
  apply (helper2 k 2 1 H5 H6 H8).
  rewrite <- H4.
  rewrite H2.
  rewrite H3.
  unfold Qeq.
  simpl. reflexivity.
Qed.


(** ** Two Statements that Complete the Regional Olympiad Problem *)


(** General statement about the telescopic sums: If we double the
values of our sequence, we get (1 - 1/(2*n+1)). *)
Theorem lv_no_2020_9_2_gen: forall n:nat, 2*(SeqA n) == 1 - (1#(Pos.of_nat (2*n+1))).
Proof. 
  intros n.
  induction n.
  simpl.
  reflexivity.
  assert (SeqA (S n) == ((SeqA n) + 
    (1#((Pos.of_nat (2*(S n)-1))*(Pos.of_nat (2*(S n)+1)))))) as H1.
  simpl. reflexivity.
  assert (2* SeqA (S n) == 2 * SeqA (S n)) as H2.
  reflexivity.
  rewrite H1 in H2 at 2.
  rewrite H2.
  pose (Qmult_plus_distr_r 2 (SeqA n) (1 # Pos.of_nat (2 * S n - 1) * Pos.of_nat (2 * S n + 1))) as H3.
  rewrite H3.
  rewrite IHn.
  assert (2 * S n - 1 = 2*n + 1)%nat as H4.
  lia.
  rewrite H4.
  assert (2 * S n + 1 = 2*n + 3)%nat as H5.
  lia.
  rewrite H5.
  assert (Z.of_nat n # 1 == Z.of_nat n # 1) as H6. reflexivity.
  pose (helper7 n (inject_Z (Z.of_nat n)) H6) as H7.
  rewrite <- H7.
  pose (helper8 n (inject_Z (Z.of_nat n)) H6) as H8.
  rewrite <- H8.
  pose (helper9 n (inject_Z (Z.of_nat n)) H6) as H9.
  rewrite <- H9.
  pose (nat_to_Qnonneg n) as H10.
  pose (helper4  (inject_Z (Z.of_nat n)) H10) as H11.
  rewrite H11.
  ring.
Qed.

(** Evaluation for one specific case: The 1010th member of the series - 
the one ending with 1/(2019*2021) equals to 1010/2021. #<br/>#
#<b>Note:</b># We could have computed this one sum directly in Coq, but 
then we cannot claim the result for the general case. 
Any real olympiad solution should not use 'brute force' with thousands 
of arithmetic operations; so computing one sum does is not enough; 
we want to derive the result from the general expression. *)
Theorem lv_no_2020_9_2: SeqA 1010 == 1010#2021.
Proof. 
  pose (lv_no_2020_9_2_gen 1010) as H1.
  pose (invert_z_pos (SeqA 1010) (1 - (1 # Pos.of_nat (2*1010 + 1))) 2) as H2.
  apply H2 in H1.
  rewrite H1.
  assert (1 - (1 # (Pos.of_nat (2 * 1010 + 1))) == 2020 # 2021) as H3.
  simpl.
  reflexivity.
  rewrite H3. simpl.
  field.
  apply (Z.lt_0_2).
Qed.


Close Scope Q_scope.

