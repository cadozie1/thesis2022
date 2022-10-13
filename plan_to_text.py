#!/usr/bin/env python

import solve
import gpt3
import stats
import sys


def actionToText(action, storyNum):
    #rapunzel
    action_name = action[0]
    if storyNum == 0:
        if action_name == "climb_tower":
            return action[1].capitalize() + " climbs the tower with the help of " + action[2] + ".\n"
        elif action_name == "walk":
            return action[1].capitalize() + " walks from the " + action[2] + " to the " + action[3] + ".\n"
        elif action_name == "grow_hair":
            return "After years of waiting, " + action[1] + "'s hair grows out.\n"
        elif action_name == "descend_tower":
            return action[1].capitalize()+ " descends the tower with the help of " + action[2] + ".\n"
        elif action_name == "jump_down_tower":
            return action[1].capitalize() + " has no way down, so " + action[1] + " jumps off the tower.\n"
        elif action_name == "climb_up_ladder":
            return action[1].capitalize() + " uses the ladder to climb up the tower.\n"
        elif action_name == "climb_up_hair":
            return action[1].capitalize() + " uses the cut hair to climb up the tower.\n"
        elif action_name == "climb_down_ladder":
            return action[1].capitalize() + " uses the ladder to climb down the ladder.\n"
        elif action_name == "climb_down_hair":
            return action[1].capitalize() + " uses the cut hair to climb down the tower.\n"
        elif action_name == "serenade":
            return action[1].capitalize() + " sings, serenading everyone around.\n"
        elif action_name == "sweet_talk":
            return action[1].capitalize() + " sweet talks " + action[2] + ".\n"
        elif action_name == "cut_hair":
            return action[1].capitalize() + " cuts " + action[2] + "'s hair.\n"
        elif action_name == "marry":
            return action[1].capitalize() + " marries " + action[2] + ".\n"
        elif action_name == "give_ladder":
            return action[1].capitalize() + " gives the ladder to " + action[2] + ".\n"

    elif storyNum == 1:
        if action_name == "walk":
            return action[1].capitalize() + " walks from the " + action[2] + " to the " + action[3] + ", and all friends of " + action[1] + " that are awake nearby follow.\n"
        elif action_name == "rest":
            return action[1].capitalize() + " rests in the " + action[2] + ".\n"
        elif action_name == "talk":
            return action[1].capitalize() + " talks to " + action[2] + ".\n"
        elif action_name == "pick_up":
            return action[1].capitalize() + " picks up the " + action[2] + " in the " + action[3] + ".\n"
        elif action_name == "give":
            return action[1].capitalize() + " gives the " + action[3] + " to " + action[2] + ".\n"
        elif action_name == "drop":
            return action[1].capitalize() + " drops the " + action[2] + " in the " + action[3] + ".\n"
    elif storyNum == 2:
        if action_name == "move":
            return action[1] + " moves from the " + action[2] + " to the " + action[3] + ", accompanied by anyone travelling with " + action[1] + ".\n"
        elif action_name == "trick":
            return action[1] + " tricks " + action[2] + ".\n"
        elif action_name == "move_together":
            return action[1] + " and " + action[2] + " start travelling together.\n"
        elif action_name == "eat_heart":
            return action[1] + " eats " + action[2] + "'s heart since " + action[2] + " was tricked twice.\n"

    #else:

def planFileToActions(planfile):
    with open(planfile) as f:
        lines = [line.lstrip("(").rstrip(")\n") for line in f]

    actions = []
    for line in [line.split() for line in lines]:
        newline = [line[0]] 
        for word in line[1:]:
            if "capital_" in word:
                word=word[8:].capitalize()
            newline.append(word.replace('_', ' '))
        actions.append(newline)

    return actions 

def main(): 
    initial_prompt = sys.argv[1]
    domain = sys.argv[2]
    problem = sys.argv[3]
    plan = sys.argv[4]
    gpt3_r = sys.argv[5]
    gpt3_w = sys.argv[6]
    storyNum = int(sys.argv[7])

    print("Here's the initial prompt:")
    stats.descriptiveStats(initial_prompt)

    f = open(gpt3_r, "w")
    with open(initial_prompt) as prompt:
        f.write(prompt.read())
    #f.write("\nHere is the sequence of actions that the story should follow:\n\n")
    f.close()
    #gpt3.complete(gpt3_r, gpt3_r, "text-davinci-002", 40, 0.7) 
#    f = open(gpt3_r, "w")
#    with open(gpt3_w) as written_text:
#        f.write(written_text.read())
#    f.close()

    solve.find_plan(domain, problem, plan)
    #f = open(gpt3_w, "w")
    #f.close()
    for action in planFileToActions(plan):
        f = open(gpt3_r, "w")
        f.write("\nHere is the next action in the story:\n")
        action_text = actionToText(action, storyNum)
        f.write(action_text)
        f.close()

        f = open(gpt3_r, "a")
        f.write("\n\nParaphrase that action in different, more elaborate words:\n")
        f.close()

        gpt3.complete(gpt3_r, gpt3_w, "text-davinci-002", 256, 0.9)
        #f = open(gpt3_r, "a")
        #with open(gpt3_r, "r") as write_text:
        #    f.write(action_text)
        #f.close()


        #f = open(gpt3_w, "a")
        #f.write(action_text)
        #f.close()

        #gpt3.complete(gpt3_r, gpt3_w, "text-davinci-002", 40, 0.7)
        #f = open(gpt3_w, "a")
        #f.write(".\n")
        #f.close()

        #f = open(gpt3_r, "a")
        #with open(gpt3_w, "r") as write_text:
        #    f.write(write_text.readlines()[-1])



        
    stats.descriptiveStats(gpt3_w)

    #do_everything("rapunzel_prompt.txt", "rapunzel_domain.pddl", "rapunzel_problem.pddl", "rapunzel_plan.ipc", "rapunzel_gpt3_read.txt", "rapunzel_gpt3_write.txt", 0)
#    do_everything("golden_nugget_prompt.txt".\n"golden_nugget_domain.pddl".\n"golden_nugget_problem.pddl".\n"golden_nugget_plan.ipc".\n"golden_nugget_gpt3_read.txt".\n"golden_nugget_gpt3_write.txt", 1)
#    do_everything("monkey_heart_prompt.txt", "monkey_heart_domain.pddl", "monkey_heart_problem.pddl", "monkey_heart_plan.ipc", "monkey_heart_gpt3_read.txt", "monkey_heart_gpt3_write.txt", 2)

#    solve.find_plan("golden_nugget_domain.pddl".\n"golden_nugget_problem.pddl".\n"golden_nugget_plan.ipc")
#    for action in planFileToActions("golden_nugget_plan.ipc"):
#        print(actionToText(action, 1))


if __name__ == "__main__":
    main()
