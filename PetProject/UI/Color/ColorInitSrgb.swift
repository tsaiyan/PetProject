//
//  ColorInitSrgb.swift
//  PetProject
//
//  Created by Баранов Артём Николаевич on 15.04.2025.
//

import SwiftUI

struct ColorTestInApp: View {
    
    let color1 = Color(.sRGB, red: 219 / 255.0, green: 18 / 255.0, blue: 55 / 255.0, opacity: 1)
    let color2 = Color(.sRGB, red: 33 / 255.0, green: 161 / 255.0, blue: 154 / 255.0, opacity: 1)
    let color3 = Color(.sRGB, red: 212 / 255.0, green: 65 / 255.0, blue: 217 / 255.0, opacity: 1)
    let color4 = Color(.sRGB, red: 95 / 255.0, green: 65 / 255.0, blue: 217 / 255.0, opacity: 1)
    
    let color11 = Color(.displayP3, red: 219 / 255.0, green: 18 / 255.0, blue: 55 / 255.0, opacity: 1)
    let color22 = Color(.displayP3, red: 33 / 255.0, green: 161 / 255.0, blue: 154 / 255.0, opacity: 1)
    let color33 = Color(.displayP3, red: 212 / 255.0, green: 65 / 255.0, blue: 217 / 255.0, opacity: 1)
    
    let color44 = Color(.displayP3, red: 95 / 255.0, green: 65 / 255.0, blue: 217 / 255.0, opacity: 1)
    
    @State var showNewScreen = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    color1
                        .overlay {
                            Text("sRGB")
                        }
                    color11
                        .overlay {
                            Text("Display P3")
                        }
                }
                HStack(spacing: 0) {
                    color2
                        .overlay {
                            Text("sRGB")
                        }
                    color22
                        .overlay {
                            Text("Display P3")
                        }
                }
                HStack(spacing: 0) {
                    color3
                        .overlay {
                            Text("sRGB")
                        }
                    color33
                        .overlay {
                            Text("Display P3")
                        }
                }
                HStack(spacing: 0) {
                    color4
                        .overlay {
                            Text("sRGB")
                        }
                    color44
                        .overlay {
                            Text("Display P3")
                        }
                }
            }
            .onTapGesture {
                showNewScreen.toggle()
            }
            NavigationLink(destination: ColorRange(), isActive: $showNewScreen) {
                EmptyView()
            }
        }
    }
}

#Preview {
    ColorTestInApp()
}
