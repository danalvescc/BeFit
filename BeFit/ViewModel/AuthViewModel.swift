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
    @Published var isLogged: Bool = false
    private(set) var navigationRoutes: NavigationRoutes?
    
    private let firebaseAuth = Auth.auth()
    
    init() {
//        firebaseAuth.addStateDidChangeListener { auth, user in
//            print("here")
//            self.loadUserData()
//        }
    }
    
    func setup(navigationRoutes: NavigationRoutes) {
        self.navigationRoutes = navigationRoutes
    }

    func loadUserData() {
        let user = firebaseAuth.currentUser
        if let user = user {
            print("😁: Logged with success")
            self.uid = user.uid
            self.email = user.email ?? ""
            self.name = user.displayName ?? ""
            self.isLogged = true
        } else {
            self.isLogged = false
            self.uid = ""
            self.email = ""
            self.name = ""
            print("🥺: Is not logged")
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
                print("😁: Logged with success")
                self.navigationRoutes?.navigate(.HomeView)
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
                self.updateName(name: name)
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
            if error == nil {
                self.name = name
            }
        }
    }
}
