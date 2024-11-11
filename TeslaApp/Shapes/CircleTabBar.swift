//
//  CircleTabBar.swift
//  TeslaApp
//
//  Created by Sonata Girl on 17.05.2024.
//

import SwiftUI

struct CircleTabBar: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.addEllipse(in: CGRect(x: 0.00725*width, y: 0, width: 0.98551*width, height: height))
        path.addEllipse(in: CGRect(x: 0.01449*width, y: 0.00735*height, width: 0.97101*width, height: 0.98529*height))
        path.move(to: CGPoint(x: 0.27723*width, y: 0.50454*height))
        path.addCurve(to: CGPoint(x: 0.31009*width, y: 0.53789*height), control1: CGPoint(x: 0.27723*width, y: 0.52289*height), control2: CGPoint(x: 0.29226*width, y: 0.53789*height))
        path.addLine(to: CGPoint(x: 0.45989*width, y: 0.53789*height))
        path.addLine(to: CGPoint(x: 0.45989*width, y: 0.68989*height))
        path.addCurve(to: CGPoint(x: 0.49275*width, y: 0.72323*height), control1: CGPoint(x: 0.45989*width, y: 0.70824*height), control2: CGPoint(x: 0.47467*width, y: 0.72323*height))
        path.addCurve(to: CGPoint(x: 0.52562*width, y: 0.68989*height), control1: CGPoint(x: 0.51084*width, y: 0.72323*height), control2: CGPoint(x: 0.52562*width, y: 0.70824*height))
        path.addLine(to: CGPoint(x: 0.52562*width, y: 0.53789*height))
        path.addLine(to: CGPoint(x: 0.67541*width, y: 0.53789*height))
        path.addCurve(to: CGPoint(x: 0.70828*width, y: 0.50454*height), control1: CGPoint(x: 0.6935*width, y: 0.53789*height), control2: CGPoint(x: 0.70828*width, y: 0.52289*height))
        path.addCurve(to: CGPoint(x: 0.67541*width, y: 0.47119*height), control1: CGPoint(x: 0.70828*width, y: 0.48619*height), control2: CGPoint(x: 0.6935*width, y: 0.47119*height))
        path.addLine(to: CGPoint(x: 0.52562*width, y: 0.47119*height))
        path.addLine(to: CGPoint(x: 0.52562*width, y: 0.31919*height))
        path.addCurve(to: CGPoint(x: 0.49275*width, y: 0.28585*height), control1: CGPoint(x: 0.52562*width, y: 0.3011*height), control2: CGPoint(x: 0.51084*width, y: 0.28585*height))
        path.addCurve(to: CGPoint(x: 0.45989*width, y: 0.31919*height), control1: CGPoint(x: 0.47467*width, y: 0.28585*height), control2: CGPoint(x: 0.45989*width, y: 0.3011*height))
        path.addLine(to: CGPoint(x: 0.45989*width, y: 0.47119*height))
        path.addLine(to: CGPoint(x: 0.31009*width, y: 0.47119*height))
        path.addCurve(to: CGPoint(x: 0.27723*width, y: 0.50454*height), control1: CGPoint(x: 0.29226*width, y: 0.47119*height), control2: CGPoint(x: 0.27723*width, y: 0.48619*height))
        path.closeSubpath()
        return path
    }

}
