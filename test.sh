#!/bin/bash
# need to add vairant folders later
RAPUNZEL_FOLDER="./rapunzel"
GOLDEN_NUGGET_FOLDER="./golden_nugget"
MONKEY_HEART_FOLDER="./monkey_heart"

do_everything()
{
    STORY_FOLDER=$1
    STORY_NUM=$2
    ITERATIONS=$3

    NEWLINE=$'\n'
    echo "Working on story: ${STORY_FOLDER}...${NEWLINE}"


    PROMPT_FOLDER="${STORY_FOLDER}/prompts"

    for prompt_file in $(find "${PROMPT_FOLDER}" -type f -name "*.txt" | sort); do
        name=`basename ${prompt_file} .txt`
        echo "${name}"
        problem_file=${STORY_FOLDER}/pddl/problem.pddl
        domain_file=${STORY_FOLDER}/pddl/domain.pddl
        plan_file=${STORY_FOLDER}/pddl/plan.ipc
        gpt3_r_file=${STORY_FOLDER}/gpt3/${name}_r.txt

        story_name=`basename ./${STORY_FOLDER} `

        for ((i=1; i <= ${ITERATIONS}; i++))
        do
            gpt3_w_file="./output/${story_name}_${name}_${i}.txt"
            #try to remove write file so we don't end up appending at end
            if [ -f "${gpt3_w_file}" ]; then
                rm "${gpt3_w_file}"
            fi
            
            ./plan_to_text.py "${prompt_file}" "${domain_file}" "${problem_file}" "${plan_file}" "${gpt3_r_file}" "${gpt3_w_file}" "${STORY_NUM}" 

            sleep 10 &
        done

    done
}

do_everything "./rapunzel" 0 $1
do_everything "./golden_nugget" 1 $1
do_everything "./monkey_heart" 2 $1

