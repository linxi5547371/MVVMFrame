//
//  NetworkManager.swift
//  RxSwiftDemo
//
//  Created by Qing Class on 2019/11/25.
//  Copyright © 2019 方梦凯. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkManager<request: Request> {
//    static let shared = NetworkManager()
    
    static func sendRequest(request: request, compeletionHandler: @escaping ((request.response?) -> Void)) {
        Alamofire.request(request.requestURL, method: request.method, parameters: request.parame, encoding: URLEncoding.default, headers: nil).response { response in
            guard let data = response.data else { return }
            compeletionHandler(request.decodeResponse(data: data))
        }
    }
}
