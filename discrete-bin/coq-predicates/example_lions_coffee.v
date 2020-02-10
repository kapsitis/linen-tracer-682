(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(** * Predicate Logic: Lewis Carrol's Syllogism *)

(** This example is written by L.Carrol (the
author of "Alice in Wonderland". It is also
mentioned in K.Rosen's slide:
*)
(** #<p><img src='lions_coffee.png' width='90%'/></p># *)
(** In this example, there is a set 
#<tt>CRE</tt># containing all creatures, 
#<tt>isLion(x)</tt>#, #<tt>isFierce(x)</tt>#
and #<tt>drinksCoffee(x)</tt># are three predicates.
The predicates and their interpretations do not 
matter for this example. 
In a similar way, you could write another syllogism
(predicate-logic statement that is true by its construction): 
"All humans deserve respect. Some humans lie. 
Therefore some liars deserve respect."
*)

(** ** Human-readable proof *)
(** Since some lions do not drink coffee
(i.e. there exists a non-drinking lion), let 
#<tt>myLion</tt># be such a lion. 
Now let us establish that #<tt>myLion</tt>#
is a creature that is both fierce and does not drink coffee. 
#<ol>#
#<li>Note that <tt>myLion</tt> should be fierce, since all lions are fierce.</li>#
#<li>Furthermore <tt>myLion</tt> does not drink coffee because of how it was selected.</li>#
#</ol>#
*)

(** ** Computer-verified proof *)

Section lions_coffee.

(** Declare a set #<tt>CRE</tt># of all the creatures, 
including lions and non-lions, fierce and non-fierce, 
drinking and non-drinking creatures.
#<br/>#
Also declare three predicates (functions that map
the set #<tt>CRE</tt># into true/false propositions.
*)

Variable CRE: Set.
Variables isLion isFierce drinksCoffee: CRE -> Prop.

(** These are two premises in the syllogism. *)

Hypothesis itemA: forall x:CRE, isLion(x) -> isFierce(x).
Hypothesis itemB: exists x:CRE, isLion(x) /\ ~drinksCoffee(x).

(** This is a conclusion from these premises *)

Lemma carrol: exists x:CRE, isFierce(x) /\ ~drinksCoffee(x).
Proof.
  destruct itemB as [myLion H].
  destruct H as [H1 H2].
  exists myLion.
  split.
  apply itemA.
  exact H1.
  exact H2.
Qed.

End lions_coffee.


(** We can also write the same Lemma as a big implication, 
where the premises #<tt>itemA</tt># and #<tt>itemB</tt># do not
appear as separate hypotheses, but are built into the 
lemma itself. We need to declare 
the set #<tt>CRE</tt># and the 3 predicates once again, because 
they are not visible after the section was closed.
*)

Variable CRE: Set.
Variables isLion isFierce drinksCoffee: CRE -> Prop.

Lemma lion_lemma: (forall x:CRE, isLion(x) -> isFierce(x)) ->
    (exists x:CRE, isLion(x) /\ ~drinksCoffee(x)) ->
    (exists x:CRE, isFierce(x) /\ ~drinksCoffee(x)).
Proof. 
  Admitted.

(** In this example the keyword #<tt>Admitted</tt># 
indicates that we left this proof unfinished. If you 
wish, you can edit this and create a proper proof
that closes by #<tt>Qed.</tt>#
*)


