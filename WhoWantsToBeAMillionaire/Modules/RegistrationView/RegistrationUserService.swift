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

class RegistrationUserService {
    static let shared = RegistrationUserService()
    
    private let defaults = UserDefaults.standard
    
    private var users: [User] {
        didSet {
            saveUsers()
        }
    }
    
    init() {
        if let savedUsers = defaults.object(forKey: "SavedUsers") as? Data {
            let decoder = JSONDecoder()
            if let loadedUsers = try? decoder.decode([User].self, from: savedUsers) {
                self.users = loadedUsers
                return
            }
        }
        self.users = []
    }
    
    func saveUser(name: String, amount: Int?) {
        users.append(User(name: name, amount: amount ?? 0))
    }
    
    func setAmountForLastUser(_ amount: Int) {
        users[users.count - 1].amount = amount
    }
    
    func loadUsers() -> [User] {
        return users
    }
    
    private func saveUsers() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(users) {
            defaults.set(encoded, forKey: "SavedUsers")
        }
    }
}


