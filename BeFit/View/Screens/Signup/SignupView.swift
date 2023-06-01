//
//  SignupView.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 12/05/23.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var navigationRoutes: NavigationRoutes
    @StateObject var signupViewMode = SignupViewMode()
    
    var body: some View {
        VStack {
            TitleComponent(text: "CREATE AN ACCOUNT")
                .padding(.bottom, 1)
            Text("Let's get started with your new workout track App!")
                .font(.custom("RobotoCondensed-Light", size: 18))
                .foregroundColor(Colors.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 24)
            TextFieldComponent(title: "Name", placeholder: "Type your name...", value: $signupViewMode.name).padding(.bottom, 8)
            TextFieldComponent(title: "E-mail", placeholder: "Type your e-mail...", keyboardType: .emailAddress, value: $signupViewMode.email).padding(.bottom, 8)
            TextFieldComponent(title: "Password", placeholder: "Type your password...", keyboardType: .default, value: $signupViewMode.password, isSecurity: true).padding(.bottom, 8)
            
            Button {
                authViewModel.doSignUp(email: signupViewMode.email, password: signupViewMode.password, name: signupViewMode.name)
            } label: {
                Text("CREATE ACCOUNT")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.custom("RobotoCondensed-Bold", size: 18))
                .foregroundColor(Colors.black)
            }.buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(Colors.yellow)
                .padding(.top)
            
            Text("OR")
                .font(.custom("RobotoCondensed-Light", size: 14))
                .foregroundColor(Colors.white)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            HStack {
                IconButton(image: "googleIcon") {
                    print("any")
                }
                IconButton(image: "facebookIcon") {
                    print("any")
                }
                IconButton(image: "appleIcon") {
                    print("any")
                }
            }
            .padding(.bottom, 48)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            .background(ZStack{
                Colors.mainGray
                Image("WelcomeBG2")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.1)
            }).edgesIgnoringSafeArea(.all)
            .padding([.leading, .trailing], 24)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                    }.foregroundColor(Colors.white)
                }
                
            }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignupView()
        }
    }
}
