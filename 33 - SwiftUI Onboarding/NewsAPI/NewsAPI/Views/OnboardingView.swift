//
//  OnboardingView.swift
//  NewsAPI
//
//  Created by Tunde on 29/03/2021.
//

import SwiftUI

struct OnboardingItem: Codable, Identifiable {
    
    var id = UUID()
    var title: String?
    var content: String?
    var sfSymbol: String?
    
    enum CodingKeys: String, CodingKey {
        case title, content, sfSymbol
    }
    
    init(title: String, content: String, sfSymbol: String) {
        self.title = title
        self.content = content
        self.sfSymbol = sfSymbol
    }
    
    init(from decoder: Decoder) throws {
        
        do {
            
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.title = try container.decode(String.self, forKey: .title)
            self.content = try container.decode(String.self, forKey: .content)
            self.sfSymbol = try container.decode(String.self, forKey: .sfSymbol)
            
        } catch {
            print(error)
        }
    }
}


typealias OnboardingGetStartedAction = () -> Void

struct OnboardingScreenView: View {
    
    
    let manager: OnboardingContentManager

    @State private var selected = 0
    
    let handler: OnboardingGetStartedAction

    internal init(manager: OnboardingContentManager,
                 handler: @escaping OnboardingGetStartedAction) {
        self.manager = manager
        self.handler = handler
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selected) {
                
                ForEach(manager.items.indices) { index in
                    OnboardingView(item: manager.items[index],
                                   index: $selected,
                                   limit: manager.limit,
                                   handler: handler)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}

struct OnboardingView: View {

    @Environment(\.presentationMode) var presentationMode
    
    let handler: OnboardingGetStartedAction
    let item: OnboardingItem
    let limit: Int
    @Binding var index: Int
    
    internal init(item: OnboardingItem,
                  index: Binding<Int>,
                  limit: Int,
                  handler: @escaping OnboardingGetStartedAction) {
        self.handler = handler
        self.item = item
        self._index = index
        self.limit = limit
    }
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Image(systemName: item.sfSymbol ?? "")
                .padding(.bottom, 50)
                .font(.system(size: 120,
                              weight: .heavy))
            
            Text(item.title ?? "")
                .font(.system(size: 32, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.bottom, 2)
                .foregroundColor(Theme.textColor)
            
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
        OnboardingView(item: OnboardingItem(title: "Title Here", content: "Content Here", sfSymbol: "newspaper"), index: .constant(0), limit: 1) { }
        OnboardingScreenView(manager: OnboardingContentManagerImpl(manager: PlistManagerImpl())) {}
    }
}
