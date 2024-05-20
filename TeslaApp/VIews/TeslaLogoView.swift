//
//  TeslaLogoView.swift
//  TeslaApp
//
//  Created by Sonata Girl on 14.05.2024.
//

import SwiftUI
/// Экран заставки
struct TeslaLogoView: View {

    var body: some View {
        LinearGradient(
            colors: [.appBlack, .black, .appBlack],
            startPoint: .top, endPoint: .bottom
        )
        .ignoresSafeArea()
        .overlay {
            ZStack {
                if !showWelcomeScreen {
                    VStack {
                        GeometryReader { geo in
                            if isLogoShown {
                                TeslaLogo()
                                    .colorMultiply(.appMint)
                                    .transition(.opacity)
                            }
                        }
                        .foregroundStyle(.linearGradient(
                            colors: [.appBlue, .appMint],
                            startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 300, height: 300)
                        .shadow(color: .mint, radius: 10)
                    }
                    .onAppear {
                        withAnimation(.linear(duration: 2).delay(0.2)) {
                            self.isLogoShown.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.linear(duration: 2).delay(0.2)) {
                                self.isLogoShown.toggle()
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation(.linear(duration: 1).delay(0.2)) {
                                self.showWelcomeScreen.toggle()
                            }
                        }
                    }
                }
                if showWelcomeScreen {
                    WelcomeView()
                }
            }
        }
    }

    @State private var isLogoShown = false
    @State private var showWelcomeScreen = false
}
