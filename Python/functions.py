def adder(a,b):
    return a+b

def subtractor(a,b):
    return a-b

while 1:
    choice = int(input("1. Add 2 numbers \n2. Subtract 2 numbers \n"))
    if choice == 1 or choice == 2 :
        break
    print("Invalid choice! \n")

num1 = int(input("Enter first number: "))
num2 = int(input("Enter second number: "))

if choice == 1:
    print(f"The sum is {adder(num1,num2)}.")

if choice == 2:
    print(f"The difference is {subtractor(num1,num2)}.")
