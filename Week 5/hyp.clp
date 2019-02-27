(deffacts foobars "My facts"
    (male tom)
    (male tim)
    (female jane)
    (child tim jane)
    (child tim tom))
     
(deffunction square (?x)
    (* ?x ?x))

(deffunction get-hyp (?opp ?adj)
    (sqrt (+ (square ?opp) (square ?adj))))

;; Blah Blah Blah
(deffunction find-roots (?a ?b ?c)
    (bind ?negb (* -1 ?b))
    (bind ?m1 (* 4 (* ?a ?c)))
    (bind ?bsquared (square ?b))
    (bind ?rooted (sqrt (- ?bsquared ?m1)))
    (bind ?numer (+ ?negb ?rooted))
    (bind ?denom (* 2 ?a))
    (/ ?numer ?denom))

;; while loop example
(while (> ?x 0)
	(printout t "x is " ?x crlf)
    (bind ?x (- ?x 1)))

(defrule is-father 
    (child ?x ?y)
    (male ?y)
    =>
    (assert (father ?y ?x))
    (printout t ?y " is " ?x "'s father" crlf))

(defrule foobar-remove 
    ?f <- (foobar ?x) 
    => 
    (printout t "Removing foobar " ?x crlf)
    (retract ?f))

(defrule are-married 
    (child ?x ?y)
    (child ?x ?z)
    =>
    (if (not (eq ?y ?z)) 
        then (printout t ?z " and " ?y " are married" crlf)
             (assert (married ?y ?z))))


(reset)
