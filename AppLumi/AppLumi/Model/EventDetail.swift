//
//  EventDetail.swift
//  AppLumi
//
//  Created by appinventiv on 29/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation

//
struct EventDetail: Codable {
    let count: Int
    let events: [Event]
}

// MARK: - Event
struct Event: Codable {
    let eventTime: EventTime
    let ageRange: AgeRange
    let loc: LOC
    let freeDrinks, atendees, price: Int
    let eventDescription, id: String
    let eventDate: EventDate
    let address: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case eventTime = "event_time"
        case ageRange = "age_range"
        case loc, freeDrinks, atendees, price
        case eventDescription = "description"
        case id = "_id"
        case eventDate = "event_date"
        case address
        case v = "__v"
    }
}

// MARK: - AgeRange
struct AgeRange: Codable {
    let minAge, maxAge: Int

    enum CodingKeys: String, CodingKey {
        case minAge = "min_age"
        case maxAge = "max_age"
    }
}

enum EventDate: String, Codable {
    case the20200426T000000000Z = "2020-04-26T00:00:00.000Z"
    case the20200427T000000000Z = "2020-04-27T00:00:00.000Z"
}

// MARK: - EventTime
struct EventTime: Codable {
    let hour, minutes: Int
}

// MARK: - LOC
struct LOC: Codable {
    let coordinates: [Double]
    let type: TypeEnum
    let category: Category
    let name: String
}

enum Category: String, Codable {
    case barsAndPubs = "Bars and Pubs"
}

enum TypeEnum: String, Codable {
    case point = "Point"
}
