//
//  BeautifulTabBar.swift
//  TeslaApp
//
//  Created by Sonata Girl on 17.05.2024.
//

import SwiftUI

struct BeautifulTabBar: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
    
            let startPoint = CGPoint(x: 10, y: -10)
            path.move(to: startPoint)
            path.addCurve(to: CGPoint(x: 110, y: -35),
                          control1: CGPoint(x: 30, y: -35),
                          control2: CGPoint(x: 50, y: -35))
            path.addLine(to: CGPoint(x: 140, y: -35))
            path.addCurve(to: CGPoint(x: 190, y: 0),
                          control1: CGPoint(x: 150, y: -35),
                          control2: CGPoint(x: 160, y: 0))
            path.addCurve(to: CGPoint(x: 250, y: -35),
                          control1: CGPoint(x: 230, y: -0),
                          control2: CGPoint(x: 240, y: -35))
            path.addCurve(to: CGPoint(x: rect.width - 10, y: -10),
                          control1: CGPoint(x: 330, y: -35),
                          control2: CGPoint(x: 370, y: -35))
            path.addCurve(to: CGPoint(x: rect.width - 50, y: 40),
                          control1: CGPoint(x: rect.width - 10, y: 10),
                          control2: CGPoint(x: rect.width - 10, y: 30))
            path.addLine(to: CGPoint(x: 50, y: 40))
    
            path.addCurve(to: CGPoint(x: 10, y: -10),
                          control1: CGPoint(x: 10, y: 30),
                          control2: CGPoint(x: 10, y: 10))
            return path
        }
}
