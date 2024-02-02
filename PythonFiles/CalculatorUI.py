import CalculatorUtils

#käyttäjä voi syöttää useita laskutoimituksia
#valitaan mikä laskutoimitus suoritetaan
#poikkeuskäsittely

operand = "start"

while operand != "exit":
    operand = input("Haluatko '+', '-', '*' vai '/' laskun? 'exit' lopettaa sovelluksen: ")

    if operand != "exit":
        if (operand == '+' or operand == '-' or operand == '*' or operand == '/'):
            number1Given = False
            number2Given = False
            
            while (not number1Given):
                try:
                    number1 = int(input("Anna 1. luku: "))
                    number1Given = True
                except Exception:
                    print("Antamasi syöte ei ole numero. Yritä uudestaan")

            while (not number2Given):
                try:
                    number2 = int(input("Anna 2. luku: "))
                    number2Given = True
                except Exception:
                    print("Antamasi syöte ei ole numero. Yritä uudestaan")

            match operand:
                case '+':
                    print(CalculatorUtils.addition(number1, number2))
                case '-':
                    print(CalculatorUtils.subtraction(number1, number2))
                case '*':
                    print(CalculatorUtils.multiplication(number1, number2))
                case '/':
                    print(CalculatorUtils.division(number1, number2))
        else:
            print("Virhe! Syötä '+', '-', '*' tai '/'.'exit' samumuttaa sovelluksen.")
    else:
        print("Kiitos kun käytit tätä sovellusta.")
