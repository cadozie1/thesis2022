(define (problem monkey_heart) (:domain monkey_heart_story)
(:objects 
monkey - animal
shark - animal
sultan - animal
lion - animal
donkey - animal
hare - animal
cliff - location
cave - location
tree - location
sea - location
forest - location
stream - location
)
(:init
    (in monkey tree)
    (in shark sea)
    (in sultan sea)
    (in lion cave)
    (in hare cave)
    (in donkey forest)
    (sick sultan)
    (sick lion)
    (connected tree cliff)
    (connected cave forest)
    (connected forest stream)
    (connected cliff sea)
    (connected sea cliff)
    (connected stream forest)
    (connected forest cave)
    (connected cliff tree)

    (foolish donkey)
    (want_heart hare)

)
(:goal (and
    (tricked_twice donkey)
    (tricked_once monkey)
    (tricked_once shark)
    (heart_eater lion)
    (not (heart_eater sultan))
))
)