//
//  ListMessage.swift
//  ChatApp
//
//  Created by 강현성 on 2021/08/22.
//  Copyright © 2021 Mirror. All rights reserved.
//

import Foundation
import SwiftUI

struct ListMessage: View {
    
    var msg = ""
    var Message = false
    var time = ""
    
    var body: some View {
        HStack {
            if Message {
                Spacer()
                
                VStack {
                    HStack {
                        Spacer()
                        Text(msg).padding([.leading, .trailing],20).padding([.top, .bottom], 10).background(Color.blue)
                             .cornerRadius(10)
                                 .foregroundColor(.white)
                    }
     
                    
                    HStack {
                        Spacer()
                        Text(time).font(.system(size: 12))
                                        .foregroundColor(Color(UIColor.lightGray))
                    }
            
                    
                }
            } else {
                VStack {
                    HStack{
                        Text(msg).padding([.leading, .trailing],20).padding([.top, .bottom], 10).background(Color.secondary)
                                 .cornerRadius(10)
                                     .foregroundColor(.white)
                        Spacer()
                    }
      
                    
                    HStack {
                        Text(time).font(.system(size: 12))
                                 .foregroundColor(Color(UIColor.lightGray))
                        Spacer()
                    }
     
                }
                
                Spacer()
            }
        }
    }
}
