import openai
import requests
import time

ONE_MINUTE = 60
MAX_COMPLETIONS_PER_MINUTE = 58 

openai.api_key = "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"

#@sleep_and_retry
#@limits(calls=MAX_COMPLETIONS_PER_MINUTE, period=ONE_MINUTE)
#@limits(calls=MAX_COMPLETIONS_PER_MINUTE, period=timedelta(seconds=60).total_seconds())
def complete(filename_read, filename_write, model_type, num_max_tokens, temp):
    text = open(filename_read).read()
    time.sleep(1)
    completion = openai.Completion.create(
        model=model_type,
        prompt=text,
        max_tokens=num_max_tokens,
        temperature=temp,
 #       frequency_penalty=0.9,
 #       presence_penalty=0.1,
        #stop=[".", ".\n"]
    )

    result = (completion.choices[0].text)
#    print(result)
    write_file = open(filename_write, "a")
    write_file.write(result)
    write_file.close()




