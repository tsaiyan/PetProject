//
//  ExtendHintArea.swift
//  PetProject
//
//  Created by Artyom baranov on 02.04.2025.
//

import SwiftUI

import SwiftUI

struct ExtendHintArea: View {
    @State private var tapCount: Int = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Tap count: \(tapCount)")
                .font(.title)
            
            HStack(spacing: 0) {
                // Иконка, визуально 40x40, с увеличенной tappable area за счет overlay
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .background(Color.red)
                    .overlay(
                        Rectangle()
                            .background(.clear)
                            .foregroundStyle(Color.clear)
                            .contentShape(Rectangle())
                            .frame(width: 100, height: 100)
                            .padding(340)
                    )
                    .onTapGesture {
                        tapCount += 1
                    }
                
                Text("Icon with expanded tappable area")
                    .font(.body)
                    .background(Color.blue)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ExtendHintArea()
}
