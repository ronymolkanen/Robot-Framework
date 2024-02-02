import unittest
import FizzBuzzEngine

class MyFizzBuzzTest(unittest.TestCase):
    def test_Send_1_To_FizzBuzzEngine_Result_1(self):
        #Arrange
        value = int(1)
        expectedResult = int(1)
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_Send_2_To_FizzBuzzEngine_Result_2(self):
        #Arrange
        value = int(2)
        expectedResult = int(2)
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_Send_3_To_FizzBuzzEngine_Result_Fizz(self):
        #Arrange
        value = int(3)
        expectedResult = 'Fizz'
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_Send_4_To_FizzBuzzEngine_Result_4(self):
        #Arrange
        value = int(4)
        expectedResult = int(4)
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_Send_5_To_FizzBuzzEngine_Result_Buzz(self):
        #Arrange
        value = int(5)
        expectedResult = 'Buzz'
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_Send_6_To_FizzBuzzEngine_Result_Fizz(self):
        #Arrange
        value = int(6)
        expectedResult = 'Fizz'
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)
    
    def test_Send_7_To_FizzBuzzEngine_Result_7(self):
        #Arrange
        value = int(7)
        expectedResult = int(7)
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_Send_9_To_FizzBuzzEngine_Result_Fizz(self):
        #Arrange
        value = int(9)
        expectedResult = 'Fizz'
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_Send_10_To_FizzBuzzEngine_Result_Buzz(self):
        #Arrange
        value = int(10)
        expectedResult = 'Buzz'
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_Send_12_To_FizzBuzzEngine_Result_Fizz(self):
        #Arrange
        value = int(12)
        expectedResult = 'Fizz'
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_Send_15_To_FizzBuzzEngine_Result_FizzBuzz(self):
        #Arrange
        value = int(15)
        expectedResult = 'FizzBuzz'
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_Send_30_To_FizzBuzzEngine_Result_FizzBuzz(self):
        #Arrange
        value = int(30)
        expectedResult = 'FizzBuzz'
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

    def test_Send_60_To_FizzBuzzEngine_Result_FizzBuzz(self):
        #Arrange
        value = int(60)
        expectedResult = 'FizzBuzz'
        #Act
        result = FizzBuzzEngine.resultOutput(value)
        #Assert
        self.assertEqual(result, expectedResult)

if (__name__ == "__main__"):
    unittest.main()
        