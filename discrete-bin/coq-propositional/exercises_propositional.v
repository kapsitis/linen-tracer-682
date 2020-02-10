(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(**
#<h2>Exercises from the Textbook</h2># 

#<b>EXERCISE 1.3.2 SOLUTION</b>#
*)
Require Import Classical_Prop.

Example ex_1_3_2: forall p:Prop, ~(~p) <-> p.
Proof.
  split.
  unfold not. (*r 1nd part: ~~p -> p *)
  intros H.
  elim (classic p).
  intros PTrue; exact PTrue. 
  intro PFalse.

  pose (H PFalse) as CONTRA.
  contradiction CONTRA.
  intros H. (*r 2nd part: p -> ~~ p *)
  unfold not. 
  intros G.
  apply G.
  exact H.
Qed. 

(** #<b>Note 1:</b># 
This proof is not intuitionistic. 
It uses this axiom from Classical_Prop.v:
Axiom classic : forall (P : Prop), P \/ ~ P.
The 1st part of this proof repeats the proof of NNPP. 
(See #<a href="https://github.com/coq/coq/blob/master/theories/Logic/Classical_Prop.v">Classical_Prop.v</a>#.)
#<br/>#
The 2nd part of this proof unfolds "not" statements and proceeds as in 
#<a href="https://stackoverflow.com/questions/14644086/proving-p-q-q-p-using-coq-proof-assistant">This example</a>#.
#<br/>#
#<br/>#
#<b>Note 2:</b>#  Some parts of the proof are very condensed. For example:
#<br/>#
#<tt>elim (classic p).</tt>#
#<br/>#
can be rewritten as
#<tt>pose (classic p).</tt><br/>#
#<tt>elim o.</tt><br/>#
#<tt>clear o.</tt><br/>#
*)

(** #<h3>EXERCISE 1.3.4.A SOLUTION</h3># *)
Example ex_1_3_4_a: forall p q r:Prop, (p \/ q) \/ r <-> p \/ (q \/ r).
Proof. 
  split.
  intros pqrLeftOR. (*r 1nd part: (p \/ q) \/ r -> p \/ (q \/ r) *)
  destruct pqrLeftOR as [[pTrue | qTrue] | rTrue].
  left; exact pTrue.
  right; left; exact qTrue.
  right; right; exact rTrue.
  intros pqrRightOR. (*r 2nd part: p \/ (q \/ r) -> (p \/ q) \/ r *)
  destruct pqrRightOR as [pTrue | [qTrue | rTrue]].
  left; left; exact pTrue.
  left; right; exact qTrue.
  right; exact rTrue.
Qed.

(** #<b>Note 1:</b># 
The tactic "destruct" is a shorthand for other tactics. For example,
#<br/>#
#<tt>destruct pqrLeftOR as [[pTrue | qTrue] | rTrue].</tt>#
#<br/>#
can be rewritten as follows:
#<tt>elim pqrLeftOR.</tt><br/>#
#<tt>intros pqOR.</tt><br/>#
#<tt>elim pqOR.</tt><br/>#
#<tt>intros pTrue.</tt><br/>#
#<tt>...</tt><br/>#
#<tt>intros qTrue.</tt><br/>#
#<tt>...</tt><br/>#
#<tt>intros rTrue.</tt><br/>#
#<tt>...</tt>#
*)




(** #<h3>EXERCISE 1.3.4.B SOLUTION</h3># *)
Example ex_1_3_4_b: forall p q r:Prop, (p /\ q) /\ r <-> p /\ (q /\ r).
Proof. 
  split.
  intros [[H1 H2] H3]. (*r 1nd part: (p /\ q) /\ r -> p /\ (q /\ r) *)
  split.
  exact H1.
  split.
  exact H2.
  exact H3.
  intros [H1 [H2 H3]]. (*r 2nd part: p /\ (q /\ r) -> (p /\ q) /\ r *)
  split.
  split.
  exact H1.
  exact H2.
  exact H3.
Qed.

(** #<b>Note 1:</b>#  
Shorthands used here as well:
#<br/>#
#<tt>intros [[H1 H2] H3].</tt>#
#<br/>#
can be rewritten as follows:
#<br/>#
#<tt>intros pqrLeftAND.</tt><br/>#
#<tt>destruct pqrLeftAND as [[H1 H2] H3].</tt><br/>#
And "destruct" in turn can be written as a sequence of elim, intros, clear.
*)





(* EXERCISE 1.3.4.B SOLUTION *)
(*
Example ex_1_3_6: forall p q:Prop, ~(p /\ q) <-> ~p \/ ~q. 
Proof. 
  split.
  unfold not.
  intros pqNAND.
  destruct pqNAND.
*)
