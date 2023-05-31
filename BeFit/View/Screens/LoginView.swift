//
//  LoginView.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 11/05/23.
//

import SwiftUI
import FirebaseAuth
import Combine

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var navigationRoutes: NavigationRoutes
    
    @State var email: String = "test@befitapp.com"
    @State var password: String = "danalves25"
    
    
    var body: some View {
        VStack {
            TitleComponent(text: "LOG IN TO YOUR ACCOUNT")
                .padding(.bottom, 4)
            Text("Welcome back! Select method to log in:")
                .font(.custom("RobotoCondensed-Light", size: 18))
                .foregroundColor(Colors.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 24)
            TextFieldComponent(title: "E-mail", placeholder: "Type your e-mail...", keyboardType: .emailAddress, value: $email)
                .padding(.bottom, 8)
            TextFieldComponent(title: "Password", placeholder: "Type your password...", value: $password, isSecurity: true)
            VStack(alignment: .leading) {
                Button {
                    print("forgot password")
                } label: {
                    Text("Forgot password")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(Colors.white)
                        .font(.custom("RobotoCondensed-Bold", size: 18))
                }
            }.padding(.bottom, 8)
            
            Button {
                authViewModel.doSignin(email: email, password: password)
            } label: {
                Text("LOG IN")
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
            NavigationLink(destination: SignupView().environmentObject(authViewModel)){
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
            .onAppear {
                authViewModel.setup(navigationRoutes: navigationRoutes)
            }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    static var previews: some View {
        NavigationStack {
            LoginView()
                .environmentObject(AuthViewModel())
                .environmentObject(NavigationRoutes())
        }
    }
}
