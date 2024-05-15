//
//  CarSettingsView.swift
//  TeslaApp
//
//  Created by Sonata Girl on 14.05.2024.
//

import SwiftUI
/// Экран настроек машины
struct CarSettingsView: View {

    enum Constants {
        static let contactImageName = "contact"
        static let teslaText = "Tesla"
        static let verdanaFont = "Verdana"
        static let kmText = "187 km"
        static let batteryImageName = "battery.75percent"
        static let carImageName = "myCar"
    }

    @State private var isCarClose = false
    @State private var tagSelected = 0
    @State private var showClimateScreen = false

    var body: some View {
        LinearGradient(colors: [.appBlack, .black, .appBlack, .appBlack], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            .overlay(alignment: .topLeading) {
                VStack {
                    Text(Constants.teslaText)
                        .foregroundStyle(.white)
                        .font(.custom(Constants.verdanaFont, size: 30))
                        .bold()
                        .padding(.leading)
                        .padding(.top)
                        .transition(.scale)
                    HStack {
                        Image(systemName: Constants.batteryImageName)
                            .foregroundStyle(.gray)
                            .padding(.leading)
                        Text(Constants.kmText)
                            .foregroundStyle(.gray)
                            .font(.custom(Constants.verdanaFont, size: 18))
                            .transition(.scale)
                        
                    }
                }
            }
            .overlay(alignment: .topTrailing) {
                Button {
                    
                } label: {
                    ConvexImageButton(buttonImageName: Constants.contactImageName)
                }
                .padding(.top, 8)
            }
            . overlay(alignment: .center) {
                VStack {
                    Image(Constants.carImageName)
                        .neumorphismWhiteShadowStyle()
                    createControlPanelView()
                    
                }
            }
    }

    func createControlPanelView() -> some View {
        HStack(spacing: 30) {
            ForEach(1..<5) { index in
                Button {
                    withAnimation {
                        tagSelected = index
                        if tagSelected == 2 {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                showClimateScreen.toggle()
                            }
                        }
                    }
                } label: {
                    ConvexImageButton(buttonImageName: "control\(index)",
                                      withShadows: false, 
                                      isSelected: tagSelected == index
                    )
                    .frame(width: 50, height: 50)
                }
                .fullScreenCover(isPresented: $showClimateScreen, content: ClimateView.init)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 50).fill(.appBlack))
        .neumorphismVeryLightUnselected()
    }
}

