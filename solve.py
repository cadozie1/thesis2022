
import requests

def find_plan(domain_file, problem_file, plan_file):

    data = {'domain': open(domain_file, 'r').read(),
        'problem': open(problem_file, 'r').read()}

    resp = requests.post('http://solver.planning.domains/solve',
                     verify=False, json=data).json()

    if(resp['status'] == 'ok'):

        with open(plan_file, 'w') as f:
            f.write('\n'.join([act['name'] for act in resp['result']['plan']]))
    else:
        print("error")
