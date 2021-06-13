//
//  PersonInfoViewController.swift
//  homeWork2.7
//
//  Created by Александра Мельникова on 11.06.2021.
//

import UIKit

class PersonInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = person.fullName
        tableView.rowHeight = 70
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}


extension PersonInfoViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "infoCell",
            for: indexPath
        )
        
        var content = cell.defaultContentConfiguration()
        
        content.secondaryTextProperties.font = UIFont (name: "Helvetica Neue", size: 18)!
        content.secondaryTextProperties.color = .systemBlue
        content.text = (indexPath.item % 2 != 0) ?  "Email" : "Phone"
        content.secondaryText = (indexPath.item % 2 != 0) ?  person.email : String(person.phone)
        cell.contentConfiguration = content
        
        let whiteView : UIView = UIView(frame: CGRect(x: 10, y: 8, width: self.view.frame.size.width - 20, height: 120))
        whiteView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 0.9])
        cell.contentView.addSubview(whiteView)
        cell.contentView.sendSubviewToBack(whiteView)
        
        return cell
    }
}
