//
//  RxBaseViewController.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/9/30.
//  Copyright © 2019 方梦凯. All rights reserved.
//

protocol LoadVCDelegate where Self: RxBaseViewController {
    static func createVC() -> Self
}

class RxBaseViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    private var _isDidAppearedFirst: Bool = true     //viewDidAppearedFirstHangdle 的状态
    private var _isWillAppearedFirst: Bool = true     //viewWillAppearedFirstHangdle 的状态
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        print(self.description + "viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self.description + "viewWillAppear")
        if _isWillAppearedFirst {
            viewWillFirstAppear(animated)
            _isWillAppearedFirst = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(self.description + "viewDidAppear")
        if _isDidAppearedFirst {
            viewDidFirstAppear(animated)
            _isDidAppearedFirst = false
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(self.description + "viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(self.description + "viewDidDisappear")
    }
    
    func viewWillFirstAppear(_ animated: Bool) {
        
    }
    
    func viewDidFirstAppear(_ animated: Bool) {
        
    }
    
    func bind() {
        
    }
}
