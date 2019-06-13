//
//  LocalDefault.swift
//  MVVMFrame
//
//  Created by fangmengkai on 2019/6/13.
//  Copyright © 2019 linxi. All rights reserved.
//

import Foundation

struct LocalDefault {
    static let shared = LocalDefault()
    enum LocalDefaultKey: String {
        case normalKey = "normalKey"
    }
    
    func setNormalValue(str: String) {
        UserDefaults.standard.set(str, forKey: LocalDefaultKey.normalKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func getNormalValue() -> String {
        let str = UserDefaults.standard.value(forKey: LocalDefaultKey.normalKey.rawValue) as? String ?? ""
        return str
    }
}
