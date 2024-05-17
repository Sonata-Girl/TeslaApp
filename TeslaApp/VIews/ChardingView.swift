//
//  ChardingView.swift
//  TeslaApp
//
//  Created by Sonata Girl on 17.05.2024.
//

import SwiftUI
/// Экран отображения заряда автомобиля
struct ChargingView: View {

    enum Constants {
        static let arrowUpImageName = "chevron.up"
        static let arrowDownImageName = "chevron.down"
        static let arrowLeftImageName = "chevron.left"
        static let settingsImageName = "settingsIcon"
        static let titleText = "CHARGING"
        static let verdanaFont = "Verdana"
        static let carChargingName = "carCharging"
        static let percentNumberText = "65"
        static let percentText = "%"
        static let sliderTreangleImageName = "sliderTreangle"
        static let chargeLimitText = "Set Charge Limit"
        static let bigPlusImageName = "bigPlus"
        static let nearbyChargesText = "Nearby Superchargers"
        static let mintLineImageName = "mintLine"
        static let mintLineLightImageName = "mintLineLight"
    }

    @Environment(\.presentationMode) var presentation

    var body: some View {
        ZStack {
            Color(.appBlack)
            LinearGradient(colors: [.appBlack, .appBlack, .appBlack], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .overlay(alignment: .bottom) {

                }
            VStack {
                getHeader()
                Image(Constants.carChargingName)
                    .overlay(alignment: .bottom) {
                        HStack {
                            Spacer()
                            Text("\(chargeLimitProgress)")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)
                            Text(Constants.percentText)
                                .font(.title)
                                .bold()
                                .foregroundStyle(.gray)
                            Spacer()
                        }
                        .padding(.bottom)
                    }
                    .frame(height: 200)
                ChargingBarView(progress: $chargeLimitProgress)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                    .frame(height: 50)
                HStack {
                    Spacer()
                    VStack {
                        Image(Constants.mintLineLightImageName)
                        Text("75%")
                            .font(.callout)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing, 30)
                    VStack {
                        Image(Constants.mintLineImageName)
                        Text("100%")
                            .font(.callout)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.trailing, 20)
                Slider(value: Binding(
                    get: { Double(self.chargeLimitProgress) },
                    set: { newValue in
                        withAnimation {
                            self.chargeLimitProgress = Int(newValue)
                        }
                    }
                ), in: 0...100, step: 1) {
                }
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .tint(.appBlue)
                .onAppear {
                    UISlider.appearance().setThumbImage(UIImage(named: Constants.sliderTreangleImageName), for: .normal)
                }
                Text(Constants.chargeLimitText)
                    .font(.callout)
                    .foregroundStyle(.gray)

                RoundedRectangle(cornerRadius: 55)
                    .stroke(.black, lineWidth: 3)
                    .blur(radius: 4)
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
                    .shadow(color: .gray.opacity(0.7), radius: 5, x: -5, y: -5)
                    .clipShape(RoundedRectangle(cornerRadius: 55))
                    .frame(height: 150)
                    .padding()
                    .overlay {
                        HStack {
                            Text(Constants.nearbyChargesText)
                                .font(.title2)
                                .foregroundStyle(.white)
                                .bold()
                                .padding(.leading, 30)
                            Button {
                                withAnimation(.linear(duration: 1).delay(0.2)) {
                                    isScreenListOpen.toggle()
                                }

                            } label: {
                                ConvexButtonBlack(buttonImageName: isScreenListOpen ? Constants.arrowDownImageName : Constants.arrowUpImageName, systemImage: true)

                            }
                            .padding(.trailing, 30)
                        }
                    }
                Spacer()
            }
        }
    }

    @State private var progress = 0
    @State private var isScreenShown = true
    @State private var chargeLimitProgress = 0
    @State private var isScreenListOpen = false

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
