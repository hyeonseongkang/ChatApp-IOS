//
//  DataFire.swift
//  ChatApp
//
//  Created by 강현성 on 2021/08/22.
//  Copyright © 2021 Mirror. All rights reserved.
//

import Firebase
import Combine
import FirebaseDatabase


class DataFire : ObservableObject {
    @Published var chat = [iDData]()
    
    init() {
        let ref = Database.database().reference().child("chat").child("-MhbihzYFtqe5EqGQPUk").child("chatlist")
               ref.observe(DataEventType.childAdded, with: { snapshot in
                   let dict = snapshot.value as! [String:AnyObject]
                   
                   let message = dict["message"] as? String ?? ""
                   let time = dict["time"] as? String ?? ""
                   let user = dict["user"] as? String ?? ""
  
                   
                   self.chat.append(iDData(time: time, name: user, msg: message))
               })
    }
    
    func addInfo(msg: String) {
        let ref = Database.database().reference().child("chat").child("-MhbihzYFtqe5EqGQPUk").child("chatlist").childByAutoId()
        
        var formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        var currentDateString = formatter.string(from: Date())
        
        ref.setValue(["message" : msg, "time" : currentDateString, "user" : "hyeonseongkang"])
    }
}
