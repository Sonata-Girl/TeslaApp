//
//  ContentView.swift
//  TeslaApp
//
//  Created by Sonata Girl on 13.05.2024.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentMenuOffsetY: CGFloat = 0.0
    
    @State var selectedFood: String = "Drinks"
    @State private var selected = "Food"
    @State private var menu = ["Drinks", "Food", "Bakary"]
    let lineWidth: CGFloat = 0.0
    var body: some View {
//      WelcomeView()
//        TeslaLogoView()
        VStack {
            Spacer()
            RoundedBottomRectangle(curvedOffset: 30)
                .fill(gradient)
                .frame(height: 120)
                .shadow(radius: 8)
                .overlay {
                    Text("SwiftUI")
                        .font(.largeTitle)
                        .padding(.top)
                }
                .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    ContentView()
}


struct RoundedBottomRectangle: Shape {

    var curvedOffset: CGFloat = 10
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY),
                          control: CGPoint(x: rect.midX, y: rect.maxY + curvedOffset))
        path.addLine(to: CGPoint(x: 0, y: 0))

        return path
    }
}
