//
//  TeslaLogoView.swift
//  TeslaApp
//
//  Created by Sonata Girl on 14.05.2024.
//

import SwiftUI

struct TeslaLogoView: View {

    var body: some View {
        GeometryReader { geo in
            TeslaLogo()
        }
        .frame(width: 300, height: 400)
    }


}
