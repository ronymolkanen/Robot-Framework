def resultOutput(value):
    if (value % 3 == 0 and value % 5 == 0):
        return "FizzBuzz"
    elif (value % 3 == 0):
        return "Fizz"
    elif (value % 5 == 0):
        return "Buzz"
    
    return value