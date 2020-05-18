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
//: [Next](@next)

