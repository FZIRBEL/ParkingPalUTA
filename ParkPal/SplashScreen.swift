//
//  SplashScreen.swift
//  ParkPal
//
//  Created by Fred Zirbel on 10/7/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size: CGFloat = 0.2
    @State private var opacity: Double = 0.0

    var body: some View {

        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    Image("PP")
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.35
                        self.opacity = 1
                    }
                }
            }
        }
    }
}
#Preview {
    SplashScreen()
}
