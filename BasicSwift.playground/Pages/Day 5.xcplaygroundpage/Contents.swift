//: [Previous](@previous)

import Foundation


//MARK:Functions

func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""

    print(message)
}
printHelp()

//MARK:Accepting parameters

func square(number: Int) {
    print(number * number)
}

func check(age: Int) {
    if age >= 18 {
        print("You're an adult.")
    } else {
        print("You're a minor.")
    }
}
check(age: 18)

func buyCar(price: Int) {
    switch price {
    case 0...20_000:
        print("This seems cheap.")
    case 20_001...50_000:
        print("This seems like a reasonable car.")
    case 50_001...100_000:
        print("This had better be a good car.")
    default:
        print("")
    }
}

func isEveryoneAdult(ages: [Int]) -> Bool {
    for age in ages {
        if age < 18 {
            return false
        }
    }
    return true
}
isEveryoneAdult(ages: [10, 20, 16, 24])

//MARK:Parameter labels

func isPassingGrade(for scores: [Int]) -> Bool {
    var total = 0
    for score in scores {
        total += score
    }
    if total >= 500 {
        return true
    } else {
        return false
    }
}

func countDown(from start: Int) {
    var current = start
    while current >= 0 {
        print("\(current)...")
        current -= 1
    }
}
countDown(from: 10)

//MARK:Omitting parameter labels

func greet(_ person: String) {
    print("Hello, \(person)!")
}
greet("Kuldeep")

func formatLength(length length: Int) {
    print("That measures \(length)cm.")
}
formatLength(length: 95)

//MARK:Default parameter

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

func parkCar(_ type: String, automatically: Bool = true) {
    if automatically {
        print("Nice - my \(type) parked itself!")
    } else {
        print("I guess I'll have to do it.")
    }
}
parkCar("Tesla")


//MARK:Variadic functions

/*
 Some functions are variadic, which is a fancy way of saying they accept any number of parameters of the same type. The print() function is actually variadic: if you pass lots of parameters, they are all printed on one line with spaces between them:
 
 print("Haters", "gonna", "hate")

 */

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5)

//MARK:Writing throwing functions

enum PlayError: Error {
    case cheating
    case noPlayers
}
func playGame(name: String, cheat: Bool = false) throws {
    if cheat {
        throw PlayError.cheating
    } else {
        print("Let's play a game of \(name)...")
    }
}

//MARK:Running throwing functions
/*
 Throwing function we must use do and catch block
 
 */

/*
 MARK:inout parameters
 All parameters passed into a Swift function are constants, so you can’t change them. If you want, you can pass in one or more parameters as inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function.

 For example, if you want to double a number in place – i.e., change the value directly rather than returning a new one – you might write a function like this:
 */

func doubleInPlace(number: inout Int) {
    number *= 2
    print(number)
}
var myNum = 10
print(doubleInPlace(number: &myNum))

//For change the let contanst we can change use inout keyword in swift
//func addTen(num:Int){
//    num *= 2
//
//}

func play(games: String...) {
    for game in games {
        print("Let's play \(game)!")
    }
}
play(games: "Chesshjknljhg jhbhjbjd ")

//: [Next](@next)
