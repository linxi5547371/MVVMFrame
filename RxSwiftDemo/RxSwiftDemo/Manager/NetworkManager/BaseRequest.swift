//
//  BaseRequest.swift
//  RxSwiftDemo
//
//  Created by Qing Class on 2019/11/25.
//  Copyright © 2019 方梦凯. All rights reserved.
//

import Foundation
import Alamofire

protocol Request {
    associatedtype response: Decodable
    
    var path: String { get set }
    
    var method: HTTPMethod { get set }
    
    func decodeResponse(data: Data) -> response?
}

extension Request {
    var baseURL: String {
        return "http://swiftDemoTest:8866"
    }
       
    var requestURL: String {
        return (baseURL + path)
    }
    
    var parame: [String: Any] {
        return [:]
    }
    
    var httpHeaders: HTTPHeaders {
        return [:]
    }
}

//struct BaseRequest: Request {
//    var path: String = ""
//}
