(define (domain rapunzel_story)
(:requirements :typing :existential-preconditions :negative-preconditions :universal-preconditions :equality :disjunctive-preconditions :conditional-effects)
(:types
    person
    location
)

(:predicates
    (has_long_hair ?p - person)
    (has_cut_hair ?p - person)
    (has_ladder ?p - person)
    (inside_tower ?p - person)
    (in ?p - person ?l - location)
    (like ?p1 ?p2 - person)
    (married ?p1 ?p2 - person)
    (connected ?l1 ?l2 - location)
    (family ?p1 ?p2 - person)
    (hurt ?p - person)
    (isTower ?l - location)
)

(:action climb_tower
    :parameters (?p1 ?p2 - person)
    :precondition (and
    (or (has_long_hair ?p2) (has_cut_hair ?p2) (has_ladder ?p2))
    (inside_tower ?p2)
    (not (inside_tower ?p1))
    (exists (?l - location) (and (isTower ?l) (in ?p1 ?l) (in ?p2 ?l)))
    (not (= ?p1 ?p2))
    )
    :effect 
        (inside_tower ?p1)
    
)


(:action walk
    :parameters (?p - person ?l1 ?l2 - location)
    :precondition (and
        (in ?p ?l1)
        (connected ?l1 ?l2)
        (not (inside_tower ?p))
    )
    :effect (and 
        (in ?p ?l2)  
        (not (in ?p ?l1))
    )
)

(:action grow_hair
    :parameters (?p - person)
    :precondition (and
        (not (has_long_hair ?p))
    )
    :effect (and 
        (has_long_hair ?p)
    )
)


(:action descend_tower
    :parameters (?p1 ?p2 - person)
    :precondition (and
        (or (has_long_hair ?p2) (has_cut_hair ?p2) (has_ladder ?p2))
        (inside_tower ?p2)
        (inside_tower ?p1)
        (not (= ?p1 ?p2))
    )
    :effect (and
        (not (inside_tower ?p1))
    )
)

(:action jump_down_tower
    :parameters (?p - person)
    :precondition (and 
        (not (has_ladder ?p)) 
        (not (has_cut_hair ?p))
        (inside_tower ?p)
    )
    :effect (and 
        (not (inside_tower ?p)) 
        (hurt ?p)
    )
)


(:action climb_up_ladder
    :parameters (?p - person)
    :precondition (and 
        (has_ladder ?p) 
        (not (inside_tower ?p))
        (exists (?l - location) (and (isTower ?l) (in ?p ?l)))
    )
    :effect (and 
        (inside_tower ?p) 
    )
)
 
(:action climb_down_ladder
    :parameters (?p - person)
    :precondition (and 
        (has_ladder ?p) 
        (inside_tower ?p)
    )
    :effect (and 
        (not (inside_tower ?p)) 
    )
)

(:action climb_up_hair
    :parameters (?p - person)
    :precondition (and 
        (has_cut_hair ?p) 
        (not (inside_tower ?p))
        (exists (?l - location) (and (isTower ?l) (in ?p ?l)))
    )
    :effect (and 
        (inside_tower ?p) 
    )
)
 
(:action climb_down_hair
    :parameters (?p - person)
    :precondition (and 
        (has_cut_hair ?p) 
        (inside_tower ?p)
    )
    :effect (and 
        (not (inside_tower ?p)) 
    )
)

(:action serenade
    :parameters (?p - person ?l - location)
    :precondition  
        (in ?p ?l)
   
    :effect (and 
        (forall (?p2 - person) (when (and (in ?p2 ?l) (not (= ?p ?p2))) (like ?p2 ?p)))
    )
)

(:action sweet_talk 
    :parameters (?p1 ?p2 - person)
    :precondition (and
        (like ?p1 ?p2)       
        (exists (?l - location) (and
            (in ?p1 ?l) 
            (in ?p2 ?l)
        ))
        (not (= ?p1 ?p2))
    )
    :effect (and 
        (like ?p2 ?p1)    
    )
)

(:action cut_hair
    :parameters (?p1 ?p2 - person)
    :precondition (and 
        (has_long_hair ?p2)
        (exists (?l - location)
            (and
                (in ?p1 ?l)
                (in ?p2 ?l)
                (or (and (inside_tower ?p1) (inside_tower ?p2)) (and (not (inside_tower ?p1)) (not (inside_tower ?p1))))
            ) 
        )

    )
    :effect (and 
        (not (has_long_hair ?p2)) 
        (has_cut_hair ?p1)
        
    )
)

(:action marry
    :parameters (?p1 ?p2 - person)
    :precondition (and 
        (like ?p1 ?p2) 
        (like ?p2 ?p1)
        (not (family ?p1 ?p2))
        (exists (?l - location) (and
                (in ?p1 ?l) 
                (in ?p2 ?l)
        )
        )
        (not (married ?p1 ?p2))
        (not (married ?p2 ?p1))
    )
    :effect (and 
        (married ?p1 ?p2)
    )
)

(:action give_ladder
    :parameters (?p1 ?p2 - person)
    :precondition (and 
        (has_ladder ?p1) 
        (like ?p1 ?p2)
        (not (= ?p1 ?p2))
        (exists (?l - location) (and
            (in ?p1 ?l) 
            (in ?p2 ?l)
        ))
    )
    :effect (and
        (not (has_ladder ?p1)) 
        (has_ladder ?p2)
        (like ?p2 ?p1)
    )
)


)
