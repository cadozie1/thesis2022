(define (problem gold_nugget) (:domain gold_nugget_story)
(:objects
    capital_ki_wu - person
    capital_pao_shu - person
    the_countryman - person
    city - location
    pine_forest - location
    grove - location
    stream - location
    pathway - location
    spring - location
    gold_nugget - nugget
    second_gold_nugget - nugget2
    copper - copper_obj 
    snake - snake_obj
)
(:init
    (friends capital_ki_wu capital_pao_shu)
    (friends capital_pao_shu capital_ki_wu)
    (in capital_ki_wu city)
    (in capital_pao_shu city)
    (virtuous capital_ki_wu)
    (virtuous capital_pao_shu)
    (not (virtuous the_countryman))
    (tired capital_ki_wu)
    (tired capital_pao_shu)
    (has_snake pathway)
    (resting the_countryman spring) 
    (in the_countryman spring)
    (holds_object capital_ki_wu copper)

    (has_object pathway gold_nugget)
    (has_object pathway second_gold_nugget)
    (has_object pathway snake)
    (has_nugget pathway)
    (has_nugget2 pathway)
    (hidden_nugget pathway)
    (hidden_snake pathway)

    (connected city grove)
    (connected grove stream)
    (connected stream pathway)
    (connected pathway spring)
    (connected spring pathway)
    (connected pathway stream)
    (connected stream grove)
    (connected grove city)
)
(:goal (and
    ;(virtuous capital_ki_wu)
    ;(virtuous capital_pao_shu)
    ;(in capital_pao_shu pathway)
    ;(not (resting the_countryman spring))
    ;(not (tired capital_ki_wu))
    ;(in capital_ki_wu pathway)
    ;(in capital_pao_shu pathway)
    ;(not (tired capital_pao_shu))
    ;(holds_object capital_ki_wu gold_nugget)
    ;(holds_object capital_pao_shu second_gold_nugget)
    ;(not (has_nugget pathway))
    ;(not (has_nugget2 pathway)                  
    
    ;they decide to rest in the stream instead
    (not (virtuous capital_ki_wu))
    (not (virtuous capital_pao_shu))                     
    (virtuous the_countryman)
    (in capital_ki_wu stream)                        
    (in capital_pao_shu pathway)                      
    (resting capital_ki_wu stream)
    (resting capital_pao_shu pathway)
))
)

