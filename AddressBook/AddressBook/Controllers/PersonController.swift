//
//  PersonModelController.swift
//  AddressBook
//
//  Created by Jake Gloschat on 2/13/23.
//

import Foundation

class PersonController {
    /*
    // MARK: - Properties
    static let sharedInstance = PersonController()
    // Source of Truth
    var group: [Person] = []
    */
    
    // MARK: - CRUD
    
    static func create(name: String = "New Contact", address: String = "", group: Group) {
        let person = Person(name: name, address: address)
        group.people.append(person)
    }
    
    static func update() {
        
    }
    
    static func delete() {
        
    }
    
    
} // End of Class
