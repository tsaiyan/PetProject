//
//  GradientAnimated.swift
//  PetProject
//
//  Created by Artyom baranov on 09.04.2025.
//

import SwiftUI

struct AnimatedGradientDemoView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("Animated Linear Gradient")
                .font(.headline)
            
            AnimatedGradientRectangle()
                .frame(height: 100)
                .cornerRadius(12)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

struct AnimatedGradientRectangle: View {
    var body: some View {
        // Используем GeometryReader для получения ширины контейнера
        GeometryReader { geometry in
            TimelineView(.animation) { timeline in
                let time = timeline.date.timeIntervalSinceReferenceDate
                // Циклическое смещение: пусть анимация длится 3 секунды и повторяется
                let shift = CGFloat((time.truncatingRemainder(dividingBy: 3)) / 3)
                
                // Вычисляем стартовую и конечную точки, которые зависят от shift.
                // Например, стартовая точка смещается по оси X от 0 до 1, а конечная — всегда на 1 правее.
                let startPoint = UnitPoint(x: shift, y: 0.5)
                let endPoint = UnitPoint(x: shift + 1, y: 0.5)
                
                LinearGradient(
                    gradient: Gradient(colors: [.red, .blue, .green]),
                    startPoint: startPoint,
                    endPoint: endPoint
                )
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

#Preview {
    AnimatedGradientDemoView()
}
