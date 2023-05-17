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
    
    @State var email: String = "test@befitapp.com"
    @State var password: String = "danalves25"
    
    
    var body: some View {
        VStack {
            Text("LOG IN TO YOUR ACCOUNT")
                .font(.custom("RobotoCondensed-Bold", size: 32))
                .foregroundColor(Colors.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 4)
            Text("Welcome back! Select method to log in:")
                .font(.custom("RobotoCondensed-Light", size: 18))
                .foregroundColor(Colors.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 24)
            VStack(alignment: .leading) {
                Text("E-mail")
                    .foregroundColor(Colors.white)
                    .font(.custom("RobotoCondensed-Regular", size: 18))
                TextField("E-mail", text: $email)
                    .padding()
                    .background(Colors.secondGray)
                    .foregroundColor(Colors.white)
                    .cornerRadius(8)
                    
                    .font(.custom("RobotoCondensed-Regular", size: 18))
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }.padding(.bottom, 8)
            VStack(alignment: .leading) {
                Text("Password")
                    .foregroundColor(Colors.white)
                    .font(.custom("RobotoCondensed-Regular", size: 18))
                SecureField("Password", text: $password)
                    .padding()
                    .background(Colors.secondGray)
                    .foregroundColor(Colors.white)
                    .cornerRadius(8)
                    .font(.custom("RobotoCondensed-Regular", size: 18))
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
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
        
    }
}

struct LoginView_Previews: PreviewProvider {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    static var previews: some View {
        NavigationStack {
            LoginView()
        }
    }
}
