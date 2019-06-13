//
//  NormalRequest.swift
//  MVVMFrame
//
//  Created by fangmengkai on 2019/6/12.
//  Copyright © 2019 linxi. All rights reserved.
//

import Foundation

struct NormalRequest: BaseRequet {
    typealias Response = NormalResponse
    
    var baseURL: URL
    
    var param: [String : Any]?
    
    init(url: URL, body: String) {
        baseURL = url
        param = ["body": body]
    }
}
