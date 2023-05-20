//
//  PickerComponent.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 19/05/23.
//

import SwiftUI

struct PickerComponent: View {
    var title: String
    var placeholder: String
    @Binding var value : String
    var backgroundColor: Color = Colors.secondGray
    var foregroundColor: Color = Colors.white
    var options: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(Colors.white)
                .font(.custom("RobotoCondensed-Regular", size: 18))
            Picker(placeholder, selection: $value) {
                ForEach(options, id: \.self) {
                    Text($0).pickerStyle(.wheel)
                }
            }.pickerStyle(.menu)
            .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .foregroundStyle(.secondary)
                .cornerRadius(8)
                .font(.custom("RobotoCondensed-Regular", size: 18))
            }
        }
    }

//struct PickerComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        PickerComponent(title: ", placeholder: <#String#>, value: <#Binding<String>#>, options: <#[String]#>)
//    }
//}
