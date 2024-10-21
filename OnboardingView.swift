//
//  OnboardingView.swift
//  RestartApp
//
//  Created by MarkFathy on 21/10/2024.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true // this true value will not only be added to the property when the program does not find the ONBOARDING key previously set in the device's permenant storage
    // When the running program finds a previously created ONBOARDING key, then it will ignore the value set no matter what is there
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button {
                isOnboardingViewActive = false
            } label: {
                Text("Start")
            }

        } //: VSTACK
    }
}

#Preview {
    OnboardingView()
}
