//
//  PersonalInfoView.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 19/05/23.
//

import Foundation
import SwiftUI




struct PersonalInfoView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var personalInfoViewModel = PersonalInfoViewModel()
    
    var body: some View {
//        VStack {
//            TitleComponent(text: "LET'S START WITH SOME INFORMATIONS")
//                .padding(.bottom, 48)
//            PickerComponent(title: "Genre", placeholder: "Select your genre...", value: $genre, options: genres).padding(.bottom, 16)
//            DatePickerComponent(value: $birthDate, title: "Birth Date").padding(.bottom, 16)
//            TextFieldComponent(title: "Weight", placeholder: "Type your weight...", keyboardType: .decimalPad, value: $weight).padding(.bottom, 8)
//            TextFieldComponent(title: "Height", placeholder: "Type your height...", keyboardType: .decimalPad, value: $height).padding(.bottom, 16)
//            Button {
//                print("ok")
//            } label: {
//                Text("NEXT")
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .font(.custom("RobotoCondensed-Bold", size: 24))
//                .foregroundColor(Colors.green)
//            }.buttonStyle(.plain)
//                .controlSize(.large)
//                .tint(Colors.yellow)
//                .padding(.top)
//
//        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//            .padding([.leading, .trailing], 24)
//            .background(Colors.mainGray)
        VStack {
            TitleComponent(text: "MY PROFILE")
            Form {
                Section {
                    Picker("Gender", selection: $personalInfoViewModel.genrer) {
                        ForEach(personalInfoViewModel.genres, id: \.self) {
                            Text($0)
                        }
                    }
                    DatePicker("Birth date", selection: $personalInfoViewModel.birthDate, displayedComponents: .date)
                    TextField("Weight", text: $personalInfoViewModel.weight).keyboardType(.decimalPad)
                    TextField("Height", text: $personalInfoViewModel.height).keyboardType(.decimalPad)
                } header: {
                    Text("ABOUT YOU").foregroundColor(Color.gray)
                }
                Section {
                    Picker("Goal", selection: $personalInfoViewModel.goal) {
                        ForEach(personalInfoViewModel.goals, id: \.self) {
                            Text(String($0))
                        }
                    }
                    Picker("Experience", selection: $personalInfoViewModel.experience) {
                        ForEach(personalInfoViewModel.experienceLevel, id: \.self) {
                            Text(String($0))
                        }
                    }
                    Picker("Workout Days per week", selection: $personalInfoViewModel.frequency) {
                        ForEach(personalInfoViewModel.workoutDays, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("WORKOUT").foregroundColor(Color.gray)
                }
                Button {
                    personalInfoViewModel.saveData()
                } label: {
                    Text("Confirm").frame(minWidth: 0, maxWidth: .infinity)
                }
            }
            .scrollContentBackground(.hidden)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Colors.mainGray)
        .toolbar {
            ToolbarItem {
                Button {
                    authViewModel.doLogout()
                } label: {
                    Text("Logout")
                }

            }
        }
        .onAppear {
            personalInfoViewModel.setup(authViewModel: authViewModel, userViewModel: userViewModel)
        }
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PersonalInfoView()
        }.environmentObject(AuthViewModel()).environmentObject(UserViewModel())
    }
}
