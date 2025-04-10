//
//  ColorRange.swift
//  PetProject
//
//  Created by Artyom baranov on 02.04.2025.
//

import SwiftUI

struct ColorRange: View {
    var body: some View {
        makeRectangleWith(firstColor: .malachite00, secondColor: .malachite00SRgb)
        makeRectangleWith(firstColor: .malachite01, secondColor: .malachite01SRgb)
        makeRectangleWith(firstColor: .malachite02, secondColor: .malachite02SRgb)
        makeRectangleWith(firstColor: .malachite03, secondColor: .malachite03SRgb)
        makeRectangleWith(firstColor: .malachite04, secondColor: .malachite04SRgb)
    }
    
    func makeRectangleWith(firstColor: Color, secondColor: Color) -> some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundStyle(firstColor)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundStyle(secondColor)
        }
    }
}

#Preview {
    ColorRange()
}
