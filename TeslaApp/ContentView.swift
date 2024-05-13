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

    var body: some View {
        WelcomeView()
    }
}

#Preview {
    ContentView()
}


struct WelcomeView: View {

    enum Constants {
        static let darkCarImageName = "darkCar"
        static let lightCarImageName = "lightCar"
        static let settingsImageName = "settings"
    }

    var body: some View {
//        ZStack {
            LinearGradient(colors: [.appBlack, .black, .black, .black, .appBlack], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .overlay(alignment: .topTrailing) {
                    Button {

                    } label: {
                        Image(Constants.settingsImageName)
                    }
                }
                .overlay(alignment: .center) {
                    Image(Constants.darkCarImageName)
                }
//        }
    }
}

struct NeumorphismUnselected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("lightShadow"), radius: 5, x: -5, y: -5)
            .shadow(color: Color("darkShadow"), radius: 5, x: 5, y: 5)
    }
}

struct NeumorphismSelected: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("lightShadow"), radius: 5, x: 5, y: 5)
            .shadow(color: Color("darkShadow"), radius: 5, x: -5, y: -5)
    }
}

struct NeumorphismUnselectedCircle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.all, 10)
            .background(Circle().fill(.background))
            .shadow(color: Color("lightShadow"), radius: 5, x: 5, y: 5)
            .shadow(color: Color("darkShadow"), radius: 5, x: -5, y: -5)
    }
}

extension View {
    func neumorphismUnselectedStyle() -> some View {
        modifier(NeumorphismUnselected())
    }

    func neumorphismSelectedStyle() -> some View {
        modifier(NeumorphismSelected())
    }

    func neumorphismSelectedCircleStyle() -> some View {
        modifier(NeumorphismUnselectedCircle())
    }
}
