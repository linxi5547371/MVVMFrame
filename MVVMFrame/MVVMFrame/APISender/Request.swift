//
//  Request.swift
//  MVVMFrame
//
//  Created by fangmengkai on 2019/6/12.
//  Copyright © 2019 linxi. All rights reserved.
//

import Foundation

protocol Request {
    
    /// The response type associated with the request type.
    associatedtype Response: Decodable
    
    var baseURL: URL { get }
    
    var param: [String: Any]? { get }
    
    var method: HTTPMethod { get }
    
    /// The HTTP header fields. In addition to fields defined in this property, `Accept` and `Content-Type`
    /// fields will be added by `dataParser` and `bodyParameters`. If you define `Accept` and `Content-Type`
    /// in this property, the values in this property are preferred.
    var headerFields: [String: String] { get }
    
    /// A type used to define how a set of parameters are applied to a `URLRequest`.
    var encoding: ParameterEncoding { get }
}

protocol BaseRequet: Request {

}

extension BaseRequet {
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var method: HTTPMethod {
        return .post
    }
    
    var headerFields: [String : String] {
        return ["Content-Type": "application/json"]
    }
}
