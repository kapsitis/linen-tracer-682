Variable U : Type.
Require Import Classical_Prop.


Lemma not_all_not_ex :
 forall P:U -> Prop, ~ (forall n:U, ~ P n) -> exists n : U, P n.
Proof.
  intros P notall.
  apply NNPP.
  intro abs.
  apply notall.
  intros n H.
  apply abs; exists n; exact H.
Qed.

