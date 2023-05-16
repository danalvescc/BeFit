//
//  WelcomeView.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 10/05/23.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                Text("PLANNING YOUR DAILY WORKOUT")
                    .font(.custom("RobotoCondensed-Light", size: 18, relativeTo: .subheadline))
                    .foregroundColor(Colors.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 48)
                Text("GET THE SHAPE YOU'VE ALWAYS DREAMED")
                    .font(.custom("RobotoCondensed-Bold", size: 32, relativeTo: .title))
                    .foregroundColor(Colors.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 2)
                Spacer()
                NavigationLink(destination: LoginView()){
                    Text("START BUILD YOUR BODY")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.custom("RobotoCondensed-Bold", size: 24))
                    .foregroundColor(Colors.black)
                }.buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .tint(Colors.yellow)
                NavigationLink(destination: SignupView()){
                    Text("DON'T HAVE ANY ACCOUNT?")
                        .font(.custom("RobotoCondensed-Light", size: 14))
                        .foregroundColor(Colors.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 8)
                    Text("REGISTER NOW")
                        .font(.custom("RobotoCondensed-Bold", size: 14))
                        .foregroundColor(Colors.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 8)
                }
                .padding(.bottom, 24)
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity).background(ZStack {
                Colors.mainGray
                Image("WelcomeBG")
                .resizable()
                .scaledToFill()
                .opacity(0.1)
        }.edgesIgnoringSafeArea(.all))
        .padding([.leading, .trailing], 24)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
      NavigationStack{
          WelcomeView()
      }
  }
}
