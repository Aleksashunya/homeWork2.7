//
//  NewPersonTableViewController.swift
//  homeWork2.7
//
//  Created by Александра Мельникова on 13.06.2021.
//

import UIKit

class NewPersonTableViewController: UITableViewController {
    var person = Person()
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        saveButton.isEnabled = false
        
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        surnameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        phoneTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    func saveNewPerson() {
        person = Person(name: nameTextField.text!,
                        surname: surnameTextField.text!,
                        email: emailTextField.text!,
                        phone: Int(phoneTextField.text ?? "0") ?? 0)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

extension NewPersonTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged() {
        if nameTextField.text?.isEmpty == false && surnameTextField.text?.isEmpty == false && phoneTextField.text?.isEmpty == false && emailTextField.text?.isEmpty == false {
            saveButton.isEnabled = true
        }
    }
}
