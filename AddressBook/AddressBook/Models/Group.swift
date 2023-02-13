//
//  Group.swift
//  AddressBook
//
//  Created by Jake Gloschat on 2/13/23.
//

import Foundation

class Group {
    let id: UUID
    var name: String
    var people: [Person]
    init(id: UUID = UUID (), name: String, people: [Person] = []) {
        self.id = id
        self.name = name
        self.people = people
    }
} // End of Class

extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        lhs.id == rhs.id
    }
    
    
}
