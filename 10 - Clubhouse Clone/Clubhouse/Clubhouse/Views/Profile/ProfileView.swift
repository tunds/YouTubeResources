//
//  ProfileView.swift
//  Clubhouse
//
//  Created by Tunde on 02/03/2021.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading) {
                ProfileHeaderView { action in
                    switch action {
                    case .back:
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                Group {
                    Image
                        .profile_pic
                        .resizable()
                        .frame(width: 76, height: 76)
                        .cornerRadius(30)
                    Text("Tunde Adegoroye")
                        .font(Font.Nunito.bold(size: 16))
                    Text("@tundsdev")
                        .font(Font.Nunito.bold(size: 12))
                        .padding(.top, 1)
                    
                    HStack {
                        
                        HStack(spacing: 0) {
                            Text("117")
                                .font(Font.Nunito.extraBold(size: 16))
                                .padding(.trailing, 5)
                            Text("followers")
                                .font(Font.Nunito.regular(size: 12))
                        }
                        .padding(.trailing, 30)
                    
                        HStack(spacing: 0)  {
                            
                            Text("21")
                                .font(Font.Nunito.extraBold(size: 16))
                                .padding(.trailing, 5)
                            
                            Text("followers")
                                .font(Font.Nunito.extraBold(size: 12))
                        }
                    }
                    .padding(.top, 15)
                    
                    Text("Lead App Developer | YouTuber teaching iOS Development on my channel called tundsdev\n\n https://youtube.com/c/tundsdev")
                        .padding(.top, 10)
                        .font(Font.Nunito.semiBold(size: 14))
                    
                    HStack(alignment: .top) {
                        Image("person_0")
                            .resizable()
                            .frame(width: 38, height: 38)
                            .cornerRadius(15)
                        VStack(alignment: .leading) {
                            Text("Joined 18 Dec 2020")
                                .font(Font.Nunito.regular(size: 12))
                            Text("Nominated by ")
                                .font(Font.Nunito.regular(size: 12)) +
                            Text("Crystal Burns")
                                .font(Font.Nunito.bold(size: 12))
                        }
                    }
                    .padding(.top, 38)
                }
                .foregroundColor(Color.textBlack)
                .padding(.horizontal, 15)
 
                Spacer()
            }
            .padding(.top, 65)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.background)
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
