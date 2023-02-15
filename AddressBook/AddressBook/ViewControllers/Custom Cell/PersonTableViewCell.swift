//
//  PersonTableViewCell.swift
//  AddressBook
//
//  Created by Jake Gloschat on 2/14/23.
//

import UIKit

protocol PersonTableViewCellDelegate: AnyObject {
    func toggleFavoriteButtonTapped(cell: PersonTableViewCell)
}

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
    
    weak var delegate: PersonTableViewCellDelegate?
    // MARK: - Helper Functions
    
    func updateViews () {
        guard let person = person else { return }
        personNameLabel.text = person.name
        updateFavoriteButton()
        
    }
    func updateFavoriteButton() {
        guard let personObjectReceiver = person else { return }
        let favoriteImageName = personObjectReceiver.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        favoriteButton.setImage(favoriteImage, for: .normal)
    }
    
    // MARK: - Actions
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        delegate?.toggleFavoriteButtonTapped(cell: self)
    }

} // End of Class
