//
//  PersonalInfoView.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 19/05/23.
//

import Foundation
import SwiftUI


struct PersonalInfoView: View {
    var genres = ["male", "famale", "non defined"]
    @State var genre = String()
    @State var birthDate = Date()
    @State var weight = String()
    @State var height = String()
    
    var body: some View {
        VStack {
            TitleComponent(text: "LET'S START WITH SOME INFORMATIONS")
                .padding(.bottom, 48)
            PickerComponent(title: "Genre", placeholder: "Select your genre...", value: $genre, options: genres).padding(.bottom, 8)
            DatePickerComponent(value: $birthDate, title: "Birth Date").padding(.bottom, 8)
            TextFieldComponent(title: "Weight", placeholder: "Type your weight...", keyboardType: .decimalPad, value: $weight)
            TextFieldComponent(title: "Height", placeholder: "Type your height...", keyboardType: .decimalPad, value: $height)
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .padding([.leading, .trailing], 24)
            .background(Colors.mainGray)
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PersonalInfoView()
        }.environmentObject(AuthViewModel())
    }
}
