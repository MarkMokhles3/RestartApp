//
//  OnboardingView.swift
//  RestartApp
//
//  Created by MarkFathy on 21/10/2024.
// MARK: - <#Section Name#>

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true // this true value will not only be added to the property when the program does not find the ONBOARDING key previously set in the device's permenant storage
    // When the running program finds a previously created ONBOARDING key, then it will ignore the value set no matter what is there
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80 // this is a computed property
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnmating: Bool = false // like a switcher
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                // MARK: - HEADER
                
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnmating ? 1 : 0) // ternaroy operator a ? b : c .. condition ? true : false
                .offset(y: isAnmating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnmating)
                
                // MARK: - CENTER
                
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnmating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnmating)
                } //: CENTER
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack {
                    // Parts of the custom button
                    
                    // 1. BACKGROUND (STATIC)
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)

                    
                    // 2. CALL-TO-Action (STATIC)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // 3. CAPSULE (Dynamic width)
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    //4. CIRCLE (Draggable)
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
//                        .onTapGesture {
//                            isOnboardingViewActive = false
//                        }
                        .gesture(
                        DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 { // it will only run when the dragging has been started in the right direction
                                    buttonOffset = gesture.translation.width //We are capturing the actual movement's width for later use
                                }
                            })
                            .onEnded({ _ in
                                withAnimation(Animation.easeOut(duration: 0.4)) {
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    } else {
                                        buttonOffset = 0
                                    }
                                }
                            })
                        ) //: GESTURE
                        Spacer()
                    } //: HSTACK
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnmating ? 1 : 0)
                .offset(y: isAnmating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnmating)
            } //: VSTACK
        } //: ZSTACK
        .onAppear(perform: {
            isAnmating = true
        })
    }
}

#Preview {
    OnboardingView()
}
