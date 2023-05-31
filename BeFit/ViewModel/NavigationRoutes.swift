//
//  NavigationRoutes.swift
//  BeFit
//
//  Created by Daniel  Alves Barreto on 30/05/23.
//

import Foundation
import SwiftUI

enum Routes: String {
    case HomeView = "Home"
    case WelcomeView = "Welcome"
//    case SigninView = "Sign In"
//    case SignupView = "Sign Up"
}


class NavigationRoutes: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(_ route: Routes) {
        path.append(route)
    }
    
    func root() {
        path.removeLast(path.count)
    }
}
