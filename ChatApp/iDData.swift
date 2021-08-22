//
//  iDData.swift
//  ChatApp
//
//  Created by 강현성 on 2021/08/22.
//  Copyright © 2021 Mirror. All rights reserved.
//

import Foundation

struct iDData : Identifiable {
    var id = UUID()
    
    var time: String
    var name : String
    var msg : String
    
}

