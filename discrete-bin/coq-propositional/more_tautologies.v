(** #<a href="../../discrete/assignments.html">Back to Discrete Assignments</a># *)

(** * Negations *)

(** Tactic "discriminate" tells that constants "0" and "1" 
are already in their final state and 
cannot be transformed into equal things.
*)

Theorem zero_not_one : 0 <> 1.
Proof.
  unfold not.
  intros contra.
  discriminate contra.
Qed.

(** Principle of Explosion states that,
if you have a false statement among your hypotheses,
then you can prove anything.
#<i>Ex falso (sequitur) quodlibet (EFQ)</i># - 
this is a Latin proverb that tells, why contradictions 
are so dangerous in mathematics. Once you prove one such 
contradiction, there is no longer clear way to distinguish 
true statements from false.
*)


Theorem False_cannot_be_proven : ~False.
Proof.
  unfold not.
  intros proof_of_False.
  contradiction.
Qed.

Theorem False_implies_nonsense : False -> 2 + 2 = 5.
Proof.
  intros contra.
  contradiction.
Qed.



(** * Proving Implications *)

(** If one proposition logically implies another
it is called #<i>implication</i>#. For example:
#<blockquote><u>Direct implication:</u> <b>if</b> x=2,#
#<b>then</b> x<sup>2</sup>=4.</blockquote>#
In this example the first proposition (p) is "x=2", 
the second proposition (q) is "x squared is 4".
The combined statement is #<tt>p -&gt; q</tt># 
and it is read #"<b>if</b> <tt>p</tt> <b>then</b> <tt>q</tt>"#.
*)





(** ** Contrapositive *)

(** Note that in implication the order is relevant. For example, 
"x squared equals 4" does not necessarily imply "x=2", 
since x can also be negative 2. Nevertheless, there is 
one way to rewrite implication, and it is always equivalent
to the original implication. It is named 
#<i>contrapositive</i>#. 
#<br/>#
In our above example it would look like this: 
#<blockquote><u>Contrapositive implication:</u>#
#<b>if</b> x<sup>2</sup> is <b>not</b> 4,#
#<b>then</b> x is <b>not</b> equal to 2.</blockquote>#
*)

(** Using Coq, we show a Lemma that #<tt>p-&gt;q</tt># is
equivalent to #<tt>~q -&gt; ~p</tt>#. This means that
every direct implication always means its contrapositive implication 
and vice versa. 
To see the proof in Coq, click on the link
#<b>Proof.</b># right under the theorem.
*)

Require Import Classical_Prop.

Lemma contrapos : forall p q: Prop, (p -> q) <-> (~q -> ~p).
Proof. 
  split.
  intros. (*r Part 1: (~ q -> ~ p) -> (p -> q) *)
  intro.
  apply H0.
  apply H.
  exact H1.
  unfold not. (*r Part 2: (~ q -> ~ p) -> (p -> q) *)
  intros.
  assert (q \/ ~q).  (*r Law of Excluded Middle *)
  unfold not.
  apply classic with (P := q). 
  destruct H1 as [H2 | H3].
  exact H2.
  pose (H H3).
  pose (f H0).
  contradiction f0.
Qed.








