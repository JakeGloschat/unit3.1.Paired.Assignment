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
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    // MARK: - Properties
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    // MARK: - helper function
    
    func updateViews() {
        guard let personObjectReceiver = person else { return }
        personNameTextField.text = personObjectReceiver.name
        personAddressTextField.text = personObjectReceiver.address
    }
    func updateFavoriteButton() {
        guard let personObjectReceiver = person else { return }
        let favoriteImageName = personObjectReceiver.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        favoriteButton.setImage(favoriteImage, for: .normal)
    }
    // MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let person = person,
              let name = personNameTextField.text,
              let address = personAddressTextField.text else { return }
        PersonController.updatePerson(newName: name, newAddress: address, newPerson: person)
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let person = person else { return }
        PersonController.toggleFavorite(person: person)
        updateFavoriteButton()
    }
    
} // End of Class
