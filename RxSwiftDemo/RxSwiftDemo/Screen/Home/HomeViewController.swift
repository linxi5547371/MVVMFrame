//
//  HomeVIewController.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/4.
//  Copyright © 2019 方梦凯. All rights reserved.
//


final class HomeViewController: RxBaseViewController, LoadVCDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel!
    
    static func createVC() -> HomeViewController {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController() as! HomeViewController
        vc.viewModel = HomeViewModel()
        return vc
    }
    
    override func viewDidLoad() {
        viewModel = HomeViewModel()
        super.viewDidLoad()
        tableView.separatorStyle = .none
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getUserFromFile()
    }
    
    override func bind() {
        
        //UITableViewDataSource
//        tableView.rx.setDataSource(self)

        viewModel.usersObservable.asObservable().subscribe { _ in
            print("new usersObservable")
        }.disposed(by: disposeBag)
        
        viewModel.usersObservable.asObservable().bind(to: tableView.rx.items(cellIdentifier: "HomeUserCell", cellType: HomeUserCell.self)) { (row, model, cell) in
            cell.setupUI(with: model)
        }.disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe {[weak self] index in
            guard let `self` = self else { return }
            self.tableView.deselectRow(at: index.element!, animated: true)
            
            
            //正常的网络请求
//            self.viewModel.getUserInfo { (model) in
//                print("\(model.first?.name)")
//            }
            
            //Rx封装后的网络请求
            self.viewModel.getUserInfoRx().subscribe { (model) in
                guard let `model` = model.element else { return }
                print("\(model.first?.name)")
            }.disposed(by: self.disposeBag)
            
            //TODO: DetaiViewController
//            let vc = DetailViewController.createVC()
//            self.present(vc, animated: true, completion: nil)
        }.disposed(by: disposeBag)
        
        
    }
}
