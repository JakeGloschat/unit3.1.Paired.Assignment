//
//  PersonDetailViewController.swift
//  AddressBook
//
//  Created by Jake Gloschat on 2/13/23.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var personAddressTextField: UITextField!
    
    
    // MARK: - Properties
    var personObjectReceiver: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    // MARK: - helper function
    
    func updateViews() {
        guard let personObjectReceiver = personObjectReceiver else { return }
        personNameTextField.text = personObjectReceiver.name
        personAddressTextField.text = personObjectReceiver.address
    }
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let person = personObjectReceiver,
              let name = personNameTextField.text,
              let address = personAddressTextField.text else { return }
        PersonController.updatePerson(newName: name, newAddress: address, newPerson: person)
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
} // End of Class
