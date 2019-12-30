//
//  UserRequest.swift
//  RxSwiftDemo
//
//  Created by Qing Class on 2019/11/25.
//  Copyright © 2019 方梦凯. All rights reserved.
//

import Foundation

struct UserRequest: BaseRequet {
    
    typealias response = Array<UserModel>
    
    var path: String = "/user"
    
    var method: HTTPMethod = .get
    
    var parame: [String : Any]? = [:]
    
}
