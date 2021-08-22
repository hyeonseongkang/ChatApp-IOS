//
//  LoginPage.swift
//  ChatApp
//
//  Created by 강현성 on 2021/08/22.
//  Copyright © 2021 Mirror. All rights reserved.
//

import SwiftUI

struct LoginPage: View {
    
    @State var userName: String = ""
    @State var passWord: String = ""
    
    var body: some View {
        VStack {
            UserImage()
            
            VStack {
                TextField("UserName", text:$userName)
                .padding()
                    .background(Color(UIColor.lightGray))
                    .cornerRadius(20)
                    .padding(.bottom, 10)
                
                SecureField("Password", text: $passWord)
                .padding()
                    .background(Color(UIColor.lightGray))
                    .cornerRadius(20)
                    .padding(.bottom, 10)
            }.padding([.leading, .trailing], 30)

        
            Button(action: {
                
            }) {
                Text("로그인")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 45)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}


struct UserImage: View {
    var body: some View {
        Image("ios-logo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipped()
            .padding(.bottom, 30)
            .cornerRadius(20.0)
    }
}

