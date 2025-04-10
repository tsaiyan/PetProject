//
//  Shimmering.swift
//  PetProject
//
//  Created by Artyom baranov on 08.04.2025.
//

import SwiftUI


struct Shimmering: AnimatableModifier {
    
    @State private var isAppeared: Bool = false
    @State private var startPosition: CGFloat = -0.7
    private var animation = Animation.easeIn(
        duration: 3
    ).repeatForever(
        autoreverses: false
    )
    
    var animatableData: CGFloat {
        get { startPosition }
        set { startPosition = newValue }
    }
    
    func body(content: Content) -> some View {
        
        content
            .overlay(shimmerGradient).mask(content)
            .animation(isAppeared ? animation : .linear(duration: 0), value: isAppeared)
            .onAppear {
                isAppeared = true
                startPosition = 0.7
            }
            .onDisappear {
                isAppeared = false
                startPosition = -0.7
            }
    }
    
    var shimmerGradient: some View {
        LinearGradient(
            stops: [
                Gradient.Stop(color: .clear, location: 0),
                Gradient.Stop(color: Color(UIColor.red.withAlphaComponent(0)), location: 0.3),
                Gradient.Stop(color: Color(UIColor.red.withAlphaComponent(0.5)), location: 0.5),
                Gradient.Stop(color: Color(UIColor.red.withAlphaComponent(0)), location: 0.7),
                Gradient.Stop(color: .clear, location: 1)
            ],
            startPoint: UnitPoint(x: startPosition, y: 0.5),
            endPoint: UnitPoint(x: startPosition + 1, y: 0.5)
        )
    }
}

public extension View {
    
    @ViewBuilder
    func shimmering() -> some View {
        modifier(Shimmering())
    }
}

struct DemoShimmerView: View {
    var body: some View {
        VStack {
            Circle()
                .foregroundStyle(Color.black)
            HStack(spacing: 16) {
                Text("Shimmering Text")
                    .font(.title)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(8)
                
                RoundedRectangle(cornerRadius: 10)
                    .background(Color.black)
                    .frame(height: 50)
            }
        }
        .padding()
        .shimmering()
    }
}

#Preview {
    DemoShimmerView()
}

