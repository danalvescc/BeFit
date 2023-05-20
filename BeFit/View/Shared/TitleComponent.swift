//
//  TitleComponent.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 19/05/23.
//

import SwiftUI

struct TitleComponent: View {
    var color: Color = Colors.white
    var text: String = ""
    var size: Int = 32
    
    var body: some View {
        Text(text)
            .font(.custom("RobotoCondensed-Bold", size: CGFloat(size)))
            .foregroundColor(color)
            .multilineTextAlignment(.center)
    }
}

struct TitleComponent_Previews: PreviewProvider {
    static var previews: some View {
        TitleComponent()
    }
}
