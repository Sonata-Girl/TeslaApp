//
//  CapotTabBarBeautiful.swift
//  TeslaApp
//
//  Created by Sonata Girl on 17.05.2024.
//

import SwiftUI

struct CapotTabBarBeautiful: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let startPoint = CGPoint(x: 0, y: 0)
        path.move(to: startPoint)
        path.addCurve(to: CGPoint(x: 110, y: -35),
                      control1: CGPoint(x: 10, y: -35),
                      control2: CGPoint(x: 50, y: -35))
        path.addLine(to: CGPoint(x: 140, y: -35))
        path.addCurve(to: CGPoint(x: 190, y: 0),
                      control1: CGPoint(x: 150, y: -35),
                      control2: CGPoint(x: 160, y: 0))
        path.addCurve(to: CGPoint(x: 250, y: -35),
                      control1: CGPoint(x: 230, y: -0),
                      control2: CGPoint(x: 240, y: -35))
        path.addCurve(to: CGPoint(x: rect.width, y: 0),
                      control1: CGPoint(x: 330, y: -35),
                      control2: CGPoint(x: 390, y: -35))
        path.addLine(to: CGPoint(x: rect.width, y: 40))
        path.addLine(to: CGPoint(x: 0, y: 40))
        return path
    }
}
