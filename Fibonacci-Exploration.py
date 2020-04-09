# Submitter: Kennon Stewart
# Homework 3

# Question 1
def isItTrue(n):
    for i in range(3,n+3):
        print(fibonacci(i)>(fibonacci(i-2))**2)


def fSum(n):
    sum = 0
    L = []
    count = 0
    for i in range(0,n+1):
        L.append(fibonacci(i))
        count = count + fibonacci(i)
    print(count)


def parity(n):
    for i in range(0,n+1):
        if (fibonacci(i)%2) == 0:
            print("even")
        else:
            print("odd")
# Question 2

def P(n,k): # This is the simple P(n,k) function described in the homework
    count = 0
    L = []
    B = Subsets(Set(range(1,n+1)))
    for i in B:
        L.append(i)
    for j in L:
        if j.cardinality() == k:
            count = count + 1
    return(count)
def ultP(n): # This function returns the number of sets with cardinality k for every k in between 0 and n
    L = []
    count = 0
    for i in range(0,n+1):
        L.append(P(n,i))
    for i in L:
        if i % 2 == 0:
            count = count + 1
    if count == Set(L).cardinality():
        print(count)
    print(L)

# The output of ultP are the rows of Pascal's triangle
def sumP2(n):
    k = 0
    sigma = 0
    while k < n+1:
        k = k + 1
        sigma = sigma + P(n-k-1,k)
    print(sigma)
def simSum(n):
    k = 0
    sigma = 0
    while k < n+1:
        k = k + 1
        sigma = sigma + P(n,k)
    print(sigma)
def sumP(n):
    k = 0
    sigma = 0
    while k < n+1:
        k = k + 1
        sigma = sigma + (k * P(n,k))
    print(sigma)
R1 = []
R2 = []
R3 = []
def residue(l):
    for n in range(0,l+1):
        PS = Subsets(Set(range(1,n+1)))
        for k in range(0,n+1):
            count = 0
            for x in PS:
                if x.cardinality()==k:
                    count = count+1
            if count%3==1:
                R1.append((n,k))
            if count%3==2:
                R2.append((n,k))
            if count%3==0:
                R3.append((n,k))
residue(15)
points(R1, color='red') + points(R2, color='blue') + points(R3, color='orange')
points(R1, color='red')
points(R2, color='blue')
points(R3, color='orange')
print(R1)
print(R2)
print(R3)
