//
//  PersonalInfoViewModel.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 24/05/23.
//

import Foundation
import SwiftUI


class PersonalInfoViewModel: ObservableObject {
    var genres = ["Male", "Famale", "Non Defined"]
    var goals = ["Hypertrophy", "Muscle Definition", "Lose Weight"]
    var experienceLevel = ["Beginner", "Intermediary", "Advanced"]
    var workoutDays = ["1", "2", "3", "4", "5", "6", "7"]
    @Published var genrer = "Male"
    @Published var birthDate = Date()
    @Published var weight = String()
    @Published var height = String()
    @Published var goal = "Hypertrophy"
    @Published var experience = "Beginner"
    @Published var frequency = "5"
    @Published var goHome = false
    
    var authViewModel: AuthViewModel?
    var userViewModel: UserViewModel?
    
    func setup(authViewModel: AuthViewModel, userViewModel: UserViewModel) {
        self.authViewModel = authViewModel
        self.userViewModel = userViewModel
    }
    
    func saveData() {
        let doubleWeight = Double(weight) ?? 0
        let doubleHeight = Double(height) ?? 0
        let user = User(personalData: User.PersonalData(name: authViewModel!.name, email: authViewModel!.email, birthDate: birthDate, height: doubleWeight, weight: doubleHeight, goal: goal, experience: experience, frequency: Int(frequency) ?? 0))
        
        userViewModel!.saveUser(user)
        
        self.goHome = true
    }
}
