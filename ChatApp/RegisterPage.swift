//
//  RegisterPage.swift
//  ChatApp
//
//  Created by 강현성 on 2021/08/22.
//  Copyright © 2021 Mirror. All rights reserved.
//

import SwiftUI

struct RegisterPage: View {
    
    @ObservedObject var friendsList = FriendList()
    
    @State var show = false
    @State var image:Data = .init(count:0)
    
    @State var userId: String = ""
    @State var userPhone: String = ""
    @State var userEmail: String = ""
    @State var userName: String = ""
    @State var userPw: String = ""
    @State var userPw2: String = ""
    
    var body: some View {
        NavigationView {
                
            VStack {


                VStack {
                    if self.image.count != 0 {
                        Image(uiImage: UIImage(data: self.image)!).resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            //.overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    } else {
                        Button (action: {
                            self.show.toggle()
                        }) {
                            Image(systemName: "person.badge.plus")
                            .resizable()
                            .frame(width:120, height: 120)
                            //.clipShape(Circle())
                            //.overlay(Circle().stroke(Color.gray, lineWidth:1))
                        }
                    }
                }.padding(.bottom, 30)

                
                VStack {
                    
                    TextField("아이디", text: $userId)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                        
                    
                    SecureField("비밀번호", text:$userPw)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    SecureField("비밀번호 재입력", text:$userPw2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    TextField("이름", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 10)
                    
                    TextField("전화번호", text: $userPhone)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .padding(.bottom, 10)
                    
                    TextField("이메일", text: $userEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .padding(.bottom, 10)
                        
                        
                    
                }.padding([.leading, .trailing], 30)

            
                Button(action: {
                        self.friendsList.addInfo(userId: self.userId, userName: self.userName, userPw: self.userPw, userKey: "", userPhone: self.userPhone, userEmail: self.userEmail, userProfile: UIImage(data: self.image)!)
                }) {
                    Text("회원가입")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 45)
                        .background(Color.blue)
                        .cornerRadius(15.0)
                }
            }
        }.sheet(isPresented: self.$show, content: {
            ImagePicker(show: self.$show, image: self.$image)
        })
    }
}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}


