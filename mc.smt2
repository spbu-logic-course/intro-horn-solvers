; (set-logic HORN)
(set-logic LIA)
(set-option :produce-proofs true)

(declare-fun mc (Int Int) Bool)
; (define-fun mc ((x Int) (r Int)) Bool
;   (>= r x))

; (define-fun mc ((x Int) (r Int)) Bool
;   (and (or (not (>= r 92))
;            (not (>= (+ r (* (- 1) x)) (- 9))))
;        (> r 90)))

(assert (forall ((x Int)) (=> (> x 100) (mc x (- x 10)))))
(assert (forall ((x Int) (r Int) (r1 Int))
  (=> (and (not (> x 100)) (mc (+ x 11) r) (mc r r1))
      (mc x r1))))

(assert (forall ((x Int) (r Int))
  (=> (and (mc x r) (<= x 101) (not (= r 91)))
      false)))

(check-sat)
; (get-proof)
(get-model)

; (define-fun mc ((x Int) (r Int)) Bool
;   (and (or (not (>= r 92))
;            (not (>= (+ r (* (- 1) x)) (- 9))))
;        (> r 90)))
; (x < r + 10 -> r <= 91) /\ r >= 91
