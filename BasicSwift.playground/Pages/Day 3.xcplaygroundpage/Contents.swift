//: [Previous](@previous)

import Foundation

//MARK:Operators and conditions

//MARK:Conditions

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
}

//MARK:The ternary operator



let result = (firstCard == secondCard ? "The cards are same " : "The cards are different")
print(result)

var retweet = 100
print(retweet > 10 ? "Sucess" : "failure")


//MARK:Switch statements

let weather = "sunny"

switch weather {
case "Hot":
    print("weather is hot")
case "sunny":
    print("Weather is sunny")
case "Cold":
    print("Weather is cold")
default:
    print("Weather is not listed here")
    
}


for i in 1...15 {
    let square = i * i
    if i == 8 {
        continue
    }
    print("\(i) squared is \(square)")
}

//: [Next](@next)
