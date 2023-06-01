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
    @EnvironmentObject var navigationRoutes: NavigationRoutes
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image("DefaultUser")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Colors.white, lineWidth: 2))
                VStack (alignment: .leading){
                    Text("WELCOME BACK,")
                        .font(.custom("RobotoCondensed-Light", size: 16))
                        .foregroundColor(Colors.white)
                    Text("DANIEL")
                        .font(.custom("RobotoCondensed-Bold", size: 24))
                        .foregroundColor(Colors.white)
                }.padding(.leading, 8)
            }.padding(.bottom, 24)
            
            Text("TRAINING PLAN")
                .font(.custom("RobotoCondensed-Bold", size: 24))
                .foregroundColor(Colors.white)
            
            ScrollView(.horizontal) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Colors.secondGray)
                        .frame(width: 100, height: 120).overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .inset(by: 2)
                                .stroke(Colors.white, lineWidth: 2)
                        )
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Colors.white)
                }
            }
            
            
//            Button {
//                authViewModel.doLogout()
//            } label: {
//                Text("Logout")
//            }
        }.padding([.trailing, .leading], 24)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .background(Colors.mainGray)
    }
}

struct HomeView_Previews: PreviewProvider {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate;
    static var previews: some View {
        NavigationStack {
            HomeView()
        }.environmentObject(AuthViewModel())
    }
}
