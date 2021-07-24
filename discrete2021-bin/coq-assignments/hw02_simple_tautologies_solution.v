(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)



Require Import Classical_Prop.

(** Search on Twitter: 
#<br/><tt>from:mathslogicbot since:2020-12-01 until:2021-01-02</tt><br/># 
Also Check this URL: #<a href='https://bit.ly/35ZsvXx'>https://bit.ly/35ZsvXx</a>#
Students did one tautology each depending on their student ID. *)


(** ** The solution of Warmup Exercise *)

Lemma DubNeg: forall b: Prop, b -> ~~b.
Proof.
 intros b.
 intros H.
 unfold not.
 intros H1.
 apply H1.
 exact H.
Qed.
 
 
(** ** The solution of H2.Q5 *) 

Lemma Dec01: forall a: Prop, ~~(((a/\a)/\a)<->a).
Proof.
 intros a.
 assert(((a/\a)/\a)<->a) as H0.
 unfold iff.
 split.
 intros H.
 destruct H as [H1 H2].
 exact H2.
 intros H3.
 split.
 split.
 exact H3.
 exact H3.
 exact H3.
 apply DubNeg.
 exact H0.
Qed.
 
 



Lemma Dec03: forall a b: Prop, ~~(((a/\b)/\b)-> b).
Proof.
  intros a b.
  unfold not.
  intros H.
  assert((a /\ b) /\ b -> b).
  intros H1.
  destruct H1 as [H2 H3].
  exact H3.
  apply H.
  exact H0.
Qed.



Lemma Dec04: forall a b c: Prop, ~ ~ (((a/\b)/\c) -> c).
Proof.
  intros a b c.
  intros H1.
  destruct H1.
  intros H2.
  apply NNPP.
  intros cFalse.
  apply cFalse.
  apply H2.
Qed. 


Lemma Dec07: forall a b: Prop,  ~~(((a\/b)/\a)->a).
Proof.
  intros a.
  intros b.
  unfold not.
  intros H.
  assert ((a \/ b) /\ a -> a).
  intros H1.
  destruct H1.
  apply H1.
  apply H.
  destruct H.
  intros H1.
  destruct H1.
  apply H1.
Qed.

Lemma Dec16: forall a b: Prop, ~~((a/\~~~~b)->a).
Proof.
 intros a.
 intros b.
 apply DubNeg.
 intros H.
 destruct H as [H1 H2].
 exact H1.
Qed. 


Lemma Dec17: forall a b: Prop, ~~((a/\(a/\b))->b).
Proof.
  intros a b.
  unfold not.
  intros H.
  assert (a /\ a /\ b -> b).
  intros H1.
  destruct H1 as [H2 H3].
  destruct H3 as [H4 H5].
  exact H5.
  apply H.
  apply H0.
Qed.
 
Lemma Dec18: forall a b: Prop, ~~((a /\( a <-> b))->b).
Proof.
  intros a b.
  unfold not.
  intros H1.
  apply H1.
  intros H2.
  destruct H2 as [H3 H4].
  apply H4.
  exact H3.
Qed.


Lemma Dec19: forall a : Prop, ~~((a/\(a->a))->a).
Proof.
  intros a.
  unfold not.
  intros H.
  apply H.
  intros H1.
  destruct H1 as [H2 H3].
  exact H2.
Qed. 



Lemma Dec20: forall a b: Prop, ~~((a/\(b\/a))<->a).
Proof.
  intros a b.
  unfold not.
  intros H0.
  assert (a /\ (b \/ a) <-> a) as H1.
  unfold iff.
  split.
  intros H.
  destruct H as [H1 H2].
  exact H1.
  split.
  exact H.
  right.
  exact H.
  apply H0.
  exact H1.
Qed.
 


Lemma Dec21: forall a b: Prop, ~~((a/\(b<->a))->a).
Proof.
  intros a b.
  unfold not.
  intros H2.
  contradiction H2.
  intros h.
  destruct h as [h1 h2].
  exact h1.
Qed. 


Lemma Dec22: forall a b: Prop, ~~((a/\a)\/(b->b)).
Proof.
  intros a b.
  unfold not.
  intros H0.
  apply H0.
  right.
  intros H1.
  exact H1.
Qed.
 
 
Lemma Dec24: forall a b: Prop, ~~((a/\b)\/(a<->a)).
Proof.
  intros a b.
  unfold not.
  intros H.
  apply H.
  right.
  split.
  intros H1.
  apply H1.
  intros H2.
  apply H2.
Qed.
  


(** ** Other Tautologies from mathslogicbot *)

Lemma okook: forall a: Prop, ~~((a /\ ~~~~a) ->a).
Proof. 
  intros a.
  unfold not.
  intros H.
  apply H.
  intros H1.
  destruct H1 as [H2 H3].
  exact H2.
Qed. 


Lemma uzdevums: forall a b c: Prop, ~~((a/\(b/\c))->a).
Proof. 
  intros a b c.
  unfold not.
  intros H.
  apply H.
  intros H1.
  destruct H1 as [H2 H3].
  exact H2.
Qed. 

Lemma hw2: forall a b: Prop, ~~(((a\/a)/\b)-> b).
Proof.
  intros a b.
  unfold not.
  intros H.
  assert ((a \/ a) /\ b -> b).
  intros H1.
  destruct H1 as [H2 H3].
  exact H3.
  apply H.
  exact H0.
Qed.


Lemma task5: forall a b c: Prop, ~~(((a <-> b) /\ c) -> c).
Proof.
  intros a b c.
  unfold not.
  intros H.
  assert ((a <-> b) /\ c -> c).
  intros H1.
  destruct H1 as [H2 H3].
  exact H3.
  apply H.
  exact H0.
Qed.


Lemma smth: (forall a : Prop,~~(((a -> a) -> a) -> a)).
Proof.
  intros a.
  unfold not.
  intros H1.
  apply H1.
  intros H2.
  apply H2.
  intros H3.
  apply H3.
Qed.


Lemma ex5: forall a: Prop, ~~((a /\ a) <-> (a \/ a)).
Proof.
  intros a.
  unfold not.
  intros H1.
  apply H1.
  unfold iff.
  split.
  intros H2.
  right.
  destruct H2 as [H4 H5].
  apply H4.
  intros H6.
  split.
  destruct H6 as [H7 | H8].
  exact H7.
  exact H8.
  destruct H6 as [H9 | H10].
  exact H9.
  exact H10.
Qed. 


Lemma twitterBot: forall a b : Prop, ~~(((a<->a)/\b)->b).
Proof.
  intros a b.
  unfold not.
  intros H.
  apply H.
  intros H1.
  destruct H1 as [H2 H3].
  exact H3.
Qed.
 
Lemma abc: forall a b: Prop, ~~((a/\b)->(a/\a)).
Proof.
  intros a b.
  unfold not.
  intros H.
  assert (a /\ b -> a /\ a).
  intros H1.
  destruct H1 as [H2 H3].
  split.
  exact H2.
  exact H2.
  apply H.
  apply H0.
Qed.



(** ** Additional Results Proven in Class *)

Lemma Dec50: forall a: Prop, ~~(((a/\a)/\a)<->a).
Proof.
 intros a.
 assert(((a/\a)/\a)<->a) as H0.
 unfold iff.
 split.
 intros H.
 destruct H as [H1 H2].
 exact H2.
 intros H3.
 split.
 split.
 exact H3.
 exact H3.
 exact H3.
 pose (DubNeg ((a /\ a) /\ a <-> a)) as H4.
 pose (H4 (H0)) as H5.
 exact H5.
Qed.




(** Tautology for January 1. 
See #<a href='https://twitter.com/mathslogicbot/status/1344795486616743936'>2021-01-01 Tweet</a>#
*)
Lemma Jan1: forall a b: Prop, ~~((a \/ (b <-> a)) \/ b).
Proof. 
  intros a b.
  assert ((a \/ (b <-> a)) \/ b) as H.
  pose (classic b) as H2.
  destruct H2 as [bTrue | bFalse].
  right.
  exact bTrue.
  left.
  pose (classic a) as H3.
  destruct H3 as [aTrue | aFalse].
  left. 
  exact aTrue.
  right. 
  split.
  intros bTrue.
  contradiction (bFalse bTrue).
  intros aTrue.
  contradiction (aFalse aTrue).
  unfold not.
  intros H4.
  contradiction (H4 H).
Qed.



 