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
        ClimateView()
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
    }

    @State private var progress = 0

    var body: some View {
        LinearGradient(colors: [.appBlack, .black, .appBlack], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            .overlay(alignment: .topLeading) {
                VStack {
                    getHeader()
                    Spacer()
                        .frame(height: 100)
                    CircularProgressView(progress: $progress)
                }
            }
            .overlay(alignment: .center) {

            }
            .overlay(alignment: .bottom) {
                DisclosureGroup(
                    content: {
                        HStack {
                            Text("Ac")
                                .frame(width: 40)
                                .foregroundStyle(.gray)
                            ConvexImageButton(buttonImageName: Constants.acImage, withShadows: false)
                            Slider(value: Binding(
                                get: { Double(self.progress) },
                                set: { newValue in
                                    self.progress = Int(newValue)
                                }
                            ), in: 0...15, step: 1) {
                                Text(String(progress))
                            }
                            .padding(.horizontal)
                            .tint(.appBlue)
                            .onAppear {
                                UISlider.appearance().setThumbImage(UIImage(named: "sliderIcon"), for: .normal)
                            }
                        }
                        .frame(height: 70)
                        HStack {
                            Text("Fan")
                                .frame(width: 40)
                                .foregroundStyle(.gray)
                            ConvexImageButton(buttonImageName: Constants.fanImage, withShadows: false)
                            Slider(value: Binding(
                                get: { Double(self.progress) },
                                set: { newValue in
                                    self.progress = Int(newValue)
                                }
                            ), in: 0...15, step: 1) {
                                Text(String(progress))
                            }
                            .padding(.horizontal)
                            .tint(.appBlue)
                        }
                        .frame(height: 70)
                        HStack {
                            Text("Heat")
                                .frame(width: 40)
                                .foregroundStyle(.gray)
                            ConvexImageButton(buttonImageName: Constants.heatImage, withShadows: false)
                            Slider(value: Binding(
                                get: { Double(self.progress) },
                                set: { newValue in
                                    self.progress = Int(newValue)
                                }
                            ), in: 0...15, step: 1) {
                                Text(String(progress))
                            }
                            .padding(.horizontal)
                            .tint(.appBlue)
                        }
                        .frame(height: 70)
                        HStack {
                            Text("Auto")
                                .frame(width: 40)
                                .foregroundStyle(.gray)
                            ConvexImageButton(buttonImageName: Constants.autoImage, withShadows: false)
                            Slider(value: Binding(
                                get: { Double(self.progress) },
                                set: { newValue in
                                    self.progress = Int(newValue)
                                }
                            ), in: 0...15, step: 1) {
                                Text(String(progress))
                            }
                            .padding(.horizontal)
                            .tint(.appBlue)
                        }
                        .frame(height: 70)
                    },
                    label: { Text("") }
                )
                .tint(.white)
                .padding(.all)
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

            } label: {
                ConvexImageButton(buttonImageName: Constants.settingsImageName)
            }
            .padding(.trailing)
        }
    }
}

