print("Howdy! How's it going? ")
tempr = int(input("What's the temperature outside? \n"))    

if 0 < tempr < 20:
    print(f"{tempr} degrees is cold! You need boots.")
elif(20 < tempr <= 30):
    print(f"{tempr} degrees is kinda chill! You need a coat.")
elif(30 < tempr <= 70):
    print(f"{tempr} degrees is cool! You need a jacket.")
elif(tempr >70):
    print(f"{tempr} degrees is a very nice weather")
else:
    print("You must be freezing")
