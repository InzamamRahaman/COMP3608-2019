;;;http://perugini.cps.udayton.edu/teaching/courses/Spring2017/cps499/#langpres
(deffacts initial-state "Start state of the state machine"
    (curr-state q0)
    (not-finished)  
    (initial-fact))

(deffunction str-tail (?x)
    (bind ?len (str-length ?x))
    (sub-string 2 ?len ?x))

(deffunction str-head (?x)
    (sub-string 1 1 ?x))

(deffunction str-empty (?x)
    (bind ?len (str-length ?x))
    (eq 0 ?len))

(defrule check-finished
    (declare (salience 99))
    (data ?x)
    ?nf <- (not-finished)
    =>
    (if (str-empty ?x) then (assert (finished)) (retract ?nf)))

(defrule when-finished-q0
    (finished)
    (curr-state q0) 
    =>
    (printout t "String accepted" crlf))

(defrule when-finished-q1
    (finished)
    (curr-state q1)
    =>
    (printout t "String not accepted" crlf))

(defrule when-in-q0
    (declare (salience 40))
    ?q <- (curr-state q0)
    ?d <- (data ?x) 
    (not-finished)
    =>
    (bind ?y (str-tail ?x))
    (retract ?d)
    (assert (data ?y))
    (if (eq "a" (str-head ?x)) then (retract ?q) (assert (curr-state q1))))


(defrule when-in-q1
    (declare (salience 40))
    ?q <- (curr-state q1)
    ?d <- (data ?x) 
    (not-finished)
    =>
    (bind ?y (str-tail ?x))
    (retract ?d)
    (assert (data ?y))
    (if (eq "a" (str-head ?x)) then (retract ?q) (assert (curr-state q0))))

(defrule main-rule 
    (declare (salience 1000))
    (initial-fact)
    => 
    (printout t "Enter string" crlf)
    (bind ?x (read))
    (bind ?y (str-cat ?x))
    (assert (data ?y)))

