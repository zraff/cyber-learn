my_list = ["item1", "item2", "item3", "item4", "item5"]

for i in my_list:
    print(i)


is_bugged = True

while is_bugged:
    conti = input("Continue running loop? [y/n]")
    if conti == "n":
        break
    
