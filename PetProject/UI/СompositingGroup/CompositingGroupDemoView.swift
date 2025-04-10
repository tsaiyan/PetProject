//
//  CompositingGroupDemoView.swift
//  PetProject
//
//  Created by Artyom baranov on 09.04.2025.
//

import SwiftUI

struct CompositingGroupDemoView: View {
    var body: some View {
        VStack(spacing: 40) {
            
            // Пример без использования compositingGroup()
            VStack {
                Text("Без compositingGroup()")
                    .font(.headline)
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 150, height: 150)
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 150, height: 150)
                }
                .blur(radius: 10)
                .border(Color.gray, width: 1)
            }
            
            // Пример с использованием compositingGroup()
            VStack {
                Text("С compositingGroup()")
                    .font(.headline)
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 150, height: 150)
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 150, height: 150)
                }
                .compositingGroup()  // объединяет содержимое в единый слой
                .blur(radius: 10)
                .border(Color.gray, width: 1)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Demo: compositingGroup")
    }
}

struct CompositingGroupDemoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CompositingGroupDemoView()
        }
    }
}

import SwiftUI

struct CompositingGroupExplicitDemoView: View {
    var body: some View {
        HStack(spacing: 40) {
            
            // Первый столбец: без compositingGroup()
            VStack(spacing: 10) {
                Text("Без compositingGroup()")
                    .font(.caption)
                    .foregroundColor(.secondary)
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                    // Второй круг смещён, чтобы создать перекрытие
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .offset(x: 30, y: 30)
                }
                .blur(radius: 10)
                .border(Color.gray, width: 1)
            }
            
            // Второй столбец: с compositingGroup()
            VStack(spacing: 10) {
                Text("С compositingGroup()")
                    .font(.caption)
                    .foregroundColor(.secondary)
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                        .offset(x: 30, y: 30)
                }
                .compositingGroup()
                .blur(radius: 10)
                .border(Color.gray, width: 1)
            }
        }
        .padding()
        .navigationTitle("compositingGroup Demo")
    }
}

#Preview {
    NavigationView {
        CompositingGroupExplicitDemoView()
    }
}
