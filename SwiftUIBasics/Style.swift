//
//  Style.swift
//  SwiftUIBasics
//
//  Created by LPT 528 on 1/21/20.
//  Copyright © 2020 Godoh Dev. All rights reserved.
//

import Foundation
struct ButtonGradientStyle : ViewModifier{
    func body(content: Content) -> some View {
        return content
        .frame(minWidth:0, maxWidth: .infinity)
        .padding(.vertical,12)
        .background(LinearGradient(gradient: Gradient(colors: [Color("DarkBlue"), Color("LightBlue")]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing))
        .accentColor(Color.white)
        .cornerRadius(8.0)
    }
}
