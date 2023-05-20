//
//  TextFieldComponent.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 19/05/23.
//

import SwiftUI

struct TextFieldComponent: View {
    var title: String
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    @Binding var value : String
    var backgroundColor: Color = Colors.secondGray
    var foregroundColor: Color = Colors.white
    var isSecurity: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Colors.white)
                .font(.custom("RobotoCondensed-Regular", size: 18))
            if isSecurity {
                SecureField(placeholder, text: $value)
                    .padding()
                    .background(backgroundColor)
                    .foregroundColor(foregroundColor)
                    .cornerRadius(8)
                
                    .font(.custom("RobotoCondensed-Regular", size: 18))
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(.never)
            } else {
                TextField(placeholder, text: $value)
                    .padding()
                    .background(backgroundColor)
                    .foregroundColor(foregroundColor)
                    .cornerRadius(8)
                
                    .font(.custom("RobotoCondensed-Regular", size: 18))
                    .keyboardType(keyboardType)
                    .textInputAutocapitalization(.never)
            }
        }
    }
}
//
//struct TextFieldComponent_Previews: PreviewProvider {
//    @State var somestate = ""
//    static var previews: some View {
////        TextFieldComponent(title: "title", placeholder: "write title...", keyboardType: .default, value: $somestate)
//    }
//}
