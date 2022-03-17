//
//  HomeView.swift
//  Firebase User Account Management
//
//  Created by Tunde on 22/05/2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var service: SessionServiceImpl
    
    var body: some View {
            VStack(alignment: .leading,
                   spacing: 16) {
                
                VStack(alignment: .leading,
                       spacing: 16) {
                    Text("First Name: \(service.userDetails?.firstName ?? "N/A")")
                    Text("Last Name: \(service.userDetails?.lastName ?? "N/A")")
                    Text("Occupation: \(service.userDetails?.occupation ?? "N/A")")
                    Text("Gender: \(service.userDetails?.gender ?? "N/A")")
                }
                    
                    ButtonView(title: "Logout") {
                        service.logout()
                    }
                
            }
            .padding(.horizontal, 16)
            .navigationTitle("Main ContentView")        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(SessionServiceImpl())
        }
    }
}
