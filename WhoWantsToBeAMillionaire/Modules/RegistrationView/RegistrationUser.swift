//
//  RegistrationUser.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Ilya on 02.03.2024.
//

import UIKit

struct User: Codable {
    var name: String
    var amount: Int
}

class UserService {
    static let shared = UserService()
    
    private let defaults = UserDefaults.standard
    
    func saveUser(_ user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            defaults.set(encoded, forKey: "SavedUser")
        }
    }
    
    func loadUsers() -> [User]? {
        if let savedUser = defaults.object(forKey: "SavedUser") as? Data {
            let decoder = JSONDecoder()
            if let loadedUsers = try? decoder.decode([User].self, from: savedUser) {
                return loadedUsers
            }
        }
        return nil
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user1 = User(name: "Максим", amount: 100)
        let user2 = User(name: "Иван", amount: 150)
        let users = [user1, user2]
        
        UserService.shared.saveUser(user)
        
        // Пример загрузки данных
        if let loadedUsers = UserService.shared.loadUsers() {
            for user in loadedUsers {
                print("Name: \(user.name), Amount: \(user.amount)")
            }
        }
    }
}
