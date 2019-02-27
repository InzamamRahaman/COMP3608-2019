(deftemplate transition 
    (slot from-state (type SYMBOL) )
    (slot to-state (type SYMBOL) )
    (slot symb (type STRING)))

(deffacts transitions
    (transition (from-state q0) (to-state q1) (symb "a"))
    (transition (from-state q0) (to-state q0) (symb "b"))
    (transition (from-state q1) (to-state q0) (symb "a"))
    (transition (from-state q1) (to-state q1) (symb "b"))
    (accept-state q0))


(deffacts initials 
    (initial-fact)
    (curr-state q0)
    (not-finished))

(deffunction str-tail (?x)
    (bind ?len (str-length ?x))
    (sub-string 2 ?len ?x))

(deffunction str-head (?x)
    (sub-string 1 1 ?x))

(deffunction str-empty (?x)
    (bind ?len (str-length ?x))
    (eq 0 ?len))

(defrule main-rule 
    (declare (salience 1000))
    (initial-fact)
    => 
    (printout t "Enter string" crlf)
    (bind ?x (read))
    (bind ?y (str-cat ?x))
    (bind ?head (str-head ?y))
    (bind ?tail (str-tail ?y))
    (assert (head ?head))
    (assert (tail ?tail)))


(defrule transition
    ?h <- (head ?head)
    ?tr <- (tail ?tail)
    ?s <- (curr-state ?f)
    (transition (from-state ?f) (to-state ?t) (symb ?head))
    (not-finished)
    =>
    (retract ?s)
    (assert (curr-state ?t))
    (retract ?h)
    (retract ?tr)
    (bind ?newhead (str-head ?tail))
    (bind ?newtail (str-tail ?tail))
    (assert (head ?newhead))
    (assert (tail ?newtail)))

(defrule is-finished 
    (declare (salience 1000))
    ?nf <- (not-finished) 
    (head ?head)
    =>
    (if (str-empty ?head) then 
        (assert (finished))
        (retract ?nf)))

(defrule when-finished-success
    (finished) (accept-state ?s) (curr-state ?s) =>
    (printout t "String accepted" crlf))

(defrule when-finished-failure
    (finished) (accept-state ?s) (curr-state ~?s) =>
    (printout t "String rejected" crlf))




