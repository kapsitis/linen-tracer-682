Section lions_coffee.

(* Set of all creatures *)
Variable CRE: Set.
Variables isLion isFierce drinksCoffee: CRE -> Prop.

(* Our Assumptions *)
Hypothesis itemA: forall x:CRE, isLion(x) -> isFierce(x).
Hypothesis itemB: exists x:CRE, isLion(x) /\ ~drinksCoffee(x).

Lemma carrol: exists x:CRE, isFierce(x) /\ ~drinksCoffee(x).
Proof.
  destruct itemB as [myL H].
  destruct H as [H1 H2].
  exists myL.
  split.
  apply itemA.
  exact H1.
  exact H2.
Qed.

End lions_coffee.