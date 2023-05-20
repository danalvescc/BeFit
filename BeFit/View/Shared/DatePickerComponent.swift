//
//  DatePickerComponent.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 19/05/23.
//

import SwiftUI

struct DatePickerComponent: View {
    @Binding var value : Date
    var title: String
    
    var body: some View {
        DatePicker(selection: $value, in: ...Date.now, displayedComponents: .date) {
            Text(title)
                .foregroundColor(Colors.white)
                .font(.custom("RobotoCondensed-Regular", size: 18))
        }
    }
}

struct DatePickerComponent_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerComponent(value: .constant(Date()), title: "date")
    }
}
