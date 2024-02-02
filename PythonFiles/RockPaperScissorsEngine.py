def winnerOfTheGame(player_choise, computer_choise):
    if (player_choise == computer_choise):
        return "It's a draw!"
    elif (player_choise == "rock" and computer_choise == "scissors"):
        return "You won!"
    elif (player_choise == "paper" and computer_choise == "rock"):
        return "You won!"
    elif (player_choise == "scissors" and computer_choise == "paper"):
        return "You won!"
    else:
        return "Computer won!"
    
        # RONY MÖLKÄNEN