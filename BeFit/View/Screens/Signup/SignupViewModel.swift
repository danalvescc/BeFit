//
//  SignupViewModel.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 20/05/23.
//

import Foundation
import SwiftUI

class SignupViewMode: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    func createUserOnDB() {
        authViewModel.doSignUp(email: email, password: password, name: name)
        
        let userDict: [String: Any] = [
            "personalData": [
                "email": email,
                "name": name
            ]
        ]
        
        FirestoreService.shared.addUser(data: userDict)
    }
    
}
