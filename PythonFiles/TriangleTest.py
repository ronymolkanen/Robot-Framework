import unittest
import TriangleEngine

class TriangleTest(unittest.TestCase):
    def test_IsTriangle_Equilateral_(self):
        #Arrange
        kylki1 = 177
        kylki2 = 177
        kylki3 = 177
        expectedResult = 'Tasasivuinen kolmio'
        #Act
        result = TriangleEngine.resultOutput(kylki1, kylki2, kylki3)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_IsTriangle_EqualSided(self):
        #Arrange
        kylki1 = 2 
        kylki2 = 1
        kylki3 = 1
        expectedResult = 'Tasakylkinen kolmio'
        #Act
        result = TriangleEngine.resultOutput(kylki1, kylki2, kylki3)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_IsTriangle_Irregular(self):
        #Arrange
        kylki1 = 2 
        kylki2 = 1
        kylki3 = 3
        expectedResult = 'Epäsäännöllinen kolmio'
        #Act
        result = TriangleEngine.resultOutput(kylki1, kylki2, kylki3)
        #Assert
        self.assertEqual(result, expectedResult)

if (__name__ == "__main__"):
    unittest.main()

            # RONY MÖLKÄNEN