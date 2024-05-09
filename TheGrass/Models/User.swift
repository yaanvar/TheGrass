//
//  User.swift
//  TheGrass
//
//  Created by Anvar Rakhimov on 15.10.2023.
//

import Foundation

public struct User: Identifiable {
    public let id = UUID()
    let name: String
    let secondName: String
    let tag: String
    let description: String
    let age: String
    let location: String
}

extension User {
    func fullName() -> String {
        return self.name + " " + self.secondName
    }
}

extension User {
    public static let dummyUser = User(
        name: "Anvar",
        secondName: "Rakhimov",
        tag: "yaanvar",
        description: "Hit me up anytime",
        age: "19",
        location: "Moscow, Russia"
    )
    
    public static let dummyData = Array(repeating: User.dummyUser, count: 10)
}
