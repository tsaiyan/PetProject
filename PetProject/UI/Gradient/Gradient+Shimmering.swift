//
//  Gradient+Shimmering.swift
//  PetProject
//
//  Created by Artyom baranov on 09.04.2025.
//

import SwiftUI

struct ShimmeringModifier: ViewModifier {
    // Ширина бегущей полоски
    var stripeWidth: CGFloat = 100
    // Длительность цикла анимации в секундах
    var duration: Double = 2.0

    func body(content: Content) -> some View {
        content
            // Накладываем один общий слой, который будет анимироваться
            .overlay(
                GeometryReader { geometry in
                    TimelineView(.animation) { timeline in
                        // Получаем ширину контейнера
                        let containerWidth = geometry.size.width
                        // Получаем текущее время
                        let time = timeline.date.timeIntervalSinceReferenceDate
                        // Нормализуем время для получения значения progress от 0 до 1
                        let progress = CGFloat((time.truncatingRemainder(dividingBy: duration)) / duration)
                        // Вычисляем смещение так, чтобы полоска стартовала полностью за пределами левой границы (–stripeWidth)
                        // и двигалась до правой границы контейнера.
                        let offsetX = progress * (containerWidth + stripeWidth) - stripeWidth

                        // Создаем градиент, используя системный цвет systemGray6.
                        // По краям прозрачный, в центре — почти непрозрачный.
                        let gradient = LinearGradient(
                            gradient: Gradient(stops: [
                                Gradient.Stop(color: Color(UIColor.systemGray6).opacity(0), location: 0),
                                Gradient.Stop(color: Color(UIColor.systemGray6).opacity(0.8), location: 0.5),
                                Gradient.Stop(color: Color(UIColor.systemGray6).opacity(0), location: 1)
                            ]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        
                        gradient
                            .frame(width: stripeWidth, height: geometry.size.height)
                            .offset(x: offsetX)
                    }
                }
            )
            .mask(content)
    }
}

extension View {
    func shimmering2() -> some View {
        self.modifier(ShimmeringModifier())
    }
}

import SwiftUI

struct FixedStripeShimmerModifier: AnimatableModifier {
    // Фиксированная ширина полоски
    private let stripeWidth: CGFloat = 100
    var duration: Double = 2.0
    // Анимируемое свойство, которое изменяется от 0 до 1 (progress)
    @State var progress: CGFloat = 0

    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    // Общая ширина контейнера
                    let containerWidth = geometry.size.width
                    // Расчет смещения: полоска стартует за левым краем (–stripeWidth) и уходит вправо
                    let offsetX = progress * (containerWidth + stripeWidth) - stripeWidth
                    
                    // Полоса с фиксированной шириной и градиентом по краям
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.gray.opacity(0), location: 0),
                            .init(color: Color.gray.opacity(0.8), location: 0.5),
                            .init(color: Color.gray.opacity(0), location: 1)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .frame(width: stripeWidth, height: geometry.size.height)
                    .offset(x: offsetX)
                }
            )
            .mask(content)
            .onAppear {
                withAnimation(
                    Animation.linear(duration: duration)
                        .repeatForever(autoreverses: false)
                ) {
                    // При запуске анимации progress изменяется от 0 до 1
                    progress = 1.0
                }
            }
    }
}

extension View {
    func fixedStripeShimmer(duration: Double = 2.0) -> some View {
        self.modifier(FixedStripeShimmerModifier(duration: duration))
    }
}

struct DemoShimmerView2: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Shimmering Effect")
                .font(.title)
            
            // Пример: прямоугольник с контентом, на котором применяется эффект
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray4))
                .frame(width: 300, height: 100)
                
        }
        .padding()
        .compositingGroup()
        .fixedStripeShimmer()
    }
}

#Preview {
    DemoShimmerView2()
}
