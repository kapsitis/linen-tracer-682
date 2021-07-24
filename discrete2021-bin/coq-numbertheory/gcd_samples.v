(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)


Require Import ZArith.
Require Import Znumtheory.
Require Import Arith Psatz.


(** A warm-up example: Prove that (Zis_gcd 6 15 (-3)) is True. This means
that (-3) satisfies all properties of a GCD. It divides both 6 and 15, and
any other divisor of 6 and 15 is also a divisor of (-3). *)
Example gcd_6_16_warmup: (Zis_gcd 6 15 (-3)).
Proof.
  apply Zis_gcd_intro.
  unfold Z.divide. exists (-2). reflexivity.
  unfold Z.divide. exists (-5). reflexivity.
  intros x H1 H2.
  destruct H1 as [u H1].
  destruct H2 as [v H2].
  unfold Z.divide.
  exists (v - 3*u).
  rewrite Z.mul_sub_distr_r.
  rewrite <- H2. 
  rewrite <- Z.mul_assoc. 
  rewrite <- H1.
  reflexivity.
Qed.


(** ** sample2_16 *)
(** #<b>Lemma:</b> If <tt>a,b</tt> are mutual primes, 
  and <tt>(c|a)</tt>, then also <tt>b,c</tt> are mutual primes, 
  i.e. <tt>gcd(b,c)=1</tt># *)


Lemma sample2_16: forall a b c: Z, 
     (Zis_gcd a b 1) -> (c | a) -> (Zis_gcd b c 1).
Proof.
  intros a b c.
  intros H.
  destruct H as [_ _ H1].
  intros H2.
  apply Zis_gcd_intro.
  pose (Z.divide_1_l b) as H3. exact H3. 
  pose (Z.divide_1_l c) as H4. exact H4. 
  intros x.
  intros H5 H6.
  pose (Z.divide_trans x c a) as H7.
  pose (H7 H6 H2) as H8.
  pose (H1 x H8 H5) as H9. exact H9.
Qed.


Search ((_ | _) -> (_ | _ *_)).

(*
Print Z.divide_mul_r.
forall n m p : Z, (n | p) -> (n | m * p)
*)


(** ** sample2_17 *)
(** #<b>Lemma:</b> If gcd(a,b)=1, then then gcd(ac,b)=gcd(c,b).# *)

Lemma sample2_17_helper: forall a b c x: Z, 
  (Zis_gcd a b 1) -> (x | a*c) -> (x | b) -> (x | c).
Proof. 
  intros a b c x.
  intros MutualPrimes L1 L2.
  unfold Z.divide.
  pose (rel_prime_bezout a b) as H1.
  pose (H1 MutualPrimes) as H2.
  destruct H2 as [u v H3]. 
  pose (Z.mul_1_l c) as H4.
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


Search Zis_gcd.


Lemma sample2_17: forall a b c k: Z, 
  (Zis_gcd a b 1) -> ((Zis_gcd (a*c) b k) <-> (Zis_gcd c b k)).
Proof.
  intros a b c k.
  intros H.
  split.
  intros [H1 H2 H3].
  apply Zis_gcd_intro.
  pose (sample2_17_helper a b c k) as H4.
  pose (H4 H H1 H2) as H5.
  exact H5.
  exact H2.  
  intros x.
  intros H6 H7.
  pose (H3 x) as H8.
  pose (Z.divide_mul_r x a c) as H9.
  apply H9 in H6.
  pose (H8 H6 H7) as H10.
  exact H10.

  intros [H1 H2 H3].
  apply Zis_gcd_intro.
  unfold Z.divide.
  destruct H1 as [m H1].
  exists (a*m).
  rewrite H1.
  ring.
  exact H2.
  intros x.
  intros H21 H22.
  pose (sample2_17_helper a b c x) as H23.
  pose (H23 H H21 H22) as H24.
  pose (H3 x) as H25.
  pose (H25 H24 H22) as H26.
  exact H26.
Qed. 


(** ** sample2_18 *)
(** #<b>Lemma:</b> If <tt>a,b</tt> are mutual primes and <tt>c</tt> divides <tt>(a+b)</tt>, then <tt>a,c</tt> are mutual primes.# *)
Lemma sample2_18_helper: forall a b c: Z, 
  (Zis_gcd a b 1) -> (c | (a+b)) -> (Zis_gcd a c 1).
Proof. 
  intros a b c H1 H2.
  destruct H1 as [_ _ H1].
  unfold Z.divide in H2.
  destruct H2 as [u H2].  
  apply Zis_gcd_intro.
  apply (Z.divide_1_l a).
  apply (Z.divide_1_l c).
  intros x. 
  intros H3 H4.
  pose (H1 x H3) as H5.
  destruct H3 as [v H3].
  destruct H4 as [w H4].
  apply H5.
  exists (w*u - v).
  rewrite Z.mul_sub_distr_r.
  rewrite <- H3.
  lia.
Qed.


(** #<b>Lemma:</b> If <tt>gcd(a,b)=1</tt> and <tt>c</tt> divides <tt>(a+b)</tt>, then gcd(a,c)=gcd(b,c)=1.# *)
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



(** ** sample2_19 *)
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
  pose (Z.mul_1_l c) as H8.
  rewrite <- H6 in H8.
  pose (Z.mul_assoc x u d) as H9. rewrite <- H9. rewrite <- H22.
  pose (Z.mul_assoc y v d) as H10. rewrite <- H10. rewrite <- H33.
  pose (Z.mul_assoc x a c) as H11. rewrite H11.
  pose (Z.mul_assoc y b c) as H12. rewrite H12.
  pose (Z.mul_add_distr_r (x*a) (y*b) c) as H13. rewrite <- H13.
  rewrite H6. ring.
Qed.



(** ** sample2_20 *)
Lemma sample2_20_helper: forall a b: Z, 
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



(** #<b>Lemma:</b> If gcd(a,b)=1, then gcd(a^2,b^2)=1.# *)
Lemma sample2_20: forall a b: Z, 
  (Zis_gcd a b 1) -> (Zis_gcd (a^2) (b^2) 1).
Proof.
  intros a b.
  intros H.
  pose (sample2_20_helper a b) as H2.
  pose (H2 H) as H3.
  pose (Zis_gcd_sym (a*a) b 1) as H4.
  pose (H4 H3) as H5.
  pose (sample2_20_helper b (a*a)) as H6.
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
