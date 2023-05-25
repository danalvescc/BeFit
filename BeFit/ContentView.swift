//
//  ContentView.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 10/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authViewModel = AuthViewModel()
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            if authViewModel.isLogged {
                PersonalInfoView()
            } else {
                WelcomeView()
            }
        }
        .environmentObject(authViewModel)
        .environmentObject(userViewModel)
        .onAppear {
            authViewModel.loadUserData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
