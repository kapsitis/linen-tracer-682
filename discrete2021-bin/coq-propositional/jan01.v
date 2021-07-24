Require Import Classical_Prop.

(* Search on Twitter: *)
(* from:mathslogicbot since:2021-01-01 until:2021-01-02 *)
(* URL = https://bit.ly/35ZsvXx *) 
(* Tautology on January 1, 2021 is: ¬¬((a∨(b⇿a))∨b) *)
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



