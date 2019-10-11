//
//  DetailViewController.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/10.
//  Copyright © 2019 方梦凯. All rights reserved.
//

import SDWebImage

final class DetailViewController: RxBaseViewController, LoadVCDelegate {
    
    static func createVC() -> DetailViewController {
        let vc = UIStoryboard(name: "Detail", bundle: nil).instantiateInitialViewController() as! DetailViewController
        vc.viewModel = DetailViewModel()
        return vc
        
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var closeBtn: UIButton!
    
    var viewModel: DetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGIF()
    }
    
    override func bind() {
        closeBtn.rx.controlEvent(UIControl.Event.touchUpInside).subscribe {[weak self] _ in
            guard let `self` = self else { return }
            self.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
        
    }
    
    func setGIF() {
        imageView.animationDuration = TimeInterval((viewModel.image?.images?.count ?? 0) / 10)
        imageView.animationImages = viewModel.image?.images
        imageView.startAnimating()
    }

}
