//
//  View+Extension.swift
//  TeslaApp
//
//  Created by Sonata Girl on 14.05.2024.
//

import SwiftUI

extension View {

    func backgroundStackView<Content: View>(content: () -> Content) -> some View {
        ZStack {
            Rectangle()
                .fill(.appBlack)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            content()
        }

    }
    
    var gradient: LinearGradient {
        LinearGradient(colors: [.appMint, .appBlue], startPoint: .bottom, endPoint: .top)
    }
    
    func neumorphismUnselectedStyle() -> some View {
        modifier(NeumorphismUnselected())
    }

    func neumorphismUnselectedLightStyle() -> some View {
        modifier(NeumorphismLightUnselected())
    }

    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }

    func neumorphismSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnselectedCircle())
    }

    func neumorphismWhiteShadowStyle() -> some View {
        modifier(NeumorphismWhiteShadowStyle())
    }

    func neumorphismVeryLightUnselected() -> some View {
        modifier(NeumorphismVeryLightUnselected())
    }

    func neumorphismVeryLightBigShadow() -> some View {
        modifier(NeumorphismVeryLightBigShadow())
    }

    func neumorphismLightStyle() -> some View {
        modifier(NeumorphismLightStyle())
    }

}

struct NeumorphismLightStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .white.opacity(0.6), radius: 2)
    }
}

struct NeumorphismVeryLightBigShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .gray.opacity(0.7), radius: 15, x: -15, y: -15)
            .shadow(color: .appBlack, radius: 40, x: 5, y: 5)
    }
}

struct NeumorphismWhiteShadowStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .white, radius: 10, x: -5, y: -5)
            .shadow(color: .black, radius: 10, x: 3, y: 3)
    }
}

struct NeumorphismLightUnselected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .white, radius: 5, x: -5, y: -5)
            .shadow(color: .black, radius: 5, x: 5, y: 5)
    }
}

struct NeumorphismVeryLightUnselected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .gray.opacity(0.5), radius: 5, x: -5, y: -5)
            .shadow(color: .black, radius: 5, x: 5, y: 5)
    }
}

struct NeumorphismUnselected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .white, radius: 10, x: -5, y: -5)
            .shadow(color: .black, radius: 10, x: 3, y: 3)
    }
}

struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
            .shadow(color: .black, radius: 5, x: -5, y: -5)
    }
}

struct NeumorphismUnselectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(.appBlack))
            .neumorphismUnselectedLightStyle()
    }
}
