
print('From a while loop')
i = 0
while i < 10:
    print(i)
    i += 1

print('From a for loop')
for i in range(0, 10):
    print(i)

print('From a for loop')
for i in range(0, 10, 2):
    print(i)

print('From a for loop')
for i in range(10, -10, -1):
    print(i)

def f(a=2, b=1):
    return a + b

print(f())
print(f(12))
print(f(12, 89))
print(f(b=89))
print(f(a=89))

def prod(start, stop, mult):
    curr = start 
    while curr < stop:
        yield curr 
        curr *= mult  

for i in prod(2, 54, 2):
    print(i)

p = prod(2, 54, 2)
print(p)
print(next(p))
print(next(p))

xs = [1, 2, 3]
for x in xs:
    print(x)

print(xs)
xs[0] = 'Baz'
print(xs)

a_pair = (23, 'Tom')
#a_pair[0] = 'PHP is horrible'
print(a_pair)
age, name = a_pair
print(f'{name} is {age} years old')

xs = [1, 2, 3, 4, 5, 6, 7]
head, *other_thing = xs
print(head)
print(other_thing)
#print(tail)

print(xs[0])
print(xs[-5])

print(xs[2:5])
print(xs[2:])
print(xs[:-1])
print(list(reversed(xs)))
print(xs[0:-1:2])

ys = [3, 7, 2, 11, 100, 21, 19, 1.2]
print(sorted(ys))

incr = lambda x: x + 1
print(incr(23))

print(sorted(ys, reverse=True))

people = [(3,'James'), (7, 'John'), (2,'Doe'),
    (11, 'Marc'), (100, 'Sarah'), (21, 'Luke'), 
    (19, 'Joshua'), (1.2, 'Timothy')]
print(sorted(people, key=lambda x: x[0]))
print(sorted(people, key=lambda x: len(x[1])))
print(sorted(people, key=lambda x: x[0] + len(x[1]), reverse=True))

people1 = {
    'James': 3, 
    'John': 7,
    'Doe': 2323
}
print(people1['James'])
people1['Alice'] = 21
print(people1)
people1['Bob'] = {'Age': 20, 'Eye Color': 'Brown'}
print(people1)

for key, value in people1.items():
    print(key, 'has value', value)

x = set([1, 2, 3, 4, 2])
y = set([4, 5, 2, 100, 4])
print(x)
print(y)
print(x & y)
print(x | y)
print(x - y)
print(len(x - y))

print('Something' + 'Something')
print('Something' * 50)
print([1,2,3] * 10)

xs = [1,2,3,4,5]
print(list(map(lambda x: x + 1, xs)))
print(list(filter(lambda x: (x % 2) == 0, xs)))

import functools

xs = [1,2,3,4,5]
ans = functools.reduce(lambda x, y: x+y, xs)
print(ans)

import itertools
print(itertools.permutations(xs, 3))
for perm in itertools.permutations(xs, len(xs)):
    print(perm)

ys = ['A', 'B', 'C', 'D', 'E']
for ans in itertools.product(xs, ys):
    print(ans)

class Person(object):
    def __init__(self, name, age):
        self.name = name
        self.age = age 

    def __str__(self):
        return f'{self.name}: {self.age}'

    def increase_age(self, years=1):
        self.age += years

person1 = Person('Alice', 23)
print(person1)
person1.increase_age()
print(person1)

xs = [1,2,3]
xs.append(343443)
print(xs)

print(xs.pop())
del xs[1]
print(xs)
xs.remove(3)
print(xs)

s = 'james'
print(s.upper())
print(s.capitalize())

s = 'The dish ran away with the spoon'
ys = s.split()
print(ys)
print(s[0])
print(ys[0])
s1 = 'The,quick,brown,fox'
ys1 = s1.split(',')
print(s1)
print(ys1)

s2 = 'He didn\'t like do his like homework'
print(s2.split('like'))

x = int('23')
y = float('23')
print(x)
print(y)

c = 0b11 
print(c)

x = int('01010001', base=2)
print(x)

names = ["Alice", 'Bob', 'MewToo']
friends = ';'.join(names)
print(friends)

numbers = [1,2,3]
num = ''.join(map(str, numbers))
print(num)
print(int(num))

import numpy as np 
arr1 = np.array([1, 2, 3])
print(arr1)
print(arr1 * 10)

arr2 = np.array([
    [10, 20, 30],
    [-1, 0.5, 45.67],
    [3, 8, 6]
])

print(arr1 @ arr2)
print(arr2.transpose())
print(np.linalg.inv(arr2))
print(np.eye(10))
print(np.linalg.eig(arr2))
