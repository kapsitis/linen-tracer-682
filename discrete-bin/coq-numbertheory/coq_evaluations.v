(** #<a href="../../discrete/coq.html">Back to Coq Main Page</a>#  *)

(*
Print Z.divide.
http://gallium.inria.fr/blog/coq-eval/
Eval compute in Zis_gcd 7 4 1.
*)

Eval vm_compute in Z.divide 3 6.
Fixpoint fib (n: nat) : Z :=
  match n with 
    0%nat => 1 
    | 1%nat => 1 
    | S (S n2 as n1) => fib n1 + fib n2 
  end.

Compute (fib 35%nat).


Require Import List.

Definition t := { n: Z | n > 1 }.


Program Definition two : t := 2.
Next Obligation. omega. Qed.

Program Definition succ (n: t) : t := n + 1.
Next Obligation. destruct n; simpl; omega. Qed.

Require Import Eqdep_dec.

Program Definition t_eq (x y: t) : {x=y} + {x<>y} :=
  if Z.eq_dec (proj1_sig x) (proj1_sig y) then left _ else right _.
Next Obligation.
  destruct x as [x Px], y as [y Py]. simpl in H; subst y.
  f_equal. apply UIP_dec. decide equality.
Qed.
Next Obligation.
  red; intros; elim H; congruence.
Qed.

Definition t_list_eq: forall (x y: list t), {x=y} + {x<>y}.
Proof. decide equality. apply t_eq. Defined.


Compute (t_eq two two).
Compute (if t_eq two two then 1 else 2).

