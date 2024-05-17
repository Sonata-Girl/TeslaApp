//
//  ConvexButtonBlack.swift
//  TeslaApp
//
//  Created by Sonata Girl on 17.05.2024.
//

import SwiftUI

struct ConvexButtonBlack: View {
    var buttonImageName: String
    var withShadows = true
    var isSelected = false
    var systemImage = false

    var image: Image {
        if systemImage {
            Image(systemName: buttonImageName)
        } else {
            Image(buttonImageName)
        }
    }

    var convexButton: some View {
        image
            .tint(.white)
            .padding(.all, 20)
            .frame(width: 55, height: 55)
            .background(
                ZStack {
                    Circle()
                        .fill(LinearGradient(colors: [.appBlack.opacity(0.8), .appGray.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .padding(2)
                        .blur(radius: 3)
                    if isSelected {
                        Circle()
                            .stroke(gradient, lineWidth: 2)
                            .opacity(isSelected ? 1 : 0)
                    } else {
                        Circle()
                            .stroke(style: StrokeStyle(lineWidth: 3))
                            .fill(LinearGradient(colors: [.black.opacity(0.2), .gray.opacity(0.3)], startPoint: .top, endPoint: .bottomTrailing))
                    }
                })
            .padding()
    }

    var body: some View {
        ZStack {
            if withShadows {
                convexButton
                    .neumorphismVeryLightUnselected()
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: -7, y: -7)
                    .shadow(color: .black, radius: 5, x: 10, y: 10)
            } else {
                convexButton
            }
        }
    }
}
