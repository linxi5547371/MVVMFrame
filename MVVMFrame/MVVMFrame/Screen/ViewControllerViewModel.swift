//
//  ViewControllerViewModel.swift
//  MVVMFrame
//
//  Created by fangmengkai on 2019/6/13.
//  Copyright © 2019 linxi. All rights reserved.
//

import Foundation

class ViewControllerViewModel {
    
    var model: NormalResponse?
    
    func getNormalRequest() {
        let request = NormalRequest(url: URL(string: "http://mock.apistub.cn/user/fmk5547371/SampleProject/LoginTest") ?? URL(fileURLWithPath: ""), body: "123")
        APISender.shared.sendAPI(request: request) { (data1) in
            if let data = data1 {
                self.model = APISender.shared.decodableResponse(request: request, data: data)
            } else {
                print("data error")
            }
        }
    }
}
