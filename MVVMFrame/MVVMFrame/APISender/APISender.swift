//
//  APISender.swift
//  MVVMFrame
//
//  Created by fangmengkai on 2019/6/12.
//  Copyright © 2019 linxi. All rights reserved.
//

import Foundation

extension SessionManager {
    public static let `customConfig` : SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        // 30s超时
        configuration.timeoutIntervalForRequest = 60
        
        return SessionManager(configuration: configuration)
    }()
}

class APISender {
    static let shared = APISender()
    
    func sendAPI<T: Request>(request: T, completion: @escaping ((Data?) -> Void)) {
        let sessionManager = SessionManager.customConfig
//        var model: T.Response?
        
//        Alamofire.request(<#T##url: URLConvertible##URLConvertible#>)
        sessionManager.request(request.baseURL, method: .get, parameters: nil, encoding: request.encoding, headers: request.headerFields).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                if let data = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) {
                    completion(data)
                } else {
                    completion(nil)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func decodableResponse<T: Request>(request: T, data: Data) -> T.Response {
        let model = try! JSONDecoder().decode(T.Response.self, from: data)
        return model
    }
}
