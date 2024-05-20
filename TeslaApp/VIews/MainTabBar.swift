//
//  MainTabBar.swift
//  TeslaApp
//
//  Created by Sonata Girl on 17.05.2024.
//

import SwiftUI

struct MainTabBar: View {

    @State var selectionTable = 0

    var body: some View {
        CustomTabView(tableSelection: $selectionTable) {
            if selectionTable == 0 {
                CarSettingsView()
            }
            if selectionTable == 1 {
                ChargingView()
            }
            if selectionTable == 2 {
                Color.black
                    .ignoresSafeArea()
            }
            if selectionTable == 3 {
                Color.black
                    .ignoresSafeArea()
            }
        }
    }
}

struct TabItem: Identifiable, Equatable {
    var id = UUID()
    var text: String
    var icon: String
}

struct CustomTabView<Content: View>: View {

    @Binding  var tableSelection: Int

    init(tableSelection: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.content = content()
        _tableSelection = tableSelection
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            content
            ZStack {
                CircleTabBar()
                    .fill(.linearGradient(colors: [.gray.opacity(0.3)], startPoint: .top, endPoint: .bottom ))
                    .frame(width: 80, height: 80)
                    .background(.black)
                    .clipShape(.circle)
                    .shadow(color: .white, radius: 0.5, x: -1, y: -1)
                    .blur(radius: 1)
                Image("bigPlus")
                    .padding()
            }
            .padding(.bottom, 35)
            RoundedBottomRectangle()
                .frame(height: 90)
                .shadow(color: .white, radius: 0.5, x: 0, y: -1)
                .ignoresSafeArea(edges: .bottom)
                .foregroundStyle(.black)
                .blur(radius: 1)
                .padding(.bottom, -35)
                .overlay(alignment: .bottom) {
                    HStack(spacing: 10) {
                        tabsView
                    }
                    .padding(.bottom, -10)
                }
        }
    }

    @State private var tabs: [TabItem] = [.init(text: "", icon: "carTabBar"),
                                          .init(text: "", icon: "electroTabBar"),
                                          .init(text: "", icon: "locationTabBar"),
                                          .init(text: "", icon: "profileTabBar")]
    private var content: Content

    private var tabsView: some View {
        ForEach(Array(tabs.enumerated()), id: \.offset) { index, element in
            Spacer()
            VStack(spacing: 5) {
                if tableSelection == index {
                    Image(element.icon)
                    //                Text(element.text)
                } else {
                    Image(element.icon)
                        .tint(.appBlue)
                }
            }
            .foregroundStyle(tableSelection == index ? gradient : gradientBlack)
            .background(
                ZStack {
                    if tableSelection == index {
                        Circle()
                            .fill(LinearGradient(colors: [.blue, .appDarkBlue], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(2)
                            .blur(radius: 4)
                            .frame(width: 50, height: 50)
                            .shadow(color: .appBlue, radius: 20, x: 0, y: 0)
                    }
                }
            )
            .onTapGesture {
                withAnimation {
                    tableSelection = index
                }
            }
            Spacer()
        }
    }
}
