(defrule ask-question
    => (printout t "Starter turning (yes or no)" crlf)
       (bind ?ans (read))
       (assert (turning ?ans)))

(defrule ask-petrol 
    (turning yes) 
    => 
    (printout t "Got any petrol? (yes or no)" crlf)
    (bind ?ans (read))
    (assert (petrol ?ans)))

(defrule no-petrol
    (petrol no) => (printout t "Buy some petrol!" crlf))

(defrule yes-petrol
    (petrol yes) => (printout t "Call a mechanic!" crlf))

(defrule turning-no
    (turning no) => (printout t ":(" crlf))