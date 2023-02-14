//
//  PersonTableViewCell.swift
//  AddressBook
//
//  Created by Jake Gloschat on 2/14/23.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    // MARK: - Properties
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    
// MARK: - Outlets
    
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    // MARK: - Helper Functions
    
    func updateViews () {
        guard let person = person else { return }
        personNameLabel.text = person.name
        
    }
    func updateFavoriteButton() {
        guard let personObjectReceiver = person else { return }
        let favoriteImageName = personObjectReceiver.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        favoriteButton.setImage(favoriteImage, for: .normal)
    }
    

} // End of Class
