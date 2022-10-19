#!/bin/bash
# need to add vairant folders later

do_everything()
{
    STORY_FOLDER=$1
    STORY_NUM=$2
    ITERATIONS=$3
    START_INDEX=$4

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

        for ((i=START_INDEX; i <=${ITERATIONS}+START_INDEX-1; i++))
        do
            gpt3_w_file="./output/${story_name}_${name}_${i}.txt"
            #try to remove write file so we don't end up appending at end
            if [ -f "${gpt3_w_file}" ]; then
                rm "${gpt3_w_file}"
            fi
            
            ./plan_to_text.py "${prompt_file}" "${domain_file}" "${problem_file}" "${plan_file}" "${gpt3_r_file}" "${gpt3_w_file}" "${STORY_NUM}" 

        done

    done
}
ARG4=${4:-1}
echo "folder: $1"
echo "Story: $2"
echo "Iterations: $3"
echo "Starting Index: ${ARG4}"
do_everything $1 $2 $3 ARG4

