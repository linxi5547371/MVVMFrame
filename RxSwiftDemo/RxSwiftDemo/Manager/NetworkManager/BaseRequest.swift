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
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var parame: [String: Any]? { get }
    
    func decodeResponse(data: Data) -> response?
}

//extension Request {
//    var baseURL: String {
//        return "http://swiftDemoTest:8866"
//    }
//
//    var requestURL: String {
//        return (baseURL + path)
//    }
//
//    var parame: [String: Any] {
//        return [:]
//    }
//
//    var httpHeaders: HTTPHeaders {
//        return [:]
//    }
//}

protocol BaseRequet: Request {

}

extension BaseRequet {
    
    var baseURL: String {
        return "http://swiftDemoTest:8866"
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var requestURL: String {
        return (baseURL + path)
    }
    
    var headerFields: [String : String] {
        return ["Content-Type": "application/json"]
    }
    
    func decodeResponse(data: Data) -> response? {
        
        let model = try? JSONDecoder().decode(response.self, from: data)
        
        return model
    }
}
