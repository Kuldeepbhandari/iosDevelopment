//: [Previous](@previous)

import Foundation


//MARK:Creating basic closures

let driving = {
    print("I'm driving in my car")
}

// MARK:Accepting parameters in a closure

let driving1 = { (name:String) in
    print("driver name is \(name)")
}

driving1("London")

var sendMessage = { (message: String) in
    if message != "" {
        print("Sending to Twitter: \(message)")
    } else {
        print("Your message was empty.")
    }
}

var shareWinnings = { (amount: Double) in
    let half = amount / 2.0
    print("It's \(half) for me and \(half) for you.")
}
shareWinnings(50)

//Returning values from a closure

let drivingWithReturnValue = { (name:String) -> String in
    return "The Driver name is \(name)"
    
}
print(drivingWithReturnValue("montu"))

var difficultyRating = { (trick: String) -> Int in
    if trick == "ollie" {
        return 1
    } else if trick == "Yoyo Plant" {
        return 3
    } else if trick == "900" {
        return 5
    } else {
        return 0
    }
}
print(difficultyRating("ollie"))

//Closures as parameters

func travel(action : () -> Void){
    print("I'm getting ready")
    action()
}

//Trailing closure syntax

/*
 If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.

 To demonstrate this, here’s our travel() function again. It accepts an action closure so that it can be run between two print() calls:
 */


func travel1(action:() -> Void){
    
    print("hello traveller")
    action()
    
}

travel {
    print("Hi i am traveling")
}

func holdClass(name: String, lesson: () -> Void) {
    print("Welcome to \(name)!")
    lesson()
    print("Make sure your homework is done by next week.")
}
holdClass(name: "Philosophy 101") {
    print("All we are is dust in the wind, dude.")
}

func tendGarden(activities: () -> Void) {
    print("I love gardening")
    activities()
}
tendGarden {
    print("Let's grow some roses!")
}

/*
MARK: Using closures as parameters when they accept parameters
 This is where closures can start to be read a bit like line noise: a closure you pass into a function can also accept its own parameters.

 We’ve been using () -> Void to mean “accepts no parameters and returns nothing”, but you can go ahead and fill the () with the types of any parameters that your closure should accept.

 To demonstrate this, we can write a travel() function that accepts a closure as its only parameter, and that closure in turn accepts a string:
 
 */

func travel2(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel2 { (place: String) in
    print("I'm going to \(place) in my car")
}

func fix(item: String, payBill: (Int) -> Void) {
    print("I've fixed your \(item)")
    payBill(450)
}
fix(item: "roof") { (bill: Int) in
    print("You want $\(bill) for that? Outrageous!")
}

func getDirections(to destination: String, then travel: ([String]) -> Void) {
    let directions = [
        "Go straight ahead",
        "Turn left onto Station Road",
        "Turn right onto High Street",
        "You have arrived at \(destination)"
    ]
    travel(directions)
}
getDirections(to: "London") { (directions: [String]) in
    print("I'm getting my car.")
    for direction in directions {
        print(direction)
    }
}


/*
 Using closures as parameters when they return values

 
 */

func loadData(input: () -> String) {
    print("Loading...")
    let str = input()
    print("Loaded: \(str)")
}
loadData {
    return "He thrusts his fists against the posts"
}

func manipulate(numbers: [Int], using algorithm: (Int) -> Int) {
    for number in numbers {
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result)")
    }
}
manipulate(numbers: [1, 2, 3]) { number in
    return number * number
}


//: [Next](@next)

