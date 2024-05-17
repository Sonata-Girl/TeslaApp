//
//  ChargingBarView.swift
//  TeslaApp
//
//  Created by Sonata Girl on 17.05.2024.
//

import SwiftUI

struct ChargingBarView: View {
    @Binding var progress: Int

    var body: some View {
        ZStack(alignment: .leading) {
            ChargingBarFigure()
                .fill(LinearGradient(colors: [.gray, .appBlack, .black, .appBlack], startPoint: .top, endPoint: .bottom))
                .stroke(.white, style: StrokeStyle(lineWidth: 0.3))
                .blur(radius: 1)
                .shadow(color: .white, radius: 2, x: 0, y: 0)
            ChargingBarFigure()
                .fill(LinearGradient(colors: [.appBlue, .appMint], startPoint: .top, endPoint: .bottom))
                .frame(width: CGFloat(progress) * 3.1)
                .shadow(color: .appMint, radius: 2, x: 0, y: 0)
                .shadow(color: .appBlue, radius: 40, x: 0, y: -30)
                .neumorphismLightStyle()
        }
    }
}

