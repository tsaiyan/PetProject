//
//  TextFormat.swift
//  PetProject
//
//  Created by Artyom baranov on 08.04.2025.
//

import SwiftUI

struct FormattedTextShowcaseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                Text("📘 Заголовок")
                    .font(.largeTitle)
                    .bold()
                
                Text("Простой текст без форматирования.")
                    .font(.body)
                
                Text("**Жирный текст** и *курсивный текст* можно комбинировать.")
                
                Text("~~Зачёркнутый текст~~ поддерживается через Markdown.")
                
                Text("`Моноширинный текст`, как в коде.")
                    .font(.system(.body, design: .monospaced))

                Text("Это [ссылка на сайт](https://apple.com) внутри текста.")
                
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("🔹 Цитата")
                        .font(.title2)
                        .bold()
                    
                    QuoteView(
                        text: "Великие умы обсуждают идеи; средние умы обсуждают события; мелкие умы обсуждают людей.",
                        author: "Элеонора Рузвельт"
                    )
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("🔢 Формула")
                        .font(.title2)
                        .bold()
                    
                    FormulaView(formula: "E = mc²")
                    FormulaView(formula: "a² + b² = c²")
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("🔘 Список:")
                        .font(.title2)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("• Элемент 1")
                        Text("• Элемент 2")
                        Text("• Элемент 3")
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Форматирование текста")
    }
}

struct QuoteView: View {
    let text: String
    let author: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("“\(text)”")
                .italic()
                .padding(12)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            
            if let author = author {
                Text("— \(author)")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.leading, 8)
            }
        }
    }
}

struct FormulaView: View {
    let formula: String
    
    var body: some View {
        Text(formula)
            .font(.system(size: 24, weight: .medium, design: .monospaced))
            .padding(12)
            .background(Color.blue.opacity(0.05))
            .cornerRadius(8)
    }
}

#Preview {
    NavigationView {
        FormattedTextShowcaseView()
    }
}
