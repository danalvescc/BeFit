//
//  IconButton.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 12/05/23.
//

import Foundation
import SwiftUI

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
