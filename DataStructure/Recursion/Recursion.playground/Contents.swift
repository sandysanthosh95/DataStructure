import UIKit


func factorial(_ value: Int) -> Int {
    if value == 0 {
        return 1
    }
    return value * factorial(value - 1)
}

print(factorial(4))


func power(number: Int, n: Int) -> Int {
    if n == 0 {
        return 1
    }
    
    return number * power(number: number, n: n - 1)
}

print(power(number: 2, n: 3))
