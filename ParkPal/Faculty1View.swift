//
//  Faculty1View.swift
//  ParkPal
//
//  Created by Fred Zirbel on 10/8/23.
//

import SwiftUI

struct Faculty1View: View {
    
    var body: some View {
        ZStack {
            // This will cover the whole screen with the gradient background
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            Text("Faculty")
                .foregroundStyle(.black)
                .font(.custom("Gilgan", size: 40))
                .padding(.bottom, 730)
        }
    }
}

#if DEBUG
struct Faculty1View_Previews: PreviewProvider {
    static var previews: some View {
        Faculty1View()
    }
}
#endif
