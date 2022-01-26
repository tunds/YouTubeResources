//
//  BottomFeedView.swift
//  Clubhouse
//
//  Created by Tunde on 01/03/2021.
//

import SwiftUI

struct BottomFeedView: View {
    var body: some View {
        ZStack {
            Image
                .grid
                .font(Font.Nunito.bold(size: 24))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 15)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Label("Start a room", systemImage: "plus")
            })
            .padding(.horizontal, 16)
            .padding(.vertical, 9)
            .font(Font.Nunito.bold(size: 18))
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(21, antialiased: true)
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 105, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color.background.opacity(0.1), Color.background]),
                                  startPoint: .top,
                                  endPoint: .bottom))
    }
}

struct BottomFeedView_Previews: PreviewProvider {
    static var previews: some View {
        BottomFeedView()
            .previewLayout(.sizeThatFits)
    }
}
