//
//  UserViewModel.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 24/05/23.
//

import Foundation

import SwiftUI

class UserViewModel: ObservableObject {
    @Published private(set) var user: User?
//    @Published var userConfigured = false
    
    func saveUser(_ user: User) {
        self.user = user
    }
}
