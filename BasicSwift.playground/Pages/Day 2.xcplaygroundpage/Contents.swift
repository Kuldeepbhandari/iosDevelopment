//: [Previous](@previous)

import Foundation



//MARK:Complex data types

//Arrays are collections of values that are stored as a single value. For example, John, Paul, George, and Ringo are names, but arrays let you group them in a single value called The Beatles.

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

print(beatles[1])



//MARK:SETS

let colors = Set(["Red","pink","yellow","Red"])
print(colors)
//Sets are collections of values just like arrays, except they have two differences:

/*Items aren’t stored in any order; they are stored in what is effectively a random order.
//No item can appear twice in a set; all items must be unique.
//You can create sets directly from arrays, like this:*/

//MARK:TUPLES

/*Tuples allow you to store several values together in a single value. That might sound like arrays, but tuples are different:

You can’t add or remove items from a tuple; they are fixed in size.
You can’t change the type of items in a tuple; they always have the same types they were created with.
You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.
Tuples are created by placing multiple items into parentheses, like this: */

var name = (first:"Taylor",last:"Swift")
//we can access this by using
print(name.first)

//Dicitionary

let books = ["Austen": "Pride and Prejudice"]
let dickens = books["Dickens", default: "Unknown"]
print(dickens)

//MARK:Creating Empty Collection
var teams = [String:String]()

teams["name"] = "kuldeep"
print(teams)

//MARK:Enumerations

enum Result{
    case Sucees
    case Failure
}

let failure = Result.Failure
print(failure)

//Enum associated values

enum Activity{
    case bored
    case talking(topic:String)
    case running(destination:String)
    case singing(volume:Int)
}

let volume = Activity.singing(volume: 5)
print(volume)

//MARK Enum raw values

enum Day : Int{
    case Monday = 1
    case Tuesday
    case Wensday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

let sundayCount = Day(rawValue: 5)!
print(sundayCount)
//: [Next](@next)
