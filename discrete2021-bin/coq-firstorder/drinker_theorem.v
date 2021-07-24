Section drinker_theorem.


(* Theorem (Raymond Smullyan): In any non-empty bar
there is a customer such that if she drinks, then everbody in the bar drinks. *)

(* The set of all humans in the bar *)
Variable Human: Set.

(* Drinking predicate: (DR x) is True iff 'x' drinks *)
Variable DR: Human -> Prop.

(* There is at least one customer in the bar *)
Variable somebody: Human.

Require Import Classical_Prop.



Theorem Smullyan: exists x:Human, (DR x) -> forall x:Human, (DR x).
Proof.
  elim (classic (exists x, ~ DR x)).
  - intros H1.
    destruct H1 as [NonDrinkingHuman H2].
    exists NonDrinkingHuman.
    intros H3.
    contradiction (H2 H3).
  - intro H4.
    exists somebody.
    intro H5.
    intro x.
    elim (classic (DR x)).
    + intros H6. 
      exact H6.
    + intro H7.
      assert (exists x : Human, ~ DR x) as H8.
      exists x.
      exact H7.
      contradiction (H4 H8). 
Qed.

End drinker_theorem.
