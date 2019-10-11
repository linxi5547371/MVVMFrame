//
//  Optional+Unpack.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/11.
//  Copyright © 2019 方梦凯. All rights reserved.
//

extension Optional {
    
    func unpack() -> Wrapped {
        if let unWrapped = self {
            return unWrapped
        } else {
            preconditionFailure("The Optional is nil!")
        }
    }
}
