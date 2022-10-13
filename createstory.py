class Type:
    def __init__(self, name=""):
        self.name = name
    def set_name(self, name):
        self.name = name
    def set_predicate(self, attribute_name, value):
        self.predicates[attribute_name] = value

class Character(Type):
class Object(Type):
class Location(Type):

class Predicate:
    def __init__(self, name="", parameters=[]):
        self.name = name
        self.parameters = parameters
    def set_name(self, name):
        self.name = name
    def add_parameter(self, parameter):
        self.parameters.append(parameter)
    def set_parameters(self, parameters):
        self.parameters = parameters

class Action:
    def __init__(self, name="", parameters=[], preconditions=[], effects=[]):
        self.name = name
        self.parameters = parameters
        self.preconditions = preconditions
        self.effects = effects
    def set_name(self, name):
        self.name = name
    def set_parameters(self, parameters):
        self.parameters = parameters
    def add_parameter(self, parameter):
        self.parameters.append(parameter)
    def add_precondition(self, precondition):
        self.preconditions.append(precondition)
    def add_effect(self, effect):
        self.effects.append(effect)

class ObjectDefinition:
    def __init__(self, object_name, object_type):
        self.object_name = object_name
        self.boject_type = object_type
class Objects:
    def __init__(self, object_list=[]):
        self.object_list = object_list
    def add_object(self, object_name, object_type):
        new_object = ObjectDefinition(object_name, object_type) 
        self.object_list.append(new_object)
class Init:
    def __init__(self, predicates=[]):
        self.predicates = predicates
    def set_predicates(self, predicates):
        self.predicates = predicates
    def add_predicate(self, predicate):
        self.predicates.append(predicate)

class Goal:
    def __init__(self, and_needed=False, predicates=[]):
        self.and_needed = and_needed
        self.predicates = predicates
    def set_goals(self, predicates):
        self.predicates = predicates
        if (len(self.predicates) > 1) && (and_needed == False):
            and_needed = True
    def add_goal(self, predicate):
        self.predicates.append(predicate)
        if (len(self.predicates) > 1) && (and_needed == False):
            and_needed = True

class Domain:
    def __init__(self, filename="domain.pddl", ):
        self.filename = filename

class Problem:
    def __init__(self, filename="problem.pddl", domain, objects=[], init = [], goal = [])
            self.filename = filename
            self.domain = domain
            self.objects = objects
            self.init = init
            self.goal = goal
    def set_domain(self, domain):
        self.domain = domain
    def add_object(self, object_name, object_type):
        od = ObjectDefinition(object_name, object_type)
    def set_objects(self, object_list):
        for obj in obj_list:
            self.objects.add_object(obj, obj_list[obj])
    def add_init(self, pred
    def set_init(self, predicate_list):
        self.init.set_predicates(predicate_list)

