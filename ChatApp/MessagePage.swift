//
//  MessagePage.swift
//  ChatApp
//
//  Created by 강현성 on 2021/08/22.
//  Copyright © 2021 Mirror. All rights reserved.
//

import SwiftUI

struct MessagePage: View {
    
    @ObservedObject var message = DataFire()
    
    var name = "hyeonseongkang"
        
    @State var write = ""
    
    var body: some View {
        VStack {
            
            HStack {
                Image("backbutton")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                    .padding(.leading, 20)
                Spacer()
                Image("android-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding(.trailing, 45)
                Spacer()
            }
            
            List(message.chat) { i in
                if i.name == self.name {
                    ListMessage(msg: i.msg, Message: true, time: i.time)
                } else {
                    ListMessage(msg: i.msg, Message: false,  time: i.time)
                }
            }.navigationBarTitle("Chat", displayMode: .inline)
            .listSeparatorStyle(style: .none)
        
            HStack {
                TextField("message...",text: self.$write).padding(10)
                         .background(Color(red: 233.0/255, green: 234.0/255, blue: 243.0/255))
                     .cornerRadius(25)
                
                Button(action: {
                    if self.write.count > 0 {
                        self.message.addInfo(msg: self.write)
                        self.write = ""
                    } else {
                        
                    }
                }) {
                    Image(systemName: "paperplane.fill").font(.system(size: 20))
                        .foregroundColor((self.write.count > 0) ? Color.blue : Color.gray)
                        .rotationEffect(.degrees(50))
                    
                }
            }.padding(20)
        }
    }
}

/*
struct MessagePage_Previews: PreviewProvider {
    static var previews: some View {
        nil
    }
}
*/
struct ListSeparatorStyle: ViewModifier {
    
    let style: UITableViewCell.SeparatorStyle
    
    func body(content: Content) -> some View {
        content
            .onAppear() {
                UITableView.appearance().separatorStyle = self.style
            }
    }
}
 
extension View {
    
    func listSeparatorStyle(style: UITableViewCell.SeparatorStyle) -> some View {
        ModifiedContent(content: self, modifier: ListSeparatorStyle(style: style))
    }
}
