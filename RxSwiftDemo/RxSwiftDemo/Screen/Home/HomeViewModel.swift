//
//  HomeViewModel.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/4.
//  Copyright © 2019 方梦凯. All rights reserved.
//


struct HomeViewModel {
    static let usersJson: URL = Bundle.main.url(forResource: "users", withExtension: "json") ?? URL(fileURLWithPath: "")
    
//    var users: [UserModel] = [UserModel(imageUrl: "http://img0.imgtn.bdimg.com/it/u=2677432097,397548121&fm=26&gp=0.jpg", name: "Albert", summary: "Love is a touch!")]
    
    var usersObservable = BehaviorRelay<[UserModel]>(value: [])

    
    func getUserFromFile() {
        let models = try? JSONDecoder().decode([UserModel].self, from: (try? Data(contentsOf: HomeViewModel.usersJson)) ?? Data())
        if models != nil {
//            users = models!
            usersObservable.accept(models!)
        } else {
            let temporaryJob = [UserModel(imageUrl: "http://img0.imgtn.bdimg.com/it/u=2677432097,397548121&fm=26&gp=0.jpg", name: "Albert", summary: "Love is a touch!")]
            
            usersObservable.accept(temporaryJob)
        }
    }

}