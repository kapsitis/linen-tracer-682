(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * Lab01: Proving Propositional Statements in Coq *)

(** In all the exercises replace #<b>Admitted.</b># 
with a proof. Enclose it between #<b>Proof.</b># and #<b>Qed.</b># 
#<b>Note:</b> If you can prove them without assuming extra axioms 
(such as "classic") such proofs would preferable, but
you can import and use any statements you need.
Coq axioms that can be imported are here:
#<a href='https://github.com/coq/coq/tree/master/theories/Logic'>Coq Logic</a>#.
*)

(** ** Guidelines for submission *)
(** #<ul><li>Download this Coq source file#
#<a href='lab01_tasks.v'>lab01_tasks.v</a>#
#from the GitHub repository.</li>#
#<li>Replace <tt>'tauto'</tt> or 
#<tt>'intuition'</tt># tactic or #'Admitted'# with a
#meaningful proof.</li>#
#<li>Ensure that the single-line separating #
comments "Do not modify this line ..." are preserved.</li>#
#<li>If you cannot solve some example, leave it unchanged,#
#but do not change the numeration.</li>#
#<li>In case you need any <tt>'Require Import'</tt> command,#
#write it right above the lemma where you need it.</li>#
#<li>When you are done, upload the resulting#
#<tt>lab01_tasks.v</tt> file to ORTUS.</li>#
#<li>If for some sample the Lemma is not a tautology#
#</ul>#
*)

(** ** Do not modify this line: sample1_1 *)

Lemma sample1_1: forall a b: Prop, ~a -> (a -> b).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_2 *)

Lemma sample1_2: forall a b: Prop, a -> (~b -> ~(a -> b)).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_3 *)


Lemma sample1_3: forall a b: Prop, ((a -> b) -> a) -> a.
Proof.
  Admitted.

(** ** Do not modify this line: sample1_4 *)

Lemma sample1_4: forall a b: Prop, ~a -> (~b -> ~(a \/ b)).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_5 *)

Lemma sample1_5: forall a b: Prop, ~(a /\ b) -> (b -> ~a).
Proof.
  Admitted.

(** ** Do not modify this line: sample1_6 *)

Lemma sample1_6: forall a b: Prop, (~b -> ~a) -> ((~b -> a) -> b).
Proof.
  Admitted.

(** ** Do not modify this line: sample1_7 *)

Lemma sample1_7: forall a b: Prop, (a -> b) -> ((~a -> b) -> b).
Proof.
  Admitted.

(** ** Do not modify this line: sample1_8 *)

Lemma sample1_8: forall a b: Prop, (a -> b) -> ((a -> ~b) -> ~a).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_9 *)

Lemma sample1_9: forall a b: Prop, (~b -> a) -> ((b -> a) -> a).
Proof.
  Admitted.

(** ** Do not modify this line: sample1_10 *)

Lemma sample1_10: forall a b: Prop, (a <-> b) -> (~a \/ b).
Proof.
  Admitted.

(** ** Do not modify this line: sample1_11 *)

Lemma sample1_11: forall a b c: Prop, (a -> (b -> c)) -> ((a -> b) -> (a -> c)).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_12 *)

Lemma sample1_12: forall a b c: Prop, (a -> (b -> c)) <-> ((a /\ b) -> c).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_13 *)

Lemma sample1_13: forall a b c: Prop, (a -> c) -> ((b -> c) -> ((a \/ b) -> c)).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_14 *)

Lemma sample1_14: forall a b c: Prop, (a -> b) -> ((c -> a) -> (c -> b)).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_15 *)

Lemma sample1_15: forall a b c: Prop, a \/ (b \/ c) -> ((b \/ (a \/ c)) \/ a).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_16 *)

Lemma sample1_16: forall a b c: Prop, (a -> (b -> c)) -> (b -> (a -> c)).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_17 *)

Lemma sample1_17: forall a b c: Prop, (c -> a) -> ((a -> b) -> (c -> b)).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_18 *)

Lemma sample1_18: forall a b c: Prop, ((a /\ b) -> c) -> (a -> (b -> c)).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_19 *)

Lemma sample1_19: forall a b c: Prop, (a -> b /\ c) <-> (a -> b) /\ (a -> c).
Proof.
  tauto.
Qed.

(** ** Do not modify this line: sample1_20 *)

Lemma sample1_20: forall a b c d e: Prop, 
    ((((a -> b) -> (~c -> ~d)) -> c) -> e) -> ((e -> a) -> (d -> a)).
Proof.
  Admitted.









