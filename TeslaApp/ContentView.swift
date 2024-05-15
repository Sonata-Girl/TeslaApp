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
    enum Constants {
        static let arrowLeftImageName = "chevron.left"
        static let settingsImageName = "settingsIcon"
        static let climateText = "CLIMATE"
        static let verdanaFont = "Verdana"
        static let acImage = "cold"
        static let fanImage = "wind"
        static let heatImage = "water"
        static let autoImage = "auto"
        static let teslaSupportText = "Tesla Support"
        static let clickText = "click here"
        static let acOnText = "A/C is ON"
        static let onButtonInfo = "Tap to turn off or swipe up\n for a fast setup"

    }
}

#Preview {
    ContentView()
}

struct ClimateView: View {

    enum Constants {
        static let arrowLeftImageName = "chevron.left"
        static let settingsImageName = "settingsIcon"
        static let climateText = "CLIMATE"
        static let verdanaFont = "Verdana"
        static let acImage = "cold"
        static let fanImage = "wind"
        static let heatImage = "water"
        static let autoImage = "auto"
        static let teslaSupportText = "Tesla Support"
        static let clickText = "click here"
        static let acOnText = "A/C is ON"
        static let onButtonInfo = "Tap to turn off or swipe up\n for a fast setup"
        static let powerOffButtonName = "power"
    }

    @State private var progress = 0
    @State private var expandedGroup = true
    @State private var isAlertLinkShown = false
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentBottomScreenOffset: CGFloat = 0.0
    @State private var lastBottomScreenOffset: CGFloat = 0.0
    @State private var isClimateOn = false
    @State private var selectedColor = Color.blue

    var dragGesture: some Gesture {
        DragGesture()
            .updating($gestureOffset) { value, state, transaction in
                state = value.translation
                DispatchQueue.main.async {
                    currentBottomScreenOffset = gestureOffset.height + lastBottomScreenOffset
                }
            }
            .onEnded { value in
                withAnimation {
                    DispatchQueue.main.async {
                        lastBottomScreenOffset = currentBottomScreenOffset
                    }
                }
            }
    }

    var supportAlertView: some View {
        VStack {
            if let url = URL(string: "https://www.tesla.com/support") {
                Link(destination: url, label: {
                    Text(Constants.teslaSupportText)
                })
                .foregroundStyle(.appBlue)
                .font(.custom(Constants.verdanaFont, size: 20))
                .bold()
                .padding(.top)
            }
            Text(Constants.clickText)
                .foregroundStyle(.gray)
                .font(.custom(Constants.verdanaFont, size: 14))
            Button(role: .cancel) {
                withAnimation {
                    isAlertLinkShown.toggle()
                }
            } label: {
                Text("Ok")
                    .foregroundStyle(.white)
                    .font(.custom(Constants.verdanaFont, size: 18))
                    .bold()
            }
            .foregroundStyle(.white)
            .padding(.top)
        }
        .frame(width: 250, height: 150)
        .background(RoundedRectangle(cornerRadius: 20).fill(.linearGradient(colors: [.appBlack, .black], startPoint: .topLeading, endPoint: .bottomTrailing)))
        .padding(.top, 100)
        .shadow(color: .white, radius: 2)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.appBlack, .black, .appBlack], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .overlay(alignment: .top) {
                    VStack {
                        getHeader()
                        Spacer()
                            .frame(height: 100)
                        CircularProgressView(progress: $progress, color: $selectedColor)
                        DisclosureGroup("", isExpanded: $expandedGroup) {
                            ControlBlockView(imageName: Constants.acImage, title: "Ac", progress: $progress)
                                .frame(height: 70)
                            ControlBlockView(imageName: Constants.fanImage, title: "Fan", progress: $progress)
                                .frame(height: 70)
                            ControlBlockView(imageName: Constants.heatImage, title: "Heat", progress: $progress)
                                .frame(height: 70)
                            ControlBlockView(imageName: Constants.autoImage, title: "Auto", progress: $progress)
                                .frame(height: 70)
                        }
                        .tint(.white)
                        .padding(.all)
                    }
                }
                .overlay(alignment: .bottom, content: {
                    getBottomScreen()
                })
                .blur(radius: isAlertLinkShown ? 50 : 0)
            if isAlertLinkShown {
                supportAlertView
                    .transition(.opacity)
                    .zIndex(1)
            }
        }
    }

    func getHeader() -> some View {
        HStack {
            Button {

            } label: {
                ConvexImageButton(buttonImageName: Constants.arrowLeftImageName, systemImage: true)
            }
            .padding(.leading)
            Spacer()
            Text(Constants.climateText)
                .font(.custom(Constants.verdanaFont, size: 20))
                .bold()
                .foregroundStyle(.white)
            Spacer()
            Button {
                withAnimation {
                    isAlertLinkShown.toggle()
                }
            } label: {
                ConvexImageButton(buttonImageName: Constants.settingsImageName)
            }
            .padding(.trailing)
        }
    }

    func getBottomScreen() -> some View {
        RoundedRectangle(cornerRadius: 25)
            .overlay(alignment: .top)  {
                VStack {
                    Capsule()
                        .fill(.black)
                        .frame(width: 80, height: 3)
                        .padding(.top)
                    HStack {
                        VStack(alignment: .leading) {
                            Text(Constants.acOnText)
                                .font(.custom(Constants.verdanaFont, size: 20))
                                .bold()
                                .foregroundStyle(.white)
                            Text(Constants.onButtonInfo)
                                .font(.custom(Constants.verdanaFont, size: 18))
                                .foregroundStyle(.gray)
                        }
                        .padding(.leading)
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isClimateOn.toggle()
                            }
                        }, label: {
                            OnOffButton(isSelected: $isClimateOn)
                        })
                        .padding(.trailing)
                    }
                    HStack {
                        ColorPicker(selection: $selectedColor, label: {
                            Text("")
                        })
                    }
                    Spacer()
                }
            }
            .foregroundStyle(.linearGradient(colors: [.appBlack, .black], startPoint: .top, endPoint: .bottom))
            .frame(height: UIScreen.main.bounds.height + 100)
            .ignoresSafeArea(.all, edges: .bottom)
            .offset(y: UIScreen.main.bounds.height)
            .offset(y: currentBottomScreenOffset)
            .gesture(dragGesture)
    }
}

