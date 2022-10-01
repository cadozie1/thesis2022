#!/bin/bash
# need to add vairant folders later
RAPUNZEL_FOLDER="./rapunzel"
GOLDEN_NUGGET_FOLDER="./golden_nugget"
MONKEY_HEART_FOLDER="./monkey_heart"

do_everything()
{
    STORY_FOLDER=$1
    STORY_NUM=$2

    NEWLINE=$'\n'
    echo "Working on story: ${STORY_FOLDER}...${NEWLINE}"


    PROMPT_FOLDER="${STORY_FOLDER}/prompts"

    for prompt_file in $(find "${PROMPT_FOLDER}" -type f -name "*.txt" | sort); do
        name=`basename ${prompt_file} .txt`
        echo "${name}"
        problem_file=${STORY_FOLDER}/pddl/problem.pddl
        echo "${problem_file}"
        domain_file=${STORY_FOLDER}/pddl/domain.pddl
        plan_file=${STORY_FOLDER}/pddl/plan.ipc
        gpt3_r_file=${STORY_FOLDER}/gpt3/${name}_r.txt
        gpt3_w_file=${STORY_FOLDER}/gpt3/${name}_w.txt
        
        ./plan_to_text.py "${prompt_file}" "${domain_file}" "${problem_file}" "${plan_file}" "${gpt3_r_file}" "${gpt3_w_file}" "${STORY_NUM}" 

    done
}

do_everything "./rapunzel" 0
sleep 20 &
do_everything "./golden_nugget" 1
sleep 20 &
do_everything "./monkey_heart" 2
sleep 20 &
