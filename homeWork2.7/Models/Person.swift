//
//  Person.swift
//  homeWork2.7
//
//  Created by Александра Мельникова on 10.06.2021.
//

struct Person {
    var name = ""
    var surname = ""
    var email = ""
    var phone: Int = 0
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

var newPerson = Person.getPerson()

extension Person {
    static func getPerson() -> [Person] {
        var dataNames = DataManager().names
        var dataSurnames = DataManager().surnames
        var dataEmails = DataManager().emails
        var dataPhones = DataManager().phones
        
        var persons: [Person] = []
        
        for _ in 1...dataNames.count {
            persons.append(Person(name: dataNames.remove(at: Int.random(in: 0..<dataNames.count)),
                                  surname: dataSurnames.remove(at: Int.random(in: 0..<dataSurnames.count)),
                                  email: dataEmails.remove(at: Int.random(in: 0..<dataEmails.count)),
                                  phone: dataPhones.remove(at: Int.random(in: 0..<dataPhones.count))))
        }
        
        return persons
    }
}
