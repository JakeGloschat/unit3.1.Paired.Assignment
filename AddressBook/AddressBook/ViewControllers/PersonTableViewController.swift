//
//  PersonTableViewController.swift
//  AddressBook
//
//  Created by Jake Gloschat on 2/13/23.
//

import UIKit

class PersonTableViewController: UITableViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var groupNameTextField: UITextField!
    
   
    
    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        groupNameTextField.text = group?.name
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        guard let group = group,
        let groupName = groupNameTextField.text else { return }
        GroupController.sharedInstance.update(groupToUpdate: group, newGroupName: groupName)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var group: Group?

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return group?.people.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        guard let personToDisplay = group?.people[indexPath.row] else { return UITableViewCell() }
        var config = cell.defaultContentConfiguration()
        config.text = personToDisplay.name
        cell.contentConfiguration = config
        // Configure the cell...
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            guard let group = group else { return }
            let person = group.people[indexPath.row]
            PersonController.delete(personToDelete: person, from: group)
            tableView.deleteRows(at: [indexPath], with: .fade)
       
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPersonDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? PersonDetailViewController {
                    let person = group?.people[indexPath.row]
                    destination.personObjectReceiver = person
                    
                }
            }
        }
    }

    // MARK: - Action
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let group = group else { return }
        PersonController.createPerson(group: group)
        tableView.reloadData()
    }
    
}
