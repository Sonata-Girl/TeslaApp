//
//  WelcomeView.swift
//  TeslaApp
//
//  Created by Sonata Girl on 14.05.2024.
//

import SwiftUI
/// Экран приветствия
struct WelcomeView: View {

    enum Constants {
        static let darkCarImageName = "darkCar"
        static let lightCarImageName = "lightCar"
        static let settingsImageName = "settingsButton"
        static let settingsIconImageName = "settingsIcon"
        static let lockImageName = "lock"
        static let unlockImageName = "unlock"
        static let verdanaFont = "Verdana"
        static let hiText = "Hi"
        static let welcomeText = "Welcome back"
    }

    var body: some View {
        LinearGradient(colors: [.appBlack, .black, .appBlack], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            .overlay(alignment: .topTrailing) {
                Button {

                } label: {
                    ConvexImageButton(buttonImageName: Constants.settingsIconImageName)
                        .padding(.top, 50)
                }
            }
            .overlay(alignment: .center) {
                VStack {
                    if isUnlock {
                        Text(Constants.hiText)
                            .foregroundStyle(.gray)
                            .font(.custom(Constants.verdanaFont, size: 18))
                            .transition(.scale)
                        Text(Constants.welcomeText)
                            .foregroundStyle(.white)
                            .font(.custom(Constants.verdanaFont, size: 35))
                            .bold()
                            .padding(.top)
                            .transition(.scale)
                    }

                    if isUnlock {
                        Image(Constants.lightCarImageName)
                            .resizable()
                            .padding(.leading, 10)
                            .transition(.opacity)
                            .frame(width: 400, height: 300)
                            .neumorphismUnselectedStyle()
                    } else {
                        Image(Constants.darkCarImageName)
                            .resizable()
                            .padding(.top, 45)
                            .frame(width: 400, height: 300)
                            .transition(.opacity)
                    }
                }
            }
            .overlay(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 178,height: 77)
                    .foregroundStyle(LinearGradient(colors: [.black, .appBlack.opacity(0.2), .gray.opacity(0.1)], startPoint: .topLeading, endPoint: .bottom))
                    .overlay(alignment: .trailing) {
                        Button {
                            withAnimation(.easeIn(duration: 1)) {
                                isUnlock.toggle()
                            }
                        } label: {
                            if isUnlock {
                                ConvexImageButton(buttonImageName: Constants.unlockImageName)
                            } else {
                                ConvexImageButton(buttonImageName: Constants.lockImageName)
                            }
                        }
                    }
                    .overlay(alignment: .leading) {
                        if isUnlock {
                            Text(Constants.lockImageName.localizedCapitalized)
                                .foregroundStyle(.white)
                                .font(.custom(Constants.verdanaFont, size: 18))
                                .bold()
                                .padding(.leading)
                        } else {
                            Text(Constants.unlockImageName.localizedCapitalized)
                                .foregroundStyle(.white)
                                .font(.custom(Constants.verdanaFont, size: 18))
                                .bold()
                                .padding(.leading)
                        }
                    }
                    .shadow(color: .black, radius: 2, x: 3, y: 3)
                    .padding(100)

            }
            .ignoresSafeArea()
    }

    @State private var isUnlock = false

}
