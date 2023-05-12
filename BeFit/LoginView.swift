//
//  LoginView.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 11/05/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("WELCOME BACK")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Colors.white)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            VStack(alignment: .leading) {
                Text("E-mail")
                    .foregroundColor(Colors.white)
                    .padding(.leading)
                    .font(.system(size: 16, weight: .bold))
                TextField("E-mail", text: $email)
                    .padding()
                    .border(Colors.white.opacity(0.4))
                    .cornerRadius(8)
                    .foregroundColor(Colors.white)
                    .font(.system(size: 16, weight: .light))
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }.padding(.bottom, 8)
            VStack(alignment: .leading) {
                Text("Password")
                    .foregroundColor(Colors.white)
                    .padding(.leading)
                    .font(.system(size: 16, weight: .bold))
                SecureField("Password", text: $password)
                    .padding()
                    .border(Colors.white.opacity(0.4))
                    .cornerRadius(8)
                    .foregroundColor(Colors.white)
                    .font(.system(size: 16, weight: .light))
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                Button {
                    print("forgot password")
                } label: {
                    Text("Forgot password")
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(Colors.white)
                        .font(.system(size: 14, weight: .bold))
                }

            
            }.padding(.bottom, 8)
            
            Button {
               print("its ok")
            } label: {
                Text("LOG IN")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 18, weight: .bold))
                .foregroundColor(Colors.black)
            }.buttonStyle(.borderedProminent)
                .controlSize(.large)
                .tint(Colors.yellow)
                .padding(.top)
            
            Text("OR")
                .font(.system(size: 12, weight: .light))
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

struct IconButton: View {
    let image: String
    let action: ()-> Void
    var body : some View {
        Button {
            action()
        } label: {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 26)
        }.padding()
            .tint(Colors.yellow)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginView()
        }
    }
}
