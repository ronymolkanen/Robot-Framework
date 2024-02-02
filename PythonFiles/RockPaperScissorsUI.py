import RockPaperScissorsEngine
import random

player_choise = "start"

while player_choise !="exit":

    player_choise = (input("Make a choise: rock, paper or scissors. Enter 'exit' if you want stop playing. \n"))

    if player_choise != "exit":
        if (player_choise == 'rock' or player_choise == 'paper' or player_choise == 'scissors'):
            computer_choiseOptions = ["rock", "paper", "scissors"]
            computer_choise = random.choice(computer_choiseOptions)

            print("Player chose: " + player_choise)
            print("Computer chose: " + computer_choise)

            result = RockPaperScissorsEngine.winnerOfTheGame(player_choise, computer_choise)
            print(result)
        else:
            print("ERROR! Enter 'rock', 'paper' or 'scissors'")
else:
    print("Thanks for playing!")

        # RONY MÖLKÄNEN