//
//  UserViewModel.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 24/05/23.
//

import Foundation

import SwiftUI

enum ScreenStatus {
    case configured
    case notConfigured
    case logged
}

class UserViewModel: ObservableObject {
    @Published private(set) var user: User?
    
    func saveUser(_ user: User) {
        self.user = user
    }
}
