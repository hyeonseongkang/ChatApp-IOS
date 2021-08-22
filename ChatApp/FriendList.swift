//
//  FriendList.swift
//  ChatApp
//
//  Created by 강현성 on 2021/08/21.
//  Copyright © 2021 Mirror. All rights reserved.
//

import Foundation
import Combine
import FirebaseDatabase
import FirebaseStorage

class FriendList : ObservableObject {

    @Published var list = [User]()

    init() {
        let ref = Database.database().reference().child("user")
        ref.observe(DataEventType.childAdded, with: { snapshot in
            let dict = snapshot.value as! [String:AnyObject]
            
            let userId = dict["id"] as? String ?? ""
            let userPw = dict["pw"] as? String ?? ""
            let userName = dict["name"] as? String ?? ""
            let userKey = dict["key"] as? String ?? ""
            let userEmail = dict["email"] as? String ?? ""
            let userPhone = dict["phone"] as? String ?? ""
            let userProfile = dict["profile"] as? String ?? ""
            
            self.list.append(User(id: userId, name: userName, pw: userPw, key: userKey, phone: userPhone, email: userEmail, profile: userProfile))
        })
    }

    func addInfo(userId : String, userName: String, userPw : String, userKey: String, userPhone: String, userEmail:  String, userProfile: UIImage) {
        let ref = Database.database().reference().child("user")
        let key = Database.database().reference().childByAutoId().key

        uploadImage(image: userProfile, userId: userId)
        ref.child(key!).setValue(["id" : userId, "name" : userName, "pw" : userPw, "key": key, "phone": userPhone, "email" : userEmail, "profile" : userId])
        
    }
    
    func uploadImage(image:UIImage, userId: String) {
        if let imageData = image.jpegData(compressionQuality: 1) {
            let storage = Storage.storage()
            storage.reference().child("\(userId)").putData(imageData, metadata: nil) {
                (_, err) in
                if let err = err {
                    print("an error has occured - \(err.localizedDescription)")
                } else {
                    print("Image uploaded Successfully")
                }
            }
        } else {
            print("couldn't unwrap image as data")
        }
    }
}
