import unittest
import RockPaperScissorsEngine

class RockPaperScissorsTest(unittest.TestCase):
    def test_Rock_Vs_Paper_Paper_Should_Win(self):
        ##Arrange
        player_choise = 'rock'
        computer_choise = 'paper'
        exceptedResult = 'Computer won!'

        ##Act
        result = RockPaperScissorsEngine.winnerOfTheGame(player_choise, computer_choise)

        ##Assert
        self.assertEqual(result, exceptedResult)

    def test_Scissors_Vs_Paper_Scissors_Should_Win(self):
        ##Arrange
        player_choise = 'scissors'
        computer_choise = 'paper'
        exceptedResult = 'You won!'

        ##Act
        result = RockPaperScissorsEngine.winnerOfTheGame(player_choise, computer_choise)

        ##Assert
        self.assertEqual(result, exceptedResult)

    def test_Rock_Vs_Scissors_Scissors_Should_Win(self):
        ##Arrange
        player_choise = 'rock'
        computer_choise = 'scissors'
        exceptedResult = 'You won!'

        ##Act
        result = RockPaperScissorsEngine.winnerOfTheGame(player_choise, computer_choise)

        ##Assert
        self.assertEqual(result, exceptedResult)

if (__name__ == "__main__"):
    unittest.main()

        # RONY MÖLKÄNEN