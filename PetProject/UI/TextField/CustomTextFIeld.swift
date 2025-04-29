//
//  CustomTextFIeld.swift
//  PetProject
//
//  Created by Баранов Артём Николаевич on 16.04.2025.
//

import SwiftUI

struct CustomTextFIeld: View {
    
    @State var text: String = "Some text"
    
    var body: some View {
        TextField("Some text", text: $text)
    }
}

#Preview {
    CustomTextFIeld()
}
