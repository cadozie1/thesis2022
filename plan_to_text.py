import solve
import gpt3
import stats

def actionToText(action, storyNum):
    #rapunzel
    action_name = action[0]
    if storyNum == 0:
        if action_name == "climb_tower":
            return action[1].capitalize() + " climbs the tower with the help of " + action[2] + ". "
        elif action_name == "walk":
            return action[1].capitalize() + " walks from the " + action[2] + " to the " + action[3] + ". "
        elif action_name == "grow_hair":
            return "After years of waiting, " + action[1] + "'s hair grows out. "
        elif action_name == "descend_tower":
            return action[1].capitalize()+ " descends the tower with the help of " + action[2] + ". "
        elif action_name == "jump_down_tower":
            return action[1].capitalize() + " has no way down, so " + action[1] + " jumps off the tower. "
        elif action_name == "climb_up_ladder":
            return action[1].capitalize() + " uses the ladder to climb up the tower. "
        elif action_name == "climb_up_hair":
            return action[1].capitalize() + " uses the cut hair to climb up the tower. "
        elif action_name == "climb_down_ladder":
            return action[1].capitalize() + " uses the ladder to climb down the ladder. "
        elif action_name == "climb_down_hair":
            return action[1].capitalize() + " uses the cut hair to climb down the tower. "
        elif action_name == "serenade":
            return action[1].capitalize() + " sings, serenading everyone around. "
        elif action_name == "sweet_talk":
            return action[1].capitalize() + " sweet talks " + action[2] + ". "
        elif action_name == "cut_hair":
            return action[1].capitalize() + " cuts " + action[2] + "'s hair. "
        elif action_name == "marry":
            return action[1].capitalize() + " marries " + action[2] + ". "
        elif action_name == "give_ladder":
            return action[1].capitalize() + " gives the ladder to " + action[2] + ". "

    elif storyNum == 1:
        if action_name == "walk":
            return action[1].capitalize() + " walks from the " + action[2] + " to the " + action[3] + ", and all friends of " + action[1] + " that are awake nearby follow. "
        elif action_name == "rest":
            return action[1].capitalize() + " rests in the " + action[2] + ". "
        elif action_name == "talk":
            return action[1].capitalize() + " talks to " + action[2] + ". "
        elif action_name == "pick_up":
            return action[1].capitalize() + " picks up the " + action[2] + " in the " + action[3] + ". "
        elif action_name == "give":
            return action[1].capitalize() + " gives the " + action[3] + " to " + action[2] + ". "
        elif action_name == "drop":
            return action[1].capitalize() + " drops the " + action[2] + " in the " + action[3] + ". "
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

def do_everything(initial_prompt, domain, problem, plan, gpt3_r, gpt3_w, storyNum):
    f = open(gpt3_r, "w")
    with open(initial_prompt) as prompt:
        f.write(prompt.read())
    f.write("\nHere is the sequence of actions that the story should follow:\n\n")
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
        f = open(gpt3_r, "a")
        action_text = actionToText(action, storyNum)
        f.write(action_text)
        f.close()

    f = open(gpt3_r, "a")
    f.write("\n\nParaphrase the story with as few words from the original text as possible:\n\n")
    f.close()

    gpt3.complete(gpt3_r, gpt3_w, "text-davinci-002", 256, 0.9)
        #f = open(gpt3_w, "a")
        #f.write(action_text)
        #f.close()

        #gpt3.complete(gpt3_r, gpt3_w, "text-davinci-002", 40, 0.7)
        #f = open(gpt3_w, "a")
        #f.write(". ")
        #f.close()

        #f = open(gpt3_r, "a")
        #with open(gpt3_w, "r") as write_text:
        #    f.write(write_text.readlines()[-1])



    stats.descriptiveStats(gpt3_w)
        

def main():
    do_everything("rapunzel_prompt.txt", "rapunzel_domain.pddl", "rapunzel_problem.pddl", "rapunzel_plan.ipc", "rapunzel_gpt3_read.txt", "rapunzel_gpt3_write.txt", 0)
#    do_everything("golden_nugget_prompt.txt", "golden_nugget_domain.pddl", "golden_nugget_problem.pddl", "golden_nugget_plan.ipc", "golden_nugget_gpt3_read.txt", "golden_nugget_gpt3_write.txt", 1)

#    solve.find_plan("golden_nugget_domain.pddl", "golden_nugget_problem.pddl", "golden_nugget_plan.ipc")
#    for action in planFileToActions("golden_nugget_plan.ipc"):
#        print(actionToText(action, 1))


if __name__ == "__main__":
    main()
