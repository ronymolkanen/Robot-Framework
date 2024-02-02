import unittest
import AgeVerifier

class AgeTest(unittest.TestCase):
    def test_Onko_A_Lapsi(self):
        #Arrange
        a = int(7)

        #Act
        result = AgeVerifier.verifyAge(a)

        #Assert
        self.assertEqual(result, "Olet lapsi.")

    def test_Onko_A_Aikuinen(self):
        #Arrange 
        a = int(20)

        #Act
        result = AgeVerifier.verifyAge(a)

        #Assert
        self.assertEqual(result, "Olet aikuinen.")


    def test_Onko_A_Elakelainen(self):
        #Arrange
        a = int(77)

        #Act
        result = AgeVerifier.verifyAge(a)

        #Assert
        self.assertEqual(result, "Olet eläkeläinen.")

if (__name__ == "__main__"):
    unittest.main()