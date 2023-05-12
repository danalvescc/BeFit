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
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(Colors.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 48)
                Text("GET THE SHAPE YOU'VE ALWAYS DREAMED")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Colors.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 4)
                Spacer()
                NavigationLink(destination: LoginView()){
                    Text("START BUILD YOUR BODY")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Colors.black)
                }.buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .tint(Colors.yellow)
                Button {
                    print("redirect")
                } label: {
                    Text("DON'T HAVE ANY ACCOUNT?")
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(Colors.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 8)
                    Text("REGISTER NOW")
                        .font(.system(size: 12, weight: .bold))
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
