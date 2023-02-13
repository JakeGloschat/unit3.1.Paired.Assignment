//
//  Person.swift
//  AddressBook
//
//  Created by Jake Gloschat on 2/13/23.
//

import Foundation

class Person {
    let id: UUID
    var name: String
    var address: String
    
    init(id: UUID = UUID(), name: String, address: String) {
        self.id = id
        self.name = name
        self.address = address
    }
    
} // End of Class

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
   
    
}
