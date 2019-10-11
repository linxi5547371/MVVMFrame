//
//  UIPageControlExtension.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/1.
//  Copyright © 2019 方梦凯. All rights reserved.
//

extension Reactive where Base: UIPageControl {
    public var pageObservable: ControlProperty<Int> {
        
        let bindingObserver = Binder(self.base) { pageControl, page in
            pageControl.currentPage = page
        }
        
        return ControlProperty(values: self.base.pageBehaviorSubject, valueSink: bindingObserver)
    }
}
extension UIPageControl {
    static var _pageBehaviorSubject: BehaviorSubject<Int>?
    
    internal var pageBehaviorSubject: BehaviorSubject<Int> {
        if let subject = UIPageControl._pageBehaviorSubject {
            return subject
        }
        
        let subject = BehaviorSubject<Int>(value: self.currentPage)
        UIPageControl._pageBehaviorSubject = subject
        
        return subject
    }
}
