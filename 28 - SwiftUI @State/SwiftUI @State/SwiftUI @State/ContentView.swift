//
//  ContentView.swift
//  SwiftUI @State
//
//  Created by Tunde on 28/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading: Bool = false

    private var spinAnimation: Animation {
        Animation
            .easeInOut
            .speed(0.35)
            .repeatCount(isLoading ? .max : 0, autoreverses: false)
    }
    
    var body: some View {
        
        VStack(spacing: 16) {
            
            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                .foregroundColor(.blue)
                .font(.system(size: 16, weight: .black))
                .rotationEffect(Angle.degrees(isLoading ? Double(360) : Angle.zero.degrees))
                .animation(spinAnimation, value: isLoading)
            
            Button(isLoading ? "Stop" : "Start") {
                isLoading.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
