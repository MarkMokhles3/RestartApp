//
//  HomeView.swift
//  RestartApp
//
//  Created by MarkFathy on 21/10/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        // MARK: - PROPERTY
        
        @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
        
        // MARK: - BODY
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)
            Button {
                isOnboardingViewActive = true
            } label: {
                Text("Restart")
            }

            
        } // : VSTACK
    }
}

#Preview {
    HomeView()
}
