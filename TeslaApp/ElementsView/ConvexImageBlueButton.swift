//
//  ConvexBlueButton.swift
//  TeslaApp
//
//  Created by Sonata Girl on 16.05.2024.
//

import SwiftUI

struct ConvexImageBlueButton: View {
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
            .tint(.gray)
            .padding(.all, 20)
            .frame(width: 50, height: 50)
            .background(
                ZStack {
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 2))
                        .fill(LinearGradient(colors: [.black.opacity(0.9), .gray], startPoint: .top, endPoint: .bottomTrailing))
                    if isSelected {
                        Circle()
                            .fill(LinearGradient(colors: [.blue, .appDarkBlue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(2)
                            .blur(radius: 4)
                    } else {
                        Circle()
                            .fill(LinearGradient(colors: [.gray.opacity(0.25), .black.opacity(0.45)], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(2)
                            .blur(radius: 4)
                    }
                })
            .clipShape(.circle)
            .padding()
    }

    var body: some View {
        ZStack {

            if withShadows {
                convexButton
                    .neumorphismUnselectedStyle()
            } else {
                convexButton
            }
        }
    }

}
