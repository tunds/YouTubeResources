//
//  OnboardingView.swift
//  Onboarding
//
//  Created by Tunde on 04/04/2021.
//

import SwiftUI

typealias OnboardingGetStartedAction = () -> Void

struct OnboardingView: View {

    @Environment(\.presentationMode) private var presentationMode
    
    let item: OnboardingItem
    
    let limit: Int
    let handler: OnboardingGetStartedAction
    @Binding var index: Int
    
    init(item: OnboardingItem,
                  limit: Int,
                  index: Binding<Int>,
                  handler: @escaping OnboardingGetStartedAction) {
        self.item = item
        self.limit = limit
        self._index = index
        self.handler = handler
    }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            item.asset?.content
            
            Text(item.title ?? "")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.bottom, 2)
                .foregroundColor(.black)
            
            Text(item.content ?? "")
                .font(.system(size: 12, weight: .regular))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .foregroundColor(.gray)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                handler()
            }, label: {
                Text("Get Started")
            })
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.white)
            .padding(.horizontal, 25)
            .padding(.vertical, 10)
            .background(Color.blue)
            .clipShape(Capsule())
            .padding(.top, 50)
            .opacity(index == limit ? 1 : 0)
            .allowsHitTesting(index == limit)
            .animation(.easeInOut(duration: 0.25))
        }
        .padding(.bottom, 150)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(item: OnboardingItem(title: "Dummy",
                                            content: "Dummy Content",
                                            asset: Asset(name: "stars", type: .image)),
                       limit: 0,
                       index: .constant(0)) { }
    }
}
