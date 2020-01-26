(*
https://people.debian.org/~schepler/coqtut.v.html
*)

Parameter G : Type.
Parameter e : G.
Parameter inv : G -> G.
Parameter mult : G -> G -> G.
Infix "*" := mult.

Check (inv e).
Check (mult (inv e) e).
Check (inv e)*e.

Axiom left_id : forall x:G, e * x = x.

Axiom left_inv : forall x:G, inv x * x = e.
Axiom assoc : forall x y z:G, x * (y * z) = (x * y) * z.

Print left_id.
Check left_id.

Proposition left_cancel : forall x y z:G, x * y = x * z -> y = z.
Proof. 
  intros x y z Htocancel.
  assert (inv x * (x * y) = inv x * (x * z)).
  rewrite Htocancel.
  reflexivity.
  rewrite assoc in H.
  rewrite assoc in H.
  rewrite left_inv in H.
  rewrite left_id in H.
  rewrite left_id in H.
  assumption.
Qed.





