//
//  ClimateView.swift
//  TeslaApp
//
//  Created by Sonata Girl on 15.05.2024.
//

import SwiftUI

/// Экран настроек климата
struct ClimateView: View {

    enum Constants {
        static let arrowLeftImageName = "chevron.left"
        static let arrowRightImageName = "chevron.right"
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
        static let plusImageName = "plus"
    }

    @Environment(\.presentationMode) var presentation

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
                        if isScreenShown {
                            VStack {
                                getHeader()
                                Spacer()
                                    .frame(height: 100)
                                CircularProgressView(progress: $progress, color: $selectedColor, isClimateOn: $isClimateOn)
                                DisclosureGroup("", isExpanded: $expandedGroup) {
                                    ControlBlockView(imageName: Constants.acImage, title: "Ac", progress: $progress, color: $selectedColor, isClimateOn: $isClimateOn)
                                        .frame(height: 70)
                                    ControlBlockView(imageName: Constants.fanImage, title: "Fan", progress: $progressTwo, color: $selectedColor, isClimateOn: $isClimateOn)
                                        .frame(height: 70)
                                    ControlBlockView(imageName: Constants.heatImage, title: "Heat", progress: $progressTwo, color: $selectedColor, isClimateOn: $isClimateOn)
                                        .frame(height: 70)
                                    ControlBlockView(imageName: Constants.autoImage, title: "Auto", progress: $progressTwo, color: $selectedColor, isClimateOn: $isClimateOn)
                                        .frame(height: 70)
                                }
                                .tint(.white)
                                .padding(.all)
                            }
                        }
                    }
                    .overlay(alignment: .bottom, content: {
                        if isScreenShown {
                            BottomClimateView(
                                currentBottomScreenOffset: $currentBottomScreenOffset,
                                selectedColor: $selectedColor,
                                isClimateOn: $isClimateOn,
                                progress: $progress)
                        }
                    })
                    .blur(radius: isAlertLinkShown ? 50 : 0)
                if  isAlertLinkShown {
                    supportAlertView
                        .transition(.opacity)
                        .zIndex(1)
                }
            }
            .transition(.opacity)
    }

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

    @State private var progress = 0
    @State private var progressTwo = 0
    @State private var expandedGroup = true
    @State private var isAlertLinkShown = false
    @GestureState private var gestureOffset = CGSize.zero
    @State private var currentBottomScreenOffset: CGFloat = 0.0
    @State private var lastBottomScreenOffset: CGFloat = 0.0
    @State private var isClimateOn = false
    @State private var selectedColor = Color.blue
    @State private var isScreenShown = true

}
