//
//  UserRequest.swift
//  RxSwiftDemo
//
//  Created by Qing Class on 2019/11/25.
//  Copyright © 2019 方梦凯. All rights reserved.
//

import Foundation

struct UserRequest: Request {
    
    typealias response = Array<UserModel>
    
    var path: String = "/user"
    
    var method: HTTPMethod = .get
    
    func decodeResponse(data: Data) -> response? {
        
        let model = try? JSONDecoder().decode(response.self, from: data)
        
        return model
    }
}
