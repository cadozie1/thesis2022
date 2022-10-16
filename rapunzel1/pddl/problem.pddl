(define (problem rapunzel_problem) (:domain rapunzel_story)
(:objects
    capital_rapunzels_father - person
    capital_rapunzels_mother - person
    capital_rapunzel - person
    the_prince - person
    the_king - person
    the_enchantress - person
    garden - location
    tower - location
    forest - location
    castle - location
    house - location
)
(:init 
    (has_long_hair capital_rapunzel)
    (in capital_rapunzel tower)
    (inside_tower capital_rapunzel)
    (in the_enchantress tower)
    (inside_tower the_enchantress)
    (isTower tower)

    (not (has_long_hair capital_rapunzels_father))
    (not (has_long_hair capital_rapunzels_mother))
    (not (has_long_hair the_enchantress))
    (not (has_long_hair the_prince))
    (not (has_long_hair the_king))

    (not (inside_tower capital_rapunzels_father))
    (not (inside_tower capital_rapunzels_mother))
    (not (inside_tower the_prince))
    (not (inside_tower the_king))
    

    (connected forest tower)
    (connected tower forest)
    (connected forest castle)
    (connected castle forest)
    (connected house garden)
    (connected garden house)
    (connected forest house) 
    (connected house forest)

    (in capital_rapunzels_father house)
    (in capital_rapunzels_mother house)
    (in the_prince castle)
    (in the_king castle)
    (has_ladder the_king)
    (married capital_rapunzels_father capital_rapunzels_mother)


    (family capital_rapunzels_father capital_rapunzel)
    (family capital_rapunzels_mother capital_rapunzel)
    (family the_king the_prince)
    
    (like the_prince the_king)
    (like capital_rapunzels_father capital_rapunzels_mother)
    (like capital_rapunzels_mother capital_rapunzels_father)
    (not (like capital_rapunzels_father the_enchantress))
    (not (like capital_rapunzels_mother the_enchantress))

    ; the_enchantress hates everyone
    (not (like the_enchantress capital_rapunzel))
    (not (like the_enchantress capital_rapunzels_father))
    (not (like the_enchantress capital_rapunzels_mother))
    (not (like the_enchantress the_prince))
    (not (like the_enchantress the_king))
    (not (like the_enchantress the_enchantress))

    (has_ladder the_king)
    


)
(:goal (and
    ;the_enchantress becomes new capital_rapunzel
    (married capital_rapunzel the_prince)
    (in capital_rapunzel castle)
    (hurt the_prince)
    (not (hurt capital_rapunzel))

    ;the_enchantress enchants capital_rapunzels_father 
    ;(married capital_rapunzel the_prince)
    ;(in capital_rapunzel house)
    ;(has_long_hair capital_rapunzels_mother)
    ;(has_ladder the_enchantress)
    ;(not (like the_king the_enchantress))
    ;(not (hurt capital_rapunzel))

    ;(not (hurt capital_rapunzel))
    ;(not (hurt the_prince))
    ;(not (hurt the_enchantress))
    ;(not (hurt the_king))
    ;(not (hurt capital_rapunzels_father))
    ;(not (hurt capital_rapunzels_mother))
    
    ;(in the_enchantress garden)
    ;(in capital_rapunzel forest )
    ;(in capital_rapunzels_mother tower)
    ;(in capital_rapunzels_father tower)
    ;(in the_king garden)
    ;(has_ladder capital_rapunzels_mother)

    ;(hurt capital_rapunzel)
    ;(hurt the_prince)
    ;(hurt the_enchantress)
    ;(hurt the_king)
    ;(hurt capital_rapunzels_father)
    ;(hurt capital_rapunzels_mother)
)
)
)
