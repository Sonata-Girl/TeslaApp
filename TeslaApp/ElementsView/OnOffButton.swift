//
//  OnOffButton.swift
//  TeslaApp
//
//  Created by Sonata Girl on 15.05.2024.
//

import SwiftUI

struct OnOffButton: View {
    @Binding var isSelected: Bool

    var body: some View {
        Image("power")
            .padding(.all, 20)
            .frame(width: 60, height: 60)
            .foregroundStyle(isSelected ? .gray : .white)
            .background(
                ZStack {
                    if isSelected {
                        Circle()
                            .fill(LinearGradient(colors: [.appBlack,.appDarkBlue, .blue, .appLightBlue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(2)
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 5))
                            .fill(LinearGradient(colors: [.appBlack, .appDarkBlue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    } else {
                        Circle()
                            .fill(LinearGradient(colors: [.blue, .appBlue, .appLightBlue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(2)
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 5))
                            .fill(LinearGradient(colors: [.appLightBlue, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    }
                })
            .padding()
    }
}

