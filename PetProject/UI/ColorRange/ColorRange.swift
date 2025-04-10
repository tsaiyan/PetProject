//
//  ColorRange.swift
//  PetProject
//
//  Created by Artyom baranov on 02.04.2025.
//

import SwiftUI

struct ColorRange: View {
    
    @State var count = 1
    
    var size: CGFloat {
        (430 - 32) / 3
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                makeRectangleWith(
                    firstColor: .pumpkin02,
                    secondColor: .pumpkin02SRgb,
                    imageName: "pumpkin02",
                    text: "Pumpkin 02"
                )
                makeRectangleWith(
                    firstColor: .ruby03,
                    secondColor: .ruby03SRgb,
                    imageName: "ruby03",
                    text: "Ruby 03"
                )
                makeRectangleWith(
                    firstColor: .sunny1,
                    secondColor: .sunnySrgb,
                    imageName: "sunny01",
                    text: "Sunny 01"
                )
                makeRectangleWith(
                    firstColor: .sky03,
                    secondColor: .sky03SRgb,
                    imageName: "sky03",
                    text: "Sky 03"
                )
                makeRectangleWith(
                    firstColor: .speechMagenta2,
                    secondColor: .speechMagentaSRGB,
                    imageName: "speechMagenta",
                    text: "SpeechMagenta 02"
                )
            }
        }.scrollIndicators(.hidden)
            .onTapGesture {
                updateCount()
            }
    }
    
    @ViewBuilder
    func makeRectangleWith(firstColor: Color, secondColor: Color, imageName: String, text: String) -> some View {
        VStack(spacing: 0) {
            Text(text)
            HStack(spacing: 0) {
                
                Rectangle()
                    .frame(width: size, height: size)
                    .foregroundStyle(firstColor)
                    .overlay { Text("Display P3").font(.system(size: 10)) }
                if count >= 2 {
                    Rectangle()
                        .frame(width: size, height: size)
                        .foregroundStyle(secondColor)
                        .overlay { Text("sRGB").font(.system(size: 10)) }
                }
                if count == 3 {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size, height: size)
                    
                        .overlay { Text("Image sRGB").font(.system(size: 10)) }
                }
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }
    
    func updateCount() {
        if count < 4 {
            count = count + 1
        } else {
            count = 1
        }
    }
}

#Preview {
    ColorRange()
}
