//
//  FirstTableViewController.swift
//  homeWork2.7
//
//  Created by Александра Мельникова on 10.06.2021.
//

import UIKit

class FirstTableViewController: UITableViewController {
    private var persons = newPerson
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 45
        navigationItem.rightBarButtonItem = editButtonItem
        tableView.tableFooterView = UIView() //удаляет лишние пустые ячейки
    }
}

extension FirstTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "personCell",
            for: indexPath
        )
        
        let person = persons[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = person.fullName
        content.textProperties.font = UIFont (name: "Apple SD Gothic Neo", size: 18)!
        cell.accessoryType = .detailDisclosureButton // обозначает переход на экран с подробной информацией о человеке
        cell.contentConfiguration = content
       
        return cell
    }
}

extension FirstTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? PersonInfoViewController,
              let indexPath = tableView.indexPathForSelectedRow
        else { return }
        
        let person = persons[indexPath.row]
        vc.person = person
    }
}

extension FirstTableViewController {
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentPerson = persons.remove(at: sourceIndexPath.row)
        persons.insert(currentPerson, at: destinationIndexPath.row)
    }
}
