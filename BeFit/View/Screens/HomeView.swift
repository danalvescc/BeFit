//
//  HomeView.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 17/05/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        VStack {
            Text(authViewModel.name)
            Button {
                authViewModel.doLogout()
            } label: {
                Text("Logout")
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    static var previews: some View {
        NavigationStack {
            HomeView()
        }.environmentObject(AuthViewModel())
    }
}
