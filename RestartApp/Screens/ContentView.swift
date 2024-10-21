//
//  ContentView.swift
//  RestartApp
//
//  Created by Mark Mokhles on 21/10/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true // this property will set up a new onboarding key in app storage .. this @AppStorage is a special swiftui property wrapper that will use the user's defaults under the hood .. it's purpose is to store some value on the device's permentant storage by utilizing a get and set method .. "onboarding" this is a user deafult key .. isOnboardingViewActive this a property name that we can use in this swiftui file
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
