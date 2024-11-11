//
//  ChargingBar.swift
//  TeslaApp
//
//  Created by Sonata Girl on 17.05.2024.
//

import SwiftUI

struct ChargingBarFigure: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.00187*width, y: 0.60739*height))
        path.addLine(to: CGPoint(x: 0.00342*width, y: 0.9284*height))
        path.addCurve(to: CGPoint(x: 0.01072*width, y: 0.97561*height), control1: CGPoint(x: 0.00355*width, y: 0.95472*height), control2: CGPoint(x: 0.00678*width, y: 0.97561*height))
        path.addLine(to: CGPoint(x: 0.99088*width, y: 0.97561*height))
        path.addCurve(to: CGPoint(x: 0.99818*width, y: 0.92683*height), control1: CGPoint(x: 0.99491*width, y: 0.97561*height), control2: CGPoint(x: 0.99818*width, y: 0.95377*height))
        path.addLine(to: CGPoint(x: 0.99818*width, y: 0.60611*height))
        path.addCurve(to: CGPoint(x: 0.99774*width, y: 0.58952*height), control1: CGPoint(x: 0.99818*width, y: 0.60045*height), control2: CGPoint(x: 0.99803*width, y: 0.59484*height))
        path.addLine(to: CGPoint(x: 0.96889*width, y: 0.05658*height))
        path.addCurve(to: CGPoint(x: 0.96203*width, y: 0.02439*height), control1: CGPoint(x: 0.96785*width, y: 0.03726*height), control2: CGPoint(x: 0.96511*width, y: 0.02439*height))
        path.addLine(to: CGPoint(x: 0.03969*width, y: 0.02439*height))
        path.addCurve(to: CGPoint(x: 0.03288*width, y: 0.05572*height), control1: CGPoint(x: 0.03667*width, y: 0.02439*height), control2: CGPoint(x: 0.03396*width, y: 0.03685*height))
        path.addLine(to: CGPoint(x: 0.00235*width, y: 0.58837*height))
        path.addCurve(to: CGPoint(x: 0.00187*width, y: 0.60739*height), control1: CGPoint(x: 0.002*width, y: 0.59444*height), control2: CGPoint(x: 0.00184*width, y: 0.6009*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.00187*width, y: 0.60739*height))
        path.addLine(to: CGPoint(x: 0.00342*width, y: 0.9284*height))
        path.addCurve(to: CGPoint(x: 0.01072*width, y: 0.97561*height), control1: CGPoint(x: 0.00355*width, y: 0.95472*height), control2: CGPoint(x: 0.00678*width, y: 0.97561*height))
        path.addLine(to: CGPoint(x: 0.99088*width, y: 0.97561*height))
        path.addCurve(to: CGPoint(x: 0.99818*width, y: 0.92683*height), control1: CGPoint(x: 0.99491*width, y: 0.97561*height), control2: CGPoint(x: 0.99818*width, y: 0.95377*height))
        path.addLine(to: CGPoint(x: 0.99818*width, y: 0.60611*height))
        path.addCurve(to: CGPoint(x: 0.99774*width, y: 0.58952*height), control1: CGPoint(x: 0.99818*width, y: 0.60045*height), control2: CGPoint(x: 0.99803*width, y: 0.59484*height))
        path.addLine(to: CGPoint(x: 0.96889*width, y: 0.05658*height))
        path.addCurve(to: CGPoint(x: 0.96203*width, y: 0.02439*height), control1: CGPoint(x: 0.96785*width, y: 0.03726*height), control2: CGPoint(x: 0.96511*width, y: 0.02439*height))
        path.addLine(to: CGPoint(x: 0.03969*width, y: 0.02439*height))
        path.addCurve(to: CGPoint(x: 0.03288*width, y: 0.05572*height), control1: CGPoint(x: 0.03667*width, y: 0.02439*height), control2: CGPoint(x: 0.03396*width, y: 0.03685*height))
        path.addLine(to: CGPoint(x: 0.00235*width, y: 0.58837*height))
        path.addCurve(to: CGPoint(x: 0.00187*width, y: 0.60739*height), control1: CGPoint(x: 0.002*width, y: 0.59444*height), control2: CGPoint(x: 0.00184*width, y: 0.6009*height))
        path.closeSubpath()
        return path
    }
}
