(defrule start
    => (printout t "Person's name?" crlf)
       (bind ?name (read))
       (assert (man ?name)))

(defrule is-mortal
    (man ?x) => (assert (mortal ?x)))

(defrule print-is-mortal
    (mortal ?x) => (printout t "Someone is mortal" crlf))