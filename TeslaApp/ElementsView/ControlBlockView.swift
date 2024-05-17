//
//  ControlBlockView.swift
//  TeslaApp
//
//  Created by Sonata Girl on 15.05.2024.
//

import SwiftUI

struct ControlBlockView: View {
    var imageName: String
    var title: String
    @Binding var progress: Int
    @Binding var color: Color
    @Binding var isClimateOn: Bool

    var body: some View {
        HStack {
            Text(title)
                .frame(width: 40)
                .foregroundStyle(.gray)
            ConvexImageBlueButton(buttonImageName: imageName, withShadows: false, isSelected: progress > 0)
            Slider(value: Binding(
                get: { Double(self.progress) },
                set: { newValue in
                    if isClimateOn {
                        withAnimation {
                            self.progress = Int(newValue)
                        }
                    }
                }
            ), in: 0...15, step: 1) {
                Text(String(progress))
            }
            .padding(.horizontal)
            .tint(color)
            .onAppear {
                UISlider.appearance().setThumbImage(UIImage(named: "sliderIcon"), for: .normal)
            }
        }
    }
}
