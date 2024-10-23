//
//  HomeView.swift
//  RestartApp
//
//  Created by MarkFathy on 21/10/2024.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnmating: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - HEADER
            
            Spacer()
            
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnmating ? 35 : -35)
                .animation(
                    .easeInOut(duration: 4)
                    .repeatForever(),
                    value: isAnmating)
            }
            
            // MARK: - CENTER
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - FOOTER
            
            Spacer()
            
            Button {
                withAnimation {
                    isOnboardingViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } // : VSTACK
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 /*3*/ , execute: {
                isAnmating = true
            }) // we are telling the program to run our code inside the closure three seconds later from now on the main thread ... nothing will happend on the first three seconds
        }
    }
}

#Preview {
    HomeView()
}
