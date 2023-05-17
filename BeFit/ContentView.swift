//
//  ContentView.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 10/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        if authViewModel.isLogged {
            HomeView(authViewModel: authViewModel)
        } else {
            WelcomeView()
                .environmentObject(authViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
