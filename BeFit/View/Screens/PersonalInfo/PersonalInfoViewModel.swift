//
//  PersonalInfoViewModel.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 24/05/23.
//

import Foundation
import SwiftUI

class PersonalInfoViewModel: ObservableObject {
    @Published var genrer = String()
    @Published var birthDate = Date()
    @Published var weight = Double()
    @Published var height = Double()
    @Published var goal = String()
    @Published var experience = String()
    @Published var frequency = String()
    
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    func saveData() {
        var user = User(personalData: User.PersonalData(name: authViewModel.name, email: authViewModel.email, birthDate: birthDate, height: height, weight: weight))
    }
}
