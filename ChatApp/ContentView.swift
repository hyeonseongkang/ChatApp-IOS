//
//  ContentView.swift
//  ChatApp
//
//  Created by 강현성 on 2021/08/19.
//  Copyright © 2021 Mirror. All rights reserved.
//

import SwiftUI
import FirebaseDatabase
import FirebaseStorage

struct ContentView: View {

    let ref = Database.database().reference().child("user")
    @ObservedObject var friendsList = FriendList()
    
    @State var friendCount = 0
    
    @State var name: String = ""
    @State var show = false
    @State var image:Data = .init(count:0)
    
    @State var imagePickerVisible: Bool = false
    @State var selectedImage: Image? = Image(systemName: "photo")
    
    @State var downloadImage : UIImage?
    
    var body: some View {
        
        VStack {
            RegisterPage()
        }
    }
    
    func convertImageToBase64String (img: UIImage) -> String {
        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }

    
    func convertBase64StringToImage (imageBase64String:String) -> Data {
    let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
    return imageData!
    }
    
    func convertBase64ToImage(base64String: String) -> Data {
        
        if base64String == nil {
            print("base64String == nil")
        }
        let decodedData = NSData(base64Encoded: base64String, options: NSData.Base64DecodingOptions(rawValue: 0) )
        return decodedData! as Data

    }
    
    /*
     func convertBase64StringToImage (imageBase64String:String) -> UIImage {
     let imageData = Data.init(base64Encoded: imageBase64String, options: .init(rawValue: 0))
     let image = UIImage(data: imageData!)
     return image!
     }
     */
  

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
         NavigationView {
             ZStack {
                 VStack {
                     
                     RegisterPage()
                     
 //                    ZStack {
 //                        VStack {
 //                            selectedImage?
 //                                .resizable()
 //                                .aspectRatio(contentMode: .fit)
 //
 //                            Button(action: {
 //                                withAnimation {
 //                                    self.imagePickerVisible.toggle()
 //                                }
 //                            }) {
 //                                Text("Select an Image")
 //                            }
 //                        }.padding()
 //
 //                        if(imagePickerVisible) {
 //                            MyImagePicker(imagePickerVisible: $imagePickerVisible, selectedImage: $selectedImage)
 //                        }
 //                    }
                     
 //                    if downloadImage != nil {
 //                        Image(uiImage: downloadImage!)
 //                        .resizable()
 //                        .scaledToFit()
 //                            .frame(width:120, height:120)
 //                    }
                     

              /*
                     List(friendsList.list) { i in
                         
                         //Image(uiImage: UIImage(data: self.convertBase64ToImage(base64String: i.profile))!)
                         
                     }*/
                     
                     
 //                    if self.image.count != 0 {
 //                        Image(uiImage: UIImage(data: self.image)!).resizable()
 //                            .frame(width: 100, height: 100)
 //                            .clipShape(Circle())
 //                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
 //                    } else {
 //                        Button (action: {
 //                            self.show.toggle()
 //                        }) {
 //                            Image(systemName: "person.circle.fill")
 //                            .resizable()
 //                                .frame(width:55, height: 55)
 //                            .clipShape(Circle())
 //                                .overlay(Circle().stroke(Color.gray, lineWidth:1))
 //                        }
 //                    }
 //
 //                    TextField("Username..", text: self.$name).padding()
 //                        .background(Color(red: 230.0/255, green: 234.0/255, blue: 243.0/255))
 //                    .cornerRadius(20)
                     
                     
 //                    Button(action: {
 //                        let a = self.convertImageToBase64String(img: UIImage(data: self.image)!)
 //
 //
 //                        //userId : String, userName: String, userPw : String, userKey: String, userPhone: String, userEmail:  String, userProfile: String
 //
 //                        self.friendsList.addInfo(userId: "aa", userName: "123", userPw: "aaaa", userKey: "aaaaa", userPhone: "12312312", userEmail: "123123", userProfile: UIImage(data: self.image)!)
 //                        //Text(self.convertImageToBase64String(img: UIImage(systemName: self.selectedImage)!))
 //                       // print(self.convertImageToBase64String(img: UIImage(data: self.image)!))
 //                    }) {
 //                        Text("convert")
 //                    }
                     
 //                    Button(action: {
 //                        Storage.storage().reference().child("temp").getData(maxSize: 5 * 1024 * 1024) {
 //                            (imageData, err) in
 //                                if let err = err {
 //                                    print("fail \(err.localizedDescription)")
 //                                } else {
 //                                    if let imageData = imageData {
 //                                         self.downloadImage = UIImage(data: imageData)
 //                                    } else {
 //                                        print("fail2")
 //                                    }
 //
 //                                }
 //
 //                        }
 //                    }) {
 //                        Text("download")
 //                    }
         
                 }
             }
             
         }
 //        .sheet(isPresented: self.$show, content: {
 //            ImagePicker(show: self.$show, image: self.$image)
 //        })
             
 */
