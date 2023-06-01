//
//  UserModel.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 16/05/23.
//

import Foundation

struct User {
    struct PersonalData {
        var name: String
        var email: String
        var birthDate: Date
        var height: Double
        var weight: Double
        var goal: String
        var experience: String
        var frequency: Int
    }
    
    struct Exercise {
        var name: String
        var sets: Int
        var reps: Int
        var mainMuscle: String
        var seondaryMuscles: [String]
    }
    
    struct TrainingSession {
        var id: Int
        var day: Int
        var muscles: [String]
        var exercises: [Exercise]
    }
    
    struct Training {
        var id: Int
        var createdDate: Date
        var perWeek: Int
        var training: [TrainingSession]
    }
    
    struct TrainingRealized {
        var date: Date
        var duration: Int
        var TrainingListId: Int
        var TrainingSessionId: Int
    }
    
    var personalData: PersonalData
    var trainings: [Training] = []
    var trainingHistory: [TrainingRealized] = []
}
