//
//  FriendPage.swift
//  ChatApp
//
//  Created by 강현성 on 2021/08/21.
//  Copyright © 2021 Mirror. All rights reserved.
//

import Foundation
import Combine
import FirebaseDatabase

class FriendPage: ObservableObject {
    
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
    
    func addInfo(name: String) {
        
        let ref = Database.database().reference()
        ref.child("users").childByAutoId().setValue(["name":name])

    }
}
