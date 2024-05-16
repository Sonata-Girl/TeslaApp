//
//  BottomClimateView.swift
//  TeslaApp
//
//  Created by Sonata Girl on 16.05.2024.
//

import SwiftUI
/// Нижний выдвигающийся экран настроек климата
struct BottomClimateView: View {

    enum Constants {
        static let arrowLeftImageName = "chevron.left"
        static let arrowRightImageName = "chevron.right"
        static let verdanaFont = "Verdana"
        static let acOnText = "A/C is ON"
        static let onButtonInfo = "Tap to turn off or swipe up\n for a fast setup"
    }

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

    @Binding var currentBottomScreenOffset: CGFloat
    @Binding var selectedColor: Color
    @Binding var isClimateOn: Bool
    @Binding var progress: Int

    var body: some View {

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
                        .labelsHidden()
                        .padding(.horizontal)
                        Spacer()
                            .frame(width: 50)
                        Button(action: {
                            if isClimateOn && progress >= 1 {
                                withAnimation {
                                    progress -= 1
                                }
                            }
                        }, label: {
                            Image(systemName: Constants.arrowLeftImageName)

                        })
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        Text("\(progress + 15)°")
                            .font(.custom(Constants.verdanaFont, size: 25))
                            .bold()
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                        Button(action: {
                            if isClimateOn && progress < 15 {
                                withAnimation {
                                    progress += 1
                                }
                            }
                        }, label: {
                            Image(systemName: Constants.arrowRightImageName)
                        })
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        Spacer()
                        Image("vent")
                            .foregroundStyle(.gray)
                            .padding(.trailing)
                    }
                    HStack {
                        Text(isClimateOn ? "On" : "Off")
                            .font(.custom(Constants.verdanaFont, size: 17))
                            .foregroundStyle(isClimateOn ? .white : .gray)
                            .padding(.leading)
                        Spacer()
                        Text("Vent")
                            .font(.custom(Constants.verdanaFont, size: 17))
                            .foregroundStyle(isClimateOn ? .white : .gray)
                            .padding(.trailing)
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

    @GestureState private var gestureOffset = CGSize.zero
    @State private var lastBottomScreenOffset: CGFloat = 0.0

}
