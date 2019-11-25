//
//  NetworkManager.swift
//  RxSwiftDemo
//
//  Created by Qing Class on 2019/11/25.
//  Copyright © 2019 方梦凯. All rights reserved.
//

import Foundation
import Alamofire

extension SessionManager {
    public static let `customConfig` : SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        // 30s超时
        configuration.timeoutIntervalForRequest = 30
        
        return SessionManager(configuration: configuration)
    }()
}

struct NetworkManager<request: BaseRequet> {
    
    static func sendRequest(request: request, compeletionHandler: @escaping ((request.response?) -> Void)) {
        let sessionManager = SessionManager.customConfig
        sessionManager.request(request.requestURL, method: request.method, parameters: request.parame, encoding: request.encoding, headers: request.headerFields).response { response in
            guard let data = response.data else { return }
            compeletionHandler(request.decodeResponse(data: data))
        }
    }
}
