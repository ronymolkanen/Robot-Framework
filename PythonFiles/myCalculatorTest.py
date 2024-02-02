import unittest
import CalculatorUtils

class MyCalculatorTest(unittest.TestCase):
    def test_CalculateSumOfIntegers_A_and_B_AssignValueTo_C(self):
        ##Arrange
        a = int(4)
        b = int(5)

        ##Act
        result = CalculatorUtils.addition(a,b)

        ##Assert
        self.assertEqual(result, 9)

    def test_CalculateReminderOfIntegers_A_and_B_AssignValueTo_C(self):
        ##Arrange
        a = int(9)
        b = int(5)

        ##Act
        result = CalculatorUtils.subtraction(a,b)

        ##Assert
        self.assertEqual(result, 4)

    def test_CalculateProductOfIntegers_A_and_B_AssignValueTo_C(self):
        ##Arrange
        a = int(9)
        b = int(5)

        ##Act
        result = CalculatorUtils.multiplication(a,b)

        ##Assert
        self.assertEqual(result, 45)

    def test_CalculateQuotinentOfIntegers_A_and_B_AssignValueTo_C(self):
        ##Arrange
        a = int(10)
        b = int(5)

        ##Act
        result = CalculatorUtils.division(a,b)

        ##Assert
        self.assertEqual(result, 2)

if (__name__ == "__main__"):
    unittest.main()
