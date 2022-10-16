import spacy
import gpt3

nlp = spacy.load("en_core_web_sm")

def descriptiveStats(filename):
    print("Stats for \"" + filename + "\":")
    text = open(filename).read()

    doc = nlp(text)



    sentences = [sent.text for sent in doc.sents]

    #1) number of sentences
    print("Number of sentences:", end= " ")
    print(len(sentences))

    #2) number of tokens
    print("Number of tokens:", end=" ")
    numTokens = len([token.text for token in doc])
    print(numTokens)

    #3/ number of token per sentence
    print("Average number of tokens per sentence", end = " ")
    sum_tokens = 0
    for sent in doc.sents:
        sum_tokens += len([token.text for token in sent])
    print("%4.2f" % (sum_tokens / len(sentences)))


    adjectiveFrequency = 0
    adverbFrequency = 0
    prepSubConjFrequency = 0

    tagFrequency = dict() 
    for token in doc:
        if token.tag_ == 'JJ' or token.tag_ == 'JJR' or token.tag_ == 'JJS':
            adjectiveFrequency += 1
        elif token.tag_ == 'RB' or token.tag_ == 'RBR' or token.tag_ == 'RBS':
            adverbFrequency += 1
        elif token.tag_ == 'IN':
            prepSubConjFrequency += 1


    print("Adjectives: \t \t %20d" % adjectiveFrequency)
    print("Adverbs:    \t \t %20d" % adverbFrequency)
    print ("Prepositions/Subordinating Conjuctions: %5d " % prepSubConjFrequency)
    print("Total:      \t \t %20d" % (adjectiveFrequency + adverbFrequency + prepSubConjFrequency))
    print("\n")

def main():
    descriptiveStats("story.txt")
    descriptiveStats("story2.txt")

    gpt3.complete("story.txt", "story_gpt3.txt", "text-davinci-002", 256, 0.7)
    gpt3.complete("story2.txt", "story2_gpt3.txt", "text-davinci-002", 256, 0.7) 

    descriptiveStats("story_gpt3.txt")
    descriptiveStats("story2_gpt3.txt") 




if __name__ == "__main__":
    main()
