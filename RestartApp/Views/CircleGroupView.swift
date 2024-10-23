//
//  CircleGroupView.swift
//  RestartApp
//
//  Created by MarkFathy on 22/10/2024.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - PROPERTY

    @State var shapeColor: Color // State Property Wrapper: A property wrapper type that can read and write a value managed by SwiftUI
    @State var shapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
                
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1: 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea()
        CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
    }
    
}
