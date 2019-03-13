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
	(turning no) 
	=> 
	(printout t "Lights working (yes or no)" crlf)
    (bind ?ans (read))
    (assert (lights ?ans))
	)
	
(defrule lights-nop
	(lights yes) 
	=> 
	(printout t "Change the battery" crlf)
	)

(defrule lights-yes
	(lights yes) 
	=> 
	(printout t "Does the solenoid click  (yes or no)" crlf)
    (bind ?ans (read))
    (assert (solenoid ?ans))
	)
	
(defrule solenoid-no
	(solenoid no) 
	=> 
	(printout t "Is the solenoid fuse ok? (yes or no)" crlf)
    (bind ?ans (read))
    (assert (fuse ?ans))
	)
	
(defrule solenoid-yes
	(solenoid yes) 
	=> 
	(printout t "Terminals clean? (yes or no)" crlf)
    (bind ?ans (read))
    (assert (terminal ?ans))
	)
	
(defrule fuse-no
	(fuse no) 
	=> 
	(printout t "Replace fuse" crlf)
	)

(defrule fuse-yes
	(fuse yes) 
	=> 
	(printout t "Replace solenoid" crlf)
	)
	
(defrule terminal-no
	(terminal no) 
	=> 
	(printout t "Clean terminal" crlf)
	)

(defrule terminal-yes
	(terminal yes) 
	=> 
	(printout t "Replace starter" crlf)
	)
	

	
