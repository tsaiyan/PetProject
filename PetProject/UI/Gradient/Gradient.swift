//
//  Gradient.swift
//  PetProject
//
//  Created by Artyom baranov on 09.04.2025.
//

import SwiftUI

struct GradientDemoView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    
                    // Linear Gradient (от левого края к правому)
                    demoSection(title: "Linear Gradient") {
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(height: 100)
                            .cornerRadius(12)
                    }
                    
                    // Radial Gradient (радиальный)
                    demoSection(title: "Radial Gradient") {
                        Rectangle()
                            .fill(
                                RadialGradient(
                                    gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]),
                                    center: .center,
                                    startRadius: 20,
                                    endRadius: 100
                                )
                            )
                            .frame(height: 100)
                            .cornerRadius(12)
                    }
                    
                    // Angular Gradient (угловой)
                    demoSection(title: "Angular Gradient") {
                        Rectangle()
                            .fill(
                                AngularGradient(
                                    gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple]),
                                    center: .center
                                )
                            )
                            .frame(height: 100)
                            .cornerRadius(12)
                    }
                    
                    // Linear Gradient с заданными остановками (stops)
                    demoSection(title: "Linear Gradient with Stops") {
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(stops: [
                                        .init(color: .red, location: 0),
                                        .init(color: .orange, location: 0.25),
                                        .init(color: .yellow, location: 0.5),
                                        .init(color: .green, location: 0.75),
                                        .init(color: .blue, location: 1)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(height: 100)
                            .cornerRadius(12)
                    }
                    
                    // Линейный градиент с наклоном (используем startPoint и endPoint)
                    demoSection(title: "Linear Gradient with custom angle") {
                        // Задаём градиент под углом (без rotationEffect)
                        // Пример для угла 45°:
                        let angle: CGFloat = 45
                        let radians = angle * (.pi / 180)
                        // В координатной системе [0,1]:
                        let startPoint = UnitPoint(
                            x: 0.5 - 0.5 * cos(radians),
                            y: 0.5 - 0.5 * sin(radians)
                        )
                        let endPoint = UnitPoint(
                            x: 0.5 + 0.5 * cos(radians),
                            y: 0.5 + 0.5 * sin(radians)
                        )
                        
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [.red, .blue]),
                                    startPoint: startPoint,
                                    endPoint: endPoint
                                )
                            )
                            .frame(height: 100)
                            .cornerRadius(12)
                    }
                }
                .padding()
            }
            .navigationTitle("Gradient Demo")
        }
    }
    
    /// Вспомогательная функция для создания секции с подписью и содержимым.
    private func demoSection<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            content()
        }
    }
}

struct GradientDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GradientDemoView()
    }
}
