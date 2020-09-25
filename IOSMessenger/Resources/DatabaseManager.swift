//
//  DatabaseManager.swift
//  IOSMessenger
//
//  Created by Faraz Muhammad Aulia on 25/09/20.
//  Copyright © 2020 Faraz Muhammad Aulia. All rights reserved.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
}

// MARK: - Account Management

extension DatabaseManager {
    
    // insert new user to database
    public func storeUser(with user: ChatAppUser) {
        
        database.child(user.uid).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName,
            "email": user.email
        ])
        
    }
}


struct ChatAppUser {
    let uid: String
    let firstName: String
    let lastName: String
    let email: String
//    let profilePictureURL: String
}
