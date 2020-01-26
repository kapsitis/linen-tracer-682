(** #<a href="../../discrete/assignments.html">Back to Discrete Assignments</a># *)

(** * Predicate Logic: Drinker's Theorem *)

(** This example included in the official 
Coq documentation: see
#<a href="https://coq.inria.fr/tutorial/1-basic-predicate-calculus&#35;sec15">Paradoxes#
#of classical predicate calculus</a>#. 
#<blockquote>"In any nonempty bar there is a person such that,#
#if s/he drinks, then everyone else in that bar also drinks."</blockquote>#
See #<a href="https://en.wikipedia.org/wiki/Drinker_paradox">Wikipedia: Drinker Paradox</a>#
for a longer discussion.
*)
(**
In fact, it is not a paradox, but rather simple theorem. 
It sounds unusual, because most #<b>if</b>-<b>then</b># statements usually 
mean some causal relationship between the condition and the conclusion. 
In the drinker theorem there is no such relationship: We do not 
need any assumptions on how one person's drinking affects what
other people do. 
*)

(** ** Human-readable Proof *)
(** We consider two cases. 
#<ul><li>If we assume that everyone is drinking,#
#then select anybody (note that the bar is nonempty).# 
#The conclusion of the theorem will be true.</li>#
#<li>If there are non-drinking people in the bar,#
#then select anyone among them. In this case the condition#
#is wrong: the person we selected does NOT drink.#
#Therefore the whole implication will be also true,#
#since <tt>false</tt> implies anything.#
#</ul>#
*)

(** ** Computer-verified Proof *)

Section drinker_lemma.

(** Denote #<tt>D</tt># - the set of all people in the bar; 
#<tt>P</tt># - drinker predicate (takes value "true" for those
who drink, takes value "false" otherwise).
There is at least one person in the bar, denote it by #<tt>d</tt>#, 
we do not know, if #<tt>d</tt># drinks or not.
*)

Variable D: Set.

Variable P:  D -> Prop.

Variable d: D.

Axiom ExcludedMiddle: forall A:Prop, A \/ ~ A.

Lemma drinker: exists x:D, P x -> forall x:D, P x.
Proof.
  elim (ExcludedMiddle (exists x, ~ P x)).
  intros (Tom, Tom_does_not_drink).
  exists Tom.
  intro Tom_drinks.
  contradiction.

  intro No_nondrinker.
  exists d.
  intro d_drinks.
  intro Joe.
  elim (ExcludedMiddle (P Joe)).
  trivial.
  intro Joe_does_not_drink. 
  absurd (exists x, ~ P x).
  exact No_nondrinker.
  exists Joe.
  exact Joe_does_not_drink.
Qed.


End drinker_lemma.
