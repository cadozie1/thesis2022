# Examining Descriptiveness of Narratives Generated using Planning and Large Language Models
## Honors Thesis at Arizona State University Fall 2022
## Director: Dr. Maria Elena Chavez-Echeagaray
## Second Reader: Dr. Victor Benjamin

# Description
Branching off of the work of [TattleTale](https://icaps22.icaps-conference.org/workshops/SPARK/papers/spark2022_paper_2.pdf),
I thoerized that changing the descriptiveness of the input prompts would vary the descriptiveness 
of the resulting stories. As such, I wrote 9 PDDL descriptions for 3 children's foltales with 3 
variants of different descriptiveness. I then converted these plans using python from PDDL to
natural language prompts to feed to GPT-3. Then, I analyzed the GPT-3 output using spaCy to 
determine descriptiveness based on a metric I created. Finally, I automated the entire process
using a Bash script, and ran 5 iterations of 27 outputs. Overall, the work was inconclusive due
to GPT-3's inconsistent nature, and was rendered obsolete upon creation of ChatGPT with its
superior storytelling abilities. Further work would involve questioning whether LLMs can create
long-term dependencies with events that occurred long ago in a story.

# Abstract
Narrative generation is an important field due to the high demand for stories in video game design
and also in stories used in learning tools in the classroom. As these stories should contain depth,
it is desired for these stories to ideally be more descriptive. There are tools that help with the 
creation of these stories, such as planning, which requires a domain as input, or GPT-3, which 
requires an input prompt to generate the stories. However, other aspects to consider are the 
coherence and variation of stories. To save time and effort and create multiple possible stories,
we combined both planning and the Large Language Model (LLM) GPT-3 similar to how they were used 
in [TattleTale](https://icaps22.icaps-conference.org/workshops/SPARK/papers/spark2022_paper_2.pdf)
to generate such stories while examining whether descriptive input prompts to GPT-3 affect the 
outputted stories. The stories generated are readable to the general public and overall, the
prompts do not consistently affect descriptiveness of outputs across all stories tested. For
this work, three stories with three variants each were created and tested for descriptiveness. 
To do so, adjectives, adverbs, prepositional phrases, and suboordinating conjunctions were 
counted using Natural Language Processing (NLP) tool spaCy for Part Of Speech (POS) tagging.
This work has shown that descriptiveness is highly correlated with the amount of words in the
story in general, so running GPT-3 to obtain longer stories is a feasible option to consider in 
order to obtain more descriptive stories. The limitations of GPT-3 have an impact on the 
descriptiveness of resulting stories due to GPT-3's inconsistency and transformer architecture, 
and other methods of narrative generation such as simple planning could be more useful.
