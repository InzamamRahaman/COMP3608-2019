(deftemplate person
    (slot name (type STRING))
    (slot age (type INTEGER))
    (slot fav-color (type SYMBOL) (allowed-values red blue green)))

(deffacts person-database
    (person (name "Mario") (age 35) (fav-color red))
    (person (name "Luigi") (age 35) (fav-color green))
    (person (name "Peach") (age 35) (fav-color green)))

(defrule will-they-marry 
    (person (name ?x) (age ?a) (fav-color ?c))
    (person (name ?y) (age ?b) (fav-color ?c))
    =>
    (if (not (eq ?x ?y)) then (assert (married ?x ?y))))