(define (domain gold_nugget_story)
(:requirements :typing :conditional-effects :existential-preconditions :equality :universal-preconditions :negative-preconditions :disjunctive-preconditions)
(:types person location 
    nugget nugget2 snake_obj copper_obj - object
)

(:predicates
(connected ?l1 ?l2 - location)
(in ?p - person ?l - location)
(friends ?p1 ?p2 - person)
(tired ?p - person)
(has_object ?l - location ?o - object)
(holds_object ?p - person ?o - object)
(virtuous ?p - person)
(resting ?p - person ?l - location)
(has_snake ?l - location)
(has_nugget ?l - location)
(has_nugget2 ?l - location)
(hidden_snake ?l - location)
(hidden_nugget ?l - location)
(hidden_nugget2 ?l - location)
)

(:action walk
:parameters (?p - person ?l1 ?l2 - location)
:precondition ( and
    (in ?p ?l1) 
    (connected ?l1 ?l2)  
    (not (resting ?p ?l1))
    )
:effect (and
    (forall (?p2 - person)
        (when (and (not (= ?p2 ?p)) (in ?p2 ?l1) (not (resting ?p2 ?l1)) (friends ?p ?p2)) 
        (in ?p2 ?l2)
        )
    
    )
    (in ?p ?l2)
    (when (and (not (virtuous ?p)) (has_snake ?l2)) (not (hidden_snake ?l2)))
    (when (and (virtuous ?p) (has_nugget ?l2)) (not (hidden_nugget ?l2)))
    (when (and (not (hidden_snake ?l1)) (has_snake ?l1)) (hidden_snake ?l1))
    (when (and (not (hidden_nugget ?l1)) (has_nugget ?l1)) (hidden_nugget ?l1))
    (when (and (not (hidden_nugget2 ?l1)) (has_nugget2 ?l1)) (hidden_nugget2 ?l1))

)
)

(:action rest
:parameters (?p - person ?l - location)
:precondition (and
    (in ?p ?l)
    (not (resting ?p ?l))
    (tired ?p)
    (not (exists (?p2 - person) (resting ?p2 ?l) )) 
)
:effect (and 
    (resting ?p ?l)
    (not (tired ?p))
)
)

(:action talk
    :parameters (?p1 - person ?p2 - person)
    :precondition (and 
        (not (= ?p1 ?p2))
        (exists (?l - location) (and (in ?p1 ?l) (in ?p2 ?l)) ) 
    )
    :effect (and 
        (forall (?l - location) (not (resting ?p2 ?l))) 
    )
)

(:action pick_up
    :parameters (?p - person ?o - object ?l - location)
    :precondition (and 
        (in ?p ?l)
        (has_object ?l ?o)
        (or (and (virtuous ?p)  (not (exists (?s - snake_obj) (= ?o ?s))))
            (and (not (virtuous ?p)) 
            (and
                (not (exists (?n - nugget) (= ?n ?o)))
                (not (exists (?n - nugget2) (= ?n ?o)))
            )
            )
        )

    )
    :effect (and 
        (when (exists (?n - nugget) (= ?n ?o)) (not (has_nugget ?l)))
        (when (exists (?n - nugget2) (= ?n ?o)) (not (has_nugget2 ?l)))
        (when (exists (?s - snake_obj) (= ?s ?o)) (not (has_snake ?l)))
        (not (has_object ?l ?o)) 
        (holds_object ?p ?o)
        (not (virtuous ?p))
    )
)

(:action give
    :parameters (?p1 ?p2 - person ?o - object)
    :precondition (and 
        (holds_object ?p1 ?o)
        (exists (?l - location) (and (in ?p1 ?l) (in ?p2 ?l)))
    )
    :effect (and 
        (not (holds_object ?p1 ?o)) 
        (holds_object ?p2 ?o)
        (virtuous ?p1)
    )
)
(:action drop
    :parameters (?p - person ?o - object ?l - location)
    :precondition (and 
        (in ?p ?l)
        (holds_object ?p ?o)
    )
    :effect (and 
        (when (exists (?n - nugget) (= ?n ?o)) (has_nugget ?l))
        (when (exists (?n - nugget2) (= ?n ?o)) (has_nugget2 ?l))
        (when (exists (?s - snake_obj) (= ?s ?o)) (has_snake ?l))
        (not (holds_object ?p ?o) )
        (has_object ?l ?o)
    )
)


)
