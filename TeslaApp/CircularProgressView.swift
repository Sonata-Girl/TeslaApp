//
//  CircularProgressView.swift
//  TeslaApp
//
//  Created by Sonata Girl on 14.05.2024.
//

import SwiftUI

struct CircularProgressView: View {
    var colorsColdProgress: [Color] = [.appBlue, .appMint]
    var colorsHotProgress: [Color] = [.orange, .red]
    @Binding var progress: Int

    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 30))
                .fill(LinearGradient(colors: [.appBlack, .black], startPoint: .top, endPoint: .bottomTrailing))
                .frame(width: 170, height: 170)
            Circle()
                .fill(LinearGradient(colors: [.black, .gray.opacity(0.4)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 138, height: 138)
            Circle()
                .trim(from: 0, to: Double(progress) * 100 / 15 / 100)
                .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round))
                .fill(LinearGradient(colors: progress > 20 ? colorsHotProgress : colorsColdProgress, startPoint: .top, endPoint: .bottom))
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .neumorphismLightStyle()
            Text("\(progress + 15)°C")
                .font(.custom("Verdana", size: 25))
                .foregroundStyle(.white)
                .bold()
        }
        .neumorphismVeryLightBigShadow()
    }
}
