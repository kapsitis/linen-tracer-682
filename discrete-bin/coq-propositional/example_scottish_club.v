(** #<a href="../../discrete/assignments.html">Back to Discrete Assignments</a># *)

(** * Scottish Club Example *)

(** This example is taken from 
#<a href="https://coq.inria.fr/tutorial/1-basic-predicate-calculus&#35;sec11">Basic Predicate Calculus (1.3.4)</a>#
#<br/>#
A private club has the following rules:
#<br/>#
#<ol>#
#<li>Every non-Scottish member wears red socks.</li>#
#<li>Every member wears a kilt or does not wear red socks.</li>#
#<li>The married members do not go out on Sunday.</li>#
#<li>A member goes out on Sunday if and only if he is Scottish.</li>#
#<li>Every member who wears a kilt is Scottish and married.</li>#
#<li>Every Scottish member wears a kilt.</li>#
#</ol>#
*)

(** Now, we show that these rules are so 
strict that no one can be accepted. *)

Section club.

Variables Scottish RedSocks WearKilt Married GoOutSunday : Prop.

Hypothesis rule1 : ~Scottish -> RedSocks.
Hypothesis rule2 : WearKilt \/ ~RedSocks.
Hypothesis rule3 : Married -> ~GoOutSunday.
Hypothesis rule4 : GoOutSunday <-> Scottish.
Hypothesis rule5 : WearKilt -> Scottish /\ Married.
Hypothesis rule6 : Scottish -> WearKilt.


(** ** One-line "proof" of a 5-variable tautology *)

(** In Coq this is effective, but not very informative
proof that the following thing is a tautology:
#<br/>#
#<tt>~(rule1 /\ rule2 /\ rule3 /\ rule4 /\ rule5 /\ rule6)</tt>#
#<br/>#
Or, equivalently, this states that all the rules together
make a contradiction. So, this is also a tautology:
#<br/>#
#<tt>(rule1 /\ rule2 /\ rule3 /\ rule4 /\ rule5 /\ rule6) -&gt; False</tt>#
*)

Lemma NoMember : False.
Proof. 
  tauto. 
Qed.

End club.

Print NoMember. 

(** ** Explicit proof from the rules *) 

(** Using tactic "tauto" checks, if proposition is a tautology 
in the classical logic. It accepts all tautologies. 
Unfortunately, this does not show any human-readable way 
how to prove the propositional statement in a meaningful way.
Unlike computers, humans cannot easily analyze full truth 
tables with all 32 combinations of 5 propositions 
(wheather someone is Scottish, 
wears red socks, wears a kilt, is married or goes out on Sundays).
Therefore we apply rules of reasoning inside Coq.
But first let's convince ourselves that the statement is true.
We consider two cases:
#<ul>#
#<li>Assume a club member wears a kilt.</li>#
#<li>Then he is both Scottish and Married (rule5).</li>#
#<li>Then he does NOT go out on Sundays (rule3).</li>#
#<li>Then he cannot be Scottish (contrapositive from rule4: <tt>~GoOutSunday -&gt; ~Scottish</tt>).</li>#
#</ul>#
Contradiction. We established that no member can wear a kilt.
#<ul>#
#<li>On the other side, assume a club member does not wear a kilt.</li>#
#<li>Then he cannot be Scottish (contrapositive from rule6: <tt>~WearKilt -&gt; ~Scottish</tt>).</li>#
#<li>Then he must wear red socks (rule1).</li>#
#<li>Then <tt>~(WearKilt \/ ~ RedSocks)</tt> is true (negation of rule2).</li>#
#</ul>#
Contradiction once again. We established that no member can avoid wearing a kilt.
#<br/>#
The Law of Excluded Middle shows that this is impossible, since
each member either wears a kilt or he does not.
*)

Section clubExplicit. 

Variables Scottish RedSocks WearKilt Married GoOutSunday : Prop.

Hypothesis rule1 : ~Scottish -> RedSocks.
Hypothesis rule2 : WearKilt \/ ~RedSocks.
Hypothesis rule3 : Married -> ~GoOutSunday.
Hypothesis rule4 : GoOutSunday <-> Scottish.
Hypothesis rule5 : WearKilt -> Scottish /\ Married.
Hypothesis rule6 : Scottish -> WearKilt.


(**
These two axioms are often needed (and they are not provable 
in intuitionist mathematics). They are usually imported 
from Coq libraries:
#<br/>#
#<tt>Require Import Classical_Prop.</tt>#
#<br/>#
In this brief example we do not import this library with axioms,
we state these two basic axioms locally.
*)

Axiom ExcludedMiddle: forall A:Prop, A \/ ~ A.
Axiom ContraPos : forall A B: Prop, (A -> B) <-> (~B -> ~A).


Lemma NoMemberExplicit : False.
Proof. 
  elim (ExcludedMiddle WearKilt).
  intros KiltHypothesis.
  pose (rule5 KiltHypothesis) as H1.
  destruct H1 as [H2 H3].
  pose (rule3 H3) as H4.
  destruct rule4 as [rule4A rule4B].
  assert ((Scottish -> GoOutSunday) -> (~GoOutSunday -> ~Scottish)).
  apply ContraPos with (A:=Scottish) (B:=GoOutSunday).
  pose (H rule4B) as H6.
  pose (H6 H4) as H7.
  pose (H7 H2) as CONTRA.
  contradiction CONTRA.
  (** Now assume that there is no kilt *)
  intros NoKiltHypothesis.
  assert ((Scottish -> WearKilt) -> (~WearKilt -> ~Scottish)).
  apply ContraPos with (A:=Scottish) (B:=WearKilt).
  pose (H rule6) as H1.
  pose (H1 NoKiltHypothesis) as H2.
  pose (rule1 H2) as H3.
  destruct rule2 as [H4 | H5].
  pose (NoKiltHypothesis H4) as CONTRA.
  contradiction CONTRA.
  pose (H5 H3) as CONTRA.
  contradiction CONTRA.
Qed.

End clubExplicit.



(** ** Hypotheses can be replaced by conditions *)

(** Creating and closing "sections" and formulating 
hypotheses locally is not necessary. 
Scottish club's example can be written as a 
closed-form Boolean tautology that is true for all 
possible truth values for 5 propositions.
*) 

Lemma ScottishClub: 
    forall Scottish RedSocks WearKilt Married GoOutSunday: Prop,
    ((~ Scottish -> RedSocks) /\
     (WearKilt \/ ~ RedSocks) /\
     (Married -> ~ GoOutSunday) /\
     (GoOutSunday <-> Scottish) /\
     (Scottish /\ Married) /\
     (Scottish -> WearKilt)) -> False.
Proof.
  intros Scottish RedSocks WearKilt Married GoOutSunday.
  intros H. 
  destruct H as [rule1 [ rule2 [rule3 [rule4 [rule5 rule6]]]]].
  Admitted.

(** After the "destruct H" we get the same 
initial state: Prove "False", if there are 6 hypotheses or
rules r1, r2, r3, r4, r5, r6.
*)

(** The statement to prove looks like this:
#<pre>#
1 subgoal
Scottish, RedSocks, WearKilt, Married, GoOutSunday : Prop
rule1 : ~ Scottish -> RedSocks
rule2 : WearKilt \/ ~ RedSocks
rule3 : Married -> ~ GoOutSunday
rule4 : GoOutSunday <-> Scottish
rule5 : Scottish /\ Married
rule6 : Scottish -> WearKilt
______________________________________(1/1)
False
#</pre>#
*)


