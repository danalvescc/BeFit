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
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    func signup() {
        Auth.auth().createUser(withEmail: email, password: password){ (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("CREATE AN ACCOUNT")
                .font(.custom("RobotoCondensed-Bold", size: 32))
                .foregroundColor(Colors.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 1)
            Text("Let's get started with your new workout track App!")
                .font(.custom("RobotoCondensed-Light", size: 18))
                .foregroundColor(Colors.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 24)
            VStack(alignment: .leading) {
                Text("Name")
                    .foregroundColor(Colors.white)
                    .font(.custom("RobotoCondensed-Regular", size: 18))
                TextField("Name", text: $name)
                    .padding()
                    .border(Colors.white.opacity(0.2))
                    .foregroundColor(Colors.white)
                    .cornerRadius(8)
                    .font(.custom("RobotoCondensed-Regular", size: 18))
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }.padding(.bottom, 8)
            VStack(alignment: .leading) {
                Text("E-mail")
                    .foregroundColor(Colors.white)
                    .font(.custom("RobotoCondensed-Regular", size: 18))
                TextField("E-mail", text: $email)
                    .padding()
                    .border(Colors.white.opacity(0.2))
                    .cornerRadius(8)
                    .foregroundColor(Colors.white)
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
                    .border(Colors.white.opacity(0.2))
                    .cornerRadius(8)
                    .foregroundColor(Colors.white)
                    .font(.custom("RobotoCondensed-Regular", size: 18))
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }.padding(.bottom, 8)
            
            Button {
               print("its ok")
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
