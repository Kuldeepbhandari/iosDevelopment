//
//  EventBooking.swift
//  AppLumi
//
//  Created by mac on 12/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation

struct EventBooking: Codable {
    let status: String
    let noOfBookings: Int
    let data: [EventBookingDetail]

    enum CodingKeys: String, CodingKey {
        case status
        case noOfBookings = "NO_OF_BOOKINGS"
        case data
    }
}

// MARK: - Datum
struct EventBookingDetail: Codable {
    let isPaymentCompleted: Bool
    let id, userID, eventID: String
    let eventInfo: EventInfo
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case isPaymentCompleted
        case id = "_id"
        case userID = "user_id"
        case eventID = "event_id"
        case eventInfo = "event_info"
        case createdAt, updatedAt
        case v = "__v"
    }
}

// MARK: - EventInfo
struct EventInfo: Codable {
    let date: String
    let time: Time
    let price: Int
    let name, address: String
}

// MARK: - Time
struct Time: Codable {
    let hour, minutes: Int
}
