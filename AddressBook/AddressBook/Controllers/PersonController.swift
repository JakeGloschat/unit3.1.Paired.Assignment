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
    
    static func createPerson(name: String = "New Contact", address: String = "", group: Group) {
        let person = Person(name: name, address: address)
        group.people.append(person)
        // Don't forget to call the save function once made
    }
    static func updatePerson(newName: String, newAddress: String, newPerson: Person) {
        newPerson.name = newName
        newPerson.address = newAddress
        // Don't forget to call the save function once made
    }
    static func delete(personToDelete: Person, from collection: Group) {
        guard let index = collection.people.firstIndex(of: personToDelete) else {return}
        collection.people.remove(at: index)
        // Don't forget to call the save function once made
    }
    
    
} // End of Class
