//
//  LightBulbView.swift
//  SwiftUI @State
//
//  Created by Tunde on 03/07/2021.
//

import SwiftUI

struct LightBulbView: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        Image(systemName: isOn ? "lightbulb.fill" : "lightbulb" )
            .font(.system(size: 150, weight: .bold))
    }
}

struct LightBulbView_Previews: PreviewProvider {
    static var previews: some View {
        LightBulbView(isOn: .constant(false))
    }
}
