(set-logic HORN)

(declare-fun P (Int) Bool)
(assert (forall ((x Int)) (=> (<= x 0) (P x))))
(assert (forall ((x Int) (x1 Int)) (=> (and (P x) (< x 5) (= x1 (+ x 1))) (P x1))))

(assert (forall ((x Int)) (=> (and (P x) (>= x 10)) false)))
(check-sat)
(get-model)

; *investigate syntax*
; what does invariant mean?
; how to check the invariant?
