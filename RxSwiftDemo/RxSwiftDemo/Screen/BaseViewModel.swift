//
//  BaseViewModel.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/9/30.
//  Copyright © 2019 方梦凯. All rights reserved.
//

@objc enum ViewModelType: Int { //OC调用enum只能使用int
    case home = 1
    case waklkThrough
    case detail
}

enum TestEnumType {
    case Buy(name: String, age: Int)
    case Sell(name: String, target: String)
}

class BaseViewModel {
    let type: ViewModelType = .home
    let testType: TestEnumType = .Buy(name: "11", age: 2)
     
    // 枚举传值
    func pp() {
        if case let TestEnumType.Sell(stock, amount) = testType {
            print("buy \(amount) of \(stock)")
        }
        
    }
}
