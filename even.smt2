(set-logic HORN)

(declare-datatype Nat ((Z) (S (prev Nat))))

(declare-fun even (Nat) Bool)
(assert (even Z))
(assert (forall ((x Nat)) (=> (even x) (even (S (S x))))))

(assert (forall ((x Nat)) (=> (and (even x) (even (S x))) false)))
; x = Z
; x = Z \/ x = S(S(Z))
; x = Z \/ x = S(S(Z)) \/ ..
; [even] = {Z, S(S(Z)), ...}
(check-sat)
