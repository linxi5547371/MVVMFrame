//
//  UserModel.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/4.
//  Copyright © 2019 方梦凯. All rights reserved.
//

import Foundation
import UIKit

struct UserModel: Codable {
    var headImageUrl: String?
    var name: String
    var isNotRead: Bool
    var summary: String
    
    init(imageUrl: String, name: String, summary: String) {
        self.headImageUrl = imageUrl
        self.name = name
        self.isNotRead = false
        self.summary = summary
    }
}
