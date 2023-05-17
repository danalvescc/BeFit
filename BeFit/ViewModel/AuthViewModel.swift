//
//  AuthViewModel.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 16/05/23.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var email = String()
    @Published var name = String()
    @Published var uid = String()
    @Published var photoURL = String()
    @Published var isLogged = false
    
    private let firebaseAuth = Auth.auth()
    
    init() {
        let user = firebaseAuth.currentUser
        if let user = user {
            self.uid = user.uid
            self.email = user.email ?? ""
            self.name = user.displayName ?? ""
            self.isLogged = true
            print(uid)
        }
    }
    
    func doSignin(email: String, password: String){
        if email.isEmpty || password.isEmpty {
            print("erro")
            return
        }
        
        firebaseAuth.signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                self.uid = result?.user.uid ?? ""
                self.email = result?.user.email ?? ""
                self.name = result?.user.displayName ?? ""
                self.isLogged = true
            }
        }
    }
    
    func doSignUp(email: String, password: String, name: String){
        if email.isEmpty || password.isEmpty || name.isEmpty {
            print("empty data")
            return
        }
        
        firebaseAuth.createUser(withEmail: email, password: password) { [self] result, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                
                self.uid = result?.user.uid ?? ""
                self.email = result?.user.email ?? ""
                self.updateName(name: name)
                self.name = name
                self.isLogged = true
            }
        }
    }
    
    func doLogout(){
        do {
            try firebaseAuth.signOut()
            self.isLogged = false
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func updateName(name: String) {
        let changeRequest = firebaseAuth.currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges { error in
            //
        }
    }
}
