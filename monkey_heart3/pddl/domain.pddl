(define (domain monkey_heart_story)
(:requirements :typing :conditional-effects :universal-preconditions :disjunctive-preconditions :negative-preconditions :equality)
(:types animal location)

(:predicates
    (connected ?l1 ?l2 - location)
    (in ?a - animal ?l - location)
    (sick ?a)
    (travelling_together ?a1 ?a2 - animal)
    (foolish ?a - animal)
    (tricked_once ?a - animal)
    (trust ?a1 ?a2 - animal)
    (tricked_twice ?a - animal)
    (heart_eater ?a - animal)
    (want_heart ?a - animal)
)

(:action move
:parameters (?a - animal ?l1 ?l2 - location)
:precondition ( and (in ?a ?l1) (connected ?l1 ?l2))
:effect (and
    (in ?a ?l2)
    (forall (?a2 - animal)
    (when (and (in ?a2 ?l1) (or (travelling_together ?a ?a2) (travelling_together ?a2 ?a))) (in ?a2 ?l2))
    )
)
)

(:action trick
    :parameters (?a1 ?a2 - animal)
    :precondition (and (exists (?l - location) (and (in ?a1 ?l) (in ?a2 ?l)))
        (or (foolish ?a2) (not (tricked_once ?a2))) 
        (not (= ?a1 ?a2))
    )
    :effect (and (trust ?a2 ?a1)
        (when (not (tricked_once ?a2)) (tricked_once ?a2)) 
        (when (tricked_once ?a2) (tricked_twice ?a2))
    )
)

(:action move_together
    :parameters (?a1 ?a2 - animal)
    :precondition (or (trust ?a1 ?a2) (trust ?a2 ?a1))
    :effect (and (travelling_together ?a1 ?a2))
)

(:action eat_heart
    :parameters (?a1 ?a2 - animal)
    :precondition (and (exists (?l - location) (and (in ?a1 ?l) (in ?a2 ?l)))
        (tricked_twice ?a2) 
        (or (want_heart ?a1) (sick ?a1))
    )
    :effect (heart_eater ?a1)
)




)