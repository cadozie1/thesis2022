(define (problem monkey_heart) (:domain monkey_heart_story)
(:objects 
the_monkey - animal
the_shark - animal
the_sultan - animal
the_lion - animal
the_donkey - animal
the_hare - animal
cliff - location
cave - location
tree - location
sea - location
forest - location
stream - location
)
(:init
    (in the_monkey tree)
    (in the_shark sea)
    (in the_sultan sea)
    (in the_lion cave)
    (in the_hare cave)
    (in the_donkey forest)
    (sick the_sultan)
    (sick the_lion)
    (connected tree cliff)
    (connected cave forest)
    (connected forest stream)
    (connected cliff sea)
    (connected sea cliff)
    (connected stream forest)
    (connected forest cave)
    (connected cliff tree)

    (foolish the_donkey)
    (want_heart the_hare)

)
(:goal (and
    (tricked_twice the_donkey)
    (tricked_once the_monkey)
    (tricked_once the_shark)
    (heart_eater the_lion)
    (not (heart_eater the_sultan))
))
)
