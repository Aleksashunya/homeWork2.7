//
//  SecondPersonalListViewController.swift
//  homeWork2.7
//
//  Created by Александра Мельникова on 11.06.2021.
//

import UIKit

class SecondTableViewController: UITableViewController{
    private var persons = newPerson
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 40
    }
}

extension SecondTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "secondPersonCell",
            for: indexPath
        )
        let person = self.persons[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        content.text = (indexPath.item % 2 != 0) ?  person.email : String(person.phone)
        content.image = (indexPath.item % 2 != 0) ? UIImage(systemName: "phone") : UIImage(systemName: "tray")
        cell.contentConfiguration = content
        
        return cell
    }
}
