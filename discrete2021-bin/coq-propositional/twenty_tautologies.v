(** 
#<a href="../../discrete2021/assignments.html">Back to Discrete Assignments</a>#
*)

(** ** This is a training file before H3.Q5 (non-constructive tautologies). 
We cover not just the non-constructive stuff (axioms #<tt>classic</tt># and 
#<tt>NNPP</tt>#, but many other tactics used in tautologies.
*)

(** #<b>Intuition:</b># If 'a' is both True and False, it implies any 'b' *)
Lemma sample1: forall a b: Prop, ~a -> a -> b.
Proof.
  intros a b.
  unfold not.
  intros aFalse.
  intros aTrue.
  pose (aFalse aTrue) as H2.
  contradiction H2.
Qed.

(** Same proof, just a bit shorter *)
Lemma sample1_VAR: forall a b: Prop, ~a -> a -> b.
Proof.
  intros a b.
  unfold not.
  intros aFalse aTrue.
  contradiction (aFalse aTrue).
Qed.

(** #<b>Note:</b># You cannot switch 'aFalse' and 'aTrue' in the last line. 
The following will not be accepted:
<<
  contradiction (aTrue aFalse).
>>
Modus ponens cannot insert '(a -> False)' into expression 'a', but it can insert
'a' into '(a -> False)' to get 'False', a contradiction. *)



(** #<b>Intuition:</b># If a=True, but b=False, then implication (a ->b) is always False. *)
Lemma sample2: forall a b: Prop, a -> (~b -> ~(a -> b)).
Proof.
  intros a b.
  unfold not.
  intros aTrue bFalse.
  intros H.
  apply bFalse.
  apply H.
  apply aTrue.
Qed. 

(** #<b>Note:</b># In this example we reasoned 'backwards' with three 'apply' tactics.
#<ol type='A'><li>replaced the goal False  by 'b',</li># 
#<li>replaced the goal 'b' by 'a',</li>#
#<li>finally, we know that 'a' is true.</li></ol>#
*)

(** Same proof written shorter *)
Lemma sample2_VAR: forall a b: Prop, a -> (~b -> ~(a -> b)).
Proof.
  unfold not.
  intros a b aTrue bFalse H.
  apply (bFalse (H aTrue)).
Qed.

(** The last line works just like function composition.#<br/># 
In most programming languages we would write function calls like this:
<<
  bFalse(H(aTrue))
>>
But in Coq syntax function call is an expression in parentheses:
The first item is the function/implication name. After that there is
one or more arguments.
*)

(** The last goal is False; so it is also a contradiction *)
Lemma sample2_VARVAR: forall a b: Prop, a -> (~b -> ~(a -> b)).
Proof.
  unfold not.
  intros a b aTrue bFalse H.
  contradiction (bFalse (H aTrue)).
Qed.


(** ** Non-constructive stuff

Here we import some axioms to do classical logic
(also called non-constructive stuff) *)
Require Import Classical_Prop.


(** #<b>Intuition:</b> If implication (a -> b) is False, then 'a' must be True *)
Lemma sample3: forall a b: Prop, ~(a -> b) -> a.
Proof.
  intros a b H1.
  apply NNPP.
  unfold not.
  intro H2.
  apply H1.
  intro aTrue.
  contradiction (H2 aTrue).
Qed.

(** Using the tactic
<<
  apply NNPP
>>
adds two negations to the goal. 
The axiom NNPP reads like this: #<tt>~~a -> a</tt>#, one can reason backwards.
Such step provides additional possibilities to do non-constructive proofs by contradiction 
whenever we are stuck. *)


(** Type this to display meaning of this symbol *)

Print NNPP.


(** #<b>Note:</b># The lemma NNPP (just like the lemmas that
we are doing is, in fact, a function. 
It eats one parameter and (after some body) produces 'usable stuff': 
#<tt>~~p -> p</tt>#. *)





(** #<b>Intuition:</b># If both 'a' and 'b' are False, then the disjunction 'a \/ b' is False *)
Lemma sample4: forall a b: Prop, ~a -> ~b -> ~(a \/ b).
Proof.
  intros a b.
  unfold not.
  intros aFalse bFalse.
  intros aORb.
  destruct aORb as [aTrue | bTrue].
  contradiction (aFalse aTrue).
  contradiction (bFalse bTrue).
Qed.

(** #<b>Note:</b># This shows a standard way to 'destruct' disjunctions in hypotheses: 
Sort two cases: Left side of aORb (in our case it is aTrue). 
The right side of aORb (in our case it is bTrue). 
In both cases we get a contradiction. *)

(** #<b>Intuition:</b># If 'a' and 'b' are not simultaneously true, 
one of them implies the negation of another. *)
Lemma sample5: forall a b: Prop, ~(a /\ b) -> (b -> ~a).
Proof.
  intros a b.
  unfold not.
  intros H.
  intros bTrue.
  intros aTrue.
  apply H.
  split.
  exact aTrue.
  exact bTrue.
Qed.


(** #<b>Note:</b># This shows a standard way to 'split' conjunction in the goal.
Split into two subgoals. 
First prove the left part of the conjunction, then prove the right part. *)


(** #<b>Intuition:</b># The tautology is a typical non-constructive stuff:#<br/>#
If '~b' implies '~a', and '~b' also implies 'a', 
then 'b' must be true *)
Lemma sample6: forall a b: Prop, (~b -> ~a) -> (~b -> a) -> b.
Proof.
  intros a b.
  unfold not.
  intros H1.
  intros H2.
  pose (classic b) as H3.
  destruct H3 as [bTrue | bFalse].
  exact bTrue.
  pose (H1 bFalse) as aFalse.
  pose (H2 bFalse) as aTrue.
  contradiction (aFalse aTrue).
Qed.

(** #<b>Note:</b># Here is one new trick: First introduce 'classic' axiom; 
then immediately destruct it into two subcases:
#<ol><li>b=True. (Really easy case)</li>#
#<li>b=False. In this situation we get contradictions with our earlier hypotheses.</li></ol>#
*)


(** #<b>Intuition:</b># Similar to the previous result: 
If ~b implies ~a, and ~b also implies a, 
then b must be true *)
Lemma sample7: forall a b: Prop, (a -> b) -> (~a -> b) -> b.
Proof.
  intros a b.
  intros H1.
  intros H2.
  pose (classic a) as H3.
  destruct H3 as [aTrue | aFalse].
  apply H1.
  exact aTrue.
  apply H2.
  exact aFalse.
Qed.

(** #<b>Note:</b># Very similar to the previous case, 
but it shows that you should pay attention to what 
'classic' axiom you need. In this case we wanted to sort two cases:
#<ol><li>a = True</li>#
#<li>b = False</li></ol>#
*)


(** Similar to sample6, but not exactly the same *)
Lemma sample8: forall a b: Prop, (a -> b) -> (a -> ~b) -> ~a.
Proof.
  intros a b.
  intros H1.
  intros H2.
  pose (classic a) as H3.
  destruct H3 as [aTrue | aFalse].
  contradiction ((H2 aTrue) (H1 aTrue)).
  exact aFalse.
Qed.

(** #<b>Note:</b># Pay attention to the latest long expression that gives contradiction. 
Can rewrite the following expression:
<<
  contradiction ((H2 aTrue) (H1 aTrue)).
>>
as the following: 
<<
  pose (H1 aTrue) as bTrue.
  pose (H2 aTrue) as bFalse.
  contradiciton (bFalse bTrue) as CONTRA.
>>
*)



Lemma sample9: forall a b: Prop, (~b -> a) -> (b -> a) -> a.
Proof.
  intros a b.
  unfold not.
  intros H1.
  intros H2.
  pose (classic b) as H3.
  destruct H3 as [bTrue | bFalse].
  pose (H2 bTrue) as aTrue.
  exact aTrue.
  pose (H1 bFalse) as aTrue.
  exact aTrue.
Qed.

(** #<b>Note:</b># In the last few proofs there is a pattern: 
<<
  pose (classic b) as H3.
  destruct H3 as [bTrue | bFalse].
>>
In the following proof we show that you can 
rewrite this in a single line; and (instead of sorting two hypotheses)
prove two separate goals.
*)


(** #<b>Intution:</b># If 'a','b' are either both True or both False, then ~a OR b must be True. *)
Lemma sample10: forall a b: Prop, (a <-> b) -> (~a \/ b).
Proof.
  intros a b.
  intros H1.
  destruct H1 as [H2 H3].
  elim (classic a).
  intros aTrue.
  right. 
  apply (H2 aTrue).
  intros aFalse.
  left.
  exact aFalse.
Qed.


(** #<b>Intuition:</b># If 'a','b' both together imply 'c'; and also 'a->b', then 'a->c' *)
Lemma sample11: forall a b c: Prop, (a -> b -> c) -> (a -> b) -> (a -> c). 
Proof.
  intros a b c H1 H2 aTrue.
  apply (H1 aTrue).
  apply (H2 aTrue).
Qed.

(** #<b>Note:</b># Some implications are easy, if they are constructive and
you can apply Modus Ponens - i.e. simply 'plug in' one expression into another *)


(** #<b>Intuition:</b># 'a' implies 'b -> c' iff 'a and b' together imply 'c' *)
Lemma sample12: forall a b c: Prop, (a -> b -> c) <-> ((a /\ b) -> c).
Proof.
  intros a b c.
  split.
  - intros H1.
    intros [aTrue bTrue].
    exact (H1 aTrue bTrue).
  - intros H2.
    intros aTrue bTrue.
    assert (a /\ b) as H3.
    split.
    + exact aTrue.
    + exact bTrue.
    + pose (H2 H3) as cTrue.
      exact cTrue.
Qed.

(** #<b>Note:</b># Tactic 'split' is useful when proving conjunctions and also equivalences. 
In this case we need to check the statement in both directions. 
<<
  intros [aTrue bTrue].
>>
means the same as this:
<<
  intros myHypothesis. 
  destruct myHypothesis as [aTrue bTrue].
>>
Preceding your subcases with '+' and '-' is sometimes 
used to split long proofs in shorter sections.
It may keep things cleaner and more focused, 
but splitting into sections is never mandatory and does not affect the correctness of your proof. *)


(** #<b>Intuition:</b># If both (a->c) and (b->c), and you know that (a \/ b) is True, then c is True *)
Lemma sample13: forall a b c: Prop, (a -> c) -> (b -> c) -> (a \/ b) -> c. 
Proof.
  intros a b c.
  intros H1.
  intros H2.
  intros [aTrue | bTrue].
  exact (H1 aTrue).
  exact (H2 bTrue).
Qed.


(** #<b>Note:</b># One more shorthand notation: 
<<
  intros [aTrue | bTrue].
>>
is same as this:
<<
  intros H.
  destruct H as [aTrue | bTrue].
>>
*)

(** #<b>Intuition:</b># Just a statement that if (a->b) and (c->a), then (c->b). 
Transitivity - similar to the problem in Homeowork 2, Q2.C. 
It was about the plane/railway traffic being transitive.
*)
Lemma sample14: forall a b c: Prop, (a -> b) -> (c -> a) -> (c -> b).
Proof.
  intros a b c.
  intros H1 H2 cTrue.
  exact (H1 (H2 cTrue)).
Qed.



(** #<b>Intuition:</b># Some variant to say that disjunction is associative; and one can regroup. *)
Lemma sample15: forall a b c: Prop, a \/ (b \/ c) -> (b \/ (a \/ c)) \/ a.
Proof.
  intros a b c.
  intros [H2 | H3].
  right; exact H2.
  destruct H3 as [H4 | H5].
  left; left; exact H4.
  left; right; right; exact H5.
Qed.

(** The long expression with semicolons (;)
left; right; right; exact H5.
applies all the goals right after one another (one big jump). 
How to expalain this? We have the following goal: 
<<
  (b \/ a \/ c) \/ a.
>>
It seems that disjunction is right-associative: 
<<
  (b \/ a \/ c) \/ a = (b \/ (a \/ c)) \/ a. 
>>
Our hypothesis H5 says that 'c' must be True. 
We can 'drill down' to that variable:#<br/>#
'left' on '(b \/ (a \/ c)) \/ a' is '(b \/ (a \/ c))' #<br/>#
'right' on '(b \/ (a \/ c))' is '(a \/ c)'.#<br/>#
'right' on '(a \/ c)' is 'c'. #<br/>#
It is exactly our hypothesis H5. 
*)



(** #<b>Intuition:</b># Realy easy lemma: If 'a' and then 'b' both imply 'c', 
then 'b' and 'a' (switched places) imply 'c'
*)
Lemma sample16: forall a b c: Prop, (a -> (b -> c)) -> (b -> (a -> c)).
Proof.
  intros a b c. 
  intros H bTrue aTrue.
  exact ((H aTrue) bTrue).
Qed.

(** #<b>Note:</b># Here we pass two arguments to the 'two-argument' hypothesis H. 
The notation: 
<<
  (H aTrue bTrue)
>>
actually means this: #<tt>((H aTrue) bTrue)</tt>#. It is not same as:
<<
  (H (aTrue bTrue))
>>
Function/implication application is left-associative.
*)


(** #<b>Intuition:</b># Implication is transitive'; similar to 'sample14', but switched order. *)
Lemma sample17: forall a b c: Prop, (a -> b) -> (b -> c) -> (a -> c).
Proof.
  intros a b c H1 H2 aTrue.
  exact (H2 (H1 aTrue)).
Qed. 

(** #<b>Note:</b>#
In this case we need to group the function application from right to left *)


(** #<b>Intuition:</b># If (a and b) imply c, then 'a' implies that 'b' implies 'c' *)
Lemma sample18: forall a b c: Prop, ((a /\ b) -> c) -> (a -> (b -> c)).
Proof.
  intros a b c.
  intros H1 aTrue bTrue.
  assert (a /\ b) as aANDb.
  split.
  exact aTrue.
  exact bTrue.
  exact (H1 aANDb).
Qed. 


(** #<b>Intuition:</b># 'a' implies 'b and c'  iff  'a->b' and 'a->c' *)
Lemma sample19: forall a b c: Prop, (a -> b /\ c) <-> (a -> b) /\ (a -> c).
Proof.
  intros a b c.
  split.
  - intros H1.
    split.
    + intros aTrue.
      destruct (H1 aTrue) as [bTrue _].
      exact bTrue.
    + intros aTrue.
      destruct (H1 aTrue) as [_ cTrue].
      exact cTrue.
  - intros [H2 H3].
    intros aTrue.
    split.
    + exact (H2 aTrue).
    + exact (H3 aTrue).
Qed.


(** #<b>Intuition:</b># The final 2 lemmas are not too intuitive, but they are also tautologies.#<br/>#
Once again a long proof structured into subsections. *)
Lemma sample20: forall a b c d e: Prop, 
    ((((a -> b) -> (~c -> ~d)) -> c) -> e) -> ~a -> (d -> e).
Proof. 
  intros a b c d e.
  intros H1.
  intros aFalse.
  intros dTrue.
  assert (((a -> b) -> ~ c -> ~ d) -> c) as H4.
  intros H5.
  assert (a -> b) as H6.
  intros aTrue.
  contradiction (aFalse aTrue).
  pose (H5 H6) as H7.
  apply NNPP.
  unfold not.
  intros cFalse.
  contradiction ((H7 cFalse) dTrue).
  exact (H1 H4).
Qed.


Corollary longTautology: forall a b c d e: Prop, 
    ((((a -> b) -> (~c -> ~d)) -> c) -> e) -> ((e -> a) -> (d -> a)).
Proof.
  intros a b c d e.
  intros H1 H2 dTrue.
  destruct (classic a) as [aTrue | aFalse]. 
  exact aTrue.
  pose (sample20 a b c d e) as H3.
  pose (H3 H1) as H4.
  pose (H4 aFalse) as H5.
  pose (H5 dTrue) as eTrue.
  pose (H2 eTrue) as aTrue.
  exact aTrue.
Qed.




