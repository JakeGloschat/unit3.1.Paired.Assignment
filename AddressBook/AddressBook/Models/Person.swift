//
//  Person.swift
//  AddressBook
//
//  Created by Jake Gloschat on 2/13/23.
//

import Foundation

class Person: Codable {
    let id: UUID
    var name: String
    var address: String
    var isFavorite: Bool
    init(id: UUID = UUID(), name: String, address: String, isFavorite: Bool = false) {
        self.id = id
        self.name = name
        self.address = address
        self.isFavorite = isFavorite
    }
    
} // End of Class

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
}
