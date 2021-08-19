//
//  ContentView.swift
//  ChatApp
//
//  Created by 강현성 on 2021/08/19.
//  Copyright © 2021 Mirror. All rights reserved.
//

import SwiftUI
import FirebaseDatabase

struct ContentView: View {
    
    let ref = Database.database().reference()
    
    var body: some View {
            
        Button(action: {
            self.ref.childByAutoId().setValue(["name" :"hyeonseong", "age" : 25])
        }) {
            Text("InputData")
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
