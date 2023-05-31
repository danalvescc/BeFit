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
    @StateObject var navigationRoutes = NavigationRoutes()
    var body: some View {
        NavigationStack(path: $navigationRoutes.path) {
            WelcomeView()
                .navigationDestination(for: Routes.self){ route in
                    switch route {
                    case .HomeView:
                        HomeView()
                    case .WelcomeView:
                        WelcomeView()
                    }
                }
        }
        .environmentObject(authViewModel)
        .environmentObject(userViewModel)
        .environmentObject(navigationRoutes)
        .onAppear {
            authViewModel.loadUserData()
            if authViewModel.isLogged {
                navigationRoutes.path.append(Routes.HomeView)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
