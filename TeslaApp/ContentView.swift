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
//      WelcomeView()
//        TeslaLogoView()
        ChargingView()
    }
}

#Preview {
    ContentView()
}

struct ChargingView: View {

    enum Constants {
        static let arrowLeftImageName = "chevron.left"
        static let arrowRightImageName = "chevron.right"
        static let settingsImageName = "settingsIcon"
        static let titleText = "CHARGING"
        static let verdanaFont = "Verdana"
        static let carChargingName = "carCharging"
        static let percentNumberText = "65"
        static let percentText = "%"
        static let sliderTreangleImageName = "sliderTreangle"
        static let chargeLimitText = "Set Charge Limit"
    }

    @Environment(\.presentationMode) var presentation

    var body: some View {
        //      WelcomeView()
        //        TeslaLogoView()
        ZStack {
            LinearGradient(colors: [.appBlack, .black, .appBlack, .appBlack], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .overlay(alignment: .bottom) {

                }
            VStack {
                getHeader()
                Image(Constants.carChargingName)
                    .overlay(alignment: .bottom) {
                        HStack {
                            Spacer()
                            Text(Constants.percentNumberText)
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)
                            Text(Constants.percentText)
                                .font(.title)
                                .bold()
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                    }
                Slider(value: Binding(
                    get: { Double(self.chargeLimitProgress) },
                    set: { newValue in
                        withAnimation {
                            self.chargeLimitProgress = Int(newValue)
                        }
                    }
                ), in: 0...50, step: 1) {
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .tint(.appBlack)
                .onAppear {
                    UISlider.appearance().setThumbImage(UIImage(named: Constants.sliderTreangleImageName), for: .normal)
                }
                Text(Constants.chargeLimitText)
                    .font(.callout)
                    .foregroundStyle(.gray)
                RoundedRectangle(cornerRadius: 60)
                    .foregroundStyle(LinearGradient(colors: [.appBlack.opacity(0.6), .appBlack], startPoint: .topLeading, endPoint: .bottomTrailing))
//                    .fill(LinearGradient(colors: [.appBlack, .appBlack], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(height: 150)
                    .shadow(color: .black, radius: 3, x: 2, y: 2)
                    .shadow(color: .white, radius: 3, x: -2, y: -2)
                    .blur(radius: 4)
                    .padding()

                Spacer()
                RoundedBottomRectangle()
                    .fill(.linearGradient(colors: [.appBlack, .black], startPoint: .trailing, endPoint: .leading ))
                    .frame(height: 10)
                    .shadow(color: .white.opacity(0.2), radius: 10)
                    .ignoresSafeArea(edges: .bottom)
            }
        }
    }

    @State private var isScreenShown = true
    @State private var chargeLimitProgress = 0

    func getHeader() -> some View {
        HStack {
            Button {
                withAnimation(.linear(duration: 1).delay(0.2)) {
                    isScreenShown.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.presentation.wrappedValue.dismiss()
                }
            } label: {
                ConvexImageButton(buttonImageName: Constants.arrowLeftImageName, systemImage: true)
            }
            .padding(.leading)
            Spacer()
            Text(Constants.titleText)
                .font(.custom(Constants.verdanaFont, size: 20))
                .bold()
                .foregroundStyle(.white)
            Spacer()
            Button {

            } label: {
                ConvexImageButton(buttonImageName: Constants.settingsImageName)
            }
            .padding(.trailing)
        }
    }
}


struct RoundedBottomRectangle: Shape {
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

//struct RoundedBottomRectangle: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//
//        let startPoint = CGPoint(x: 0, y: 0)
//        path.move(to: startPoint)
//        path.addCurve(to: CGPoint(x: 110, y: -35),
//                      control1: CGPoint(x: 10, y: -35),
//                      control2: CGPoint(x: 50, y: -35))
//        path.addLine(to: CGPoint(x: 140, y: -35))
//        path.addCurve(to: CGPoint(x: 190, y: 0),
//                      control1: CGPoint(x: 150, y: -35),
//                      control2: CGPoint(x: 160, y: 0))
//        path.addCurve(to: CGPoint(x: 250, y: -35),
//                      control1: CGPoint(x: 230, y: -0),
//                      control2: CGPoint(x: 240, y: -35))
//        path.addCurve(to: CGPoint(x: rect.width, y: 0),
//                      control1: CGPoint(x: 330, y: -35),
//                      control2: CGPoint(x: 390, y: -35))
//        path.addLine(to: CGPoint(x: rect.width, y: 40))
//        path.addLine(to: CGPoint(x: 0, y: 40))
//        return path
//    }
//}

struct TabItem: Identifiable, Equatable {
    var id = UUID()
    var text: String
    var icon: String
}

struct TabViewCustom<Content: View>: View {
    @Binding  var tableSelection: Int
    @State private var tabs: [TabItem] = [.init(text: "", icon: "carTabBar"),
                                          .init(text: "", icon: "energyTabBar"),
                                          .init(text: "", icon: "locationTabBar"),
                                          .init(text: "", icon: "profileTabBar")]
    private var content: Content

    init(tableSelection: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.content = content()
       _tableSelection = tableSelection
    }

    var body: some View {
        //      WelcomeView()
        //        TeslaLogoView()
        ChargingView()
    }

    private var tabsView: some View {
        ForEach(Array(tabs.enumerated()), id: \.offset) { index, element in
            VStack(spacing: 5) {
                Image(element.icon)
//                Text(element.text)
//                    .foregroundStyle(tableSelection == index ? gradient : .gray)
            }
        }
    }
}

