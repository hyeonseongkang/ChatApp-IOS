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
 
    
            
            //self.ref.childByAutoId().setValue(["name" :"hyeonseong", "age" : 25])
        }) {
            Text("InputData")
        }
    
    }
    
    func convertImageToBase64String (img: UIImage) -> String {
        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
    
    func convertBase64StringToImage (imageBase64String:String) -> UIImage {
    let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
    let image = UIImage(data: imageData!)
    return image!
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
