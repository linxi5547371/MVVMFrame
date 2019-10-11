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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        print(self.description + "viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(self.description + "viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(self.description + "viewDidAppear")
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(self.description + "viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(self.description + "viewDidDisappear")
    }
    
    func bind() {
        
    }
}
