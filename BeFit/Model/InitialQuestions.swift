//
//  InitialQuestions.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 17/05/23.
//

import Foundation


struct Question {
    var question: String
    var multiple: Bool
    var answer: [Answer]
}

struct Answer {
    var title: String
    var subtitle: String?
    var value: String
}

var InitialQuestions: [Question] = [
    Question(question: "What's your goal?", multiple: false, answer: [
        Answer(title: "Hypertrophy", subtitle: "Gain muscle mass and bulky muscles", value: "hypertrophy"),
        Answer(title: "Muscle definition", subtitle: "More visible muscles", value: "definition"),
        Answer(title: "Lode weight", subtitle: "Lose body fat", value: "weight")
    ]),
    Question(question: "What's your expierience working out", multiple: false, answer: [
        Answer(title: "Begginer", subtitle: "Less than 6 months", value: "begginer"),
        Answer(title: "Intermediary", subtitle: "More than 6 months and less than 2 years", value: "intermediary"),
        Answer(title: "Advanced", subtitle: "More than 2 years", value: "advanced")
    ]),
    Question(question: "Do you want workout in which week days?", multiple: true, answer: [
        Answer(title: "Monday", value: "monday"),
        Answer(title: "Tuesday", value: "tuesday"),
        Answer(title: "Wednesday", value: "wednesday"),
        Answer(title: "Thursday", value: "thursday"),
        Answer(title: "Friday", value: "friday"),
        Answer(title: "Saturday", value: "saturday"),
        Answer(title: "Sunday", value: "sunday"),
    ]),
]
