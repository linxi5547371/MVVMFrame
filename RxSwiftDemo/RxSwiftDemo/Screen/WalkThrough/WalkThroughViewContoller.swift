//
//  WalkThroughViewContoller.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/9/30.
//  Copyright © 2019 方梦凯. All rights reserved.
//


final class WalkThroughViewController: RxBaseViewController, LoadVCDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var goBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!

    var viewModel: WalkThroughViewModel!
    
    static func createVC() -> WalkThroughViewController {
        let vc = UIStoryboard(name: "WalkThrough", bundle: nil).instantiateInitialViewController() as! WalkThroughViewController
        vc.viewModel = WalkThroughViewModel()
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func bind() {
        
        let _ = Observable<Int>.create { (AnyObserver) -> Disposable in
            AnyObserver.onNext(1)
            AnyObserver.onCompleted()
            return Disposables.create()
        }
        
        pageControl.rx.pageObservable
            .map { page in
            return CGPoint(x: CGFloat(page) * UIScreen.main.bounds.width, y: 0)
            }
            .bind(to: collectionView.rx.contentOffset)
            .disposed(by: disposeBag)
        
        collectionView.rx.contentOffset.map { Int($0.x / UIScreen.main.bounds.width)}
            .bind(to: pageControl.rx.pageObservable)
            .disposed(by: disposeBag)
        
        
        collectionView.rx.contentOffset
            .map { Int($0.x / UIScreen.main.bounds.width)}
            .map { $0 == 0 }
            .bind(to: backBtn.rx.isHidden)
            .disposed(by: disposeBag)
        
        collectionView.rx.contentOffset
            .map { Int($0.x / UIScreen.main.bounds.width)}
            .map { $0 == self.pageControl.numberOfPages - 1 }
            .subscribe(onNext: { isLast in
                if isLast {
                    self.goBtn.setTitle("Home", for: UIControl.State.normal)
                } else {
                    self.goBtn.setTitle("下一张", for: UIControl.State.normal)
                }
            })
            .disposed(by: disposeBag)
        
        backBtn.rx.controlEvent(UIControl.Event.touchUpInside).subscribe { [weak self] _ in
            guard let `self` = self else { return }
            self.pageControl.pageBehaviorSubject.on(.next(self.pageControl.currentPage > 0 ? self.pageControl.currentPage - 1 : 0))
        }.disposed(by: disposeBag)
        
        goBtn.rx.controlEvent(UIControl.Event.touchUpInside).subscribe { [weak self] _ in
            guard let `self` = self else { return }
            if self.goBtn.title(for: .normal) == "Home" {
                let vc = UIStoryboard(name: "Home", bundle: nil).instantiateInitialViewController()
//                let vc = HomeViewController.createVC()
                (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = vc
            } else {
              self.pageControl.pageBehaviorSubject.on(.next(self.pageControl.currentPage < self.pageControl.numberOfPages - 1 ? self.pageControl.currentPage + 1 : self.pageControl.numberOfPages - 1))
            }
            }.disposed(by: disposeBag)
        
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        //DataSource
//        collectionView.rx.setDataSource(self)
//            .disposed(by: disposeBag)
 
        Observable.just(viewModel.images)
            .bind(to: collectionView.rx.items(cellIdentifier: "WalkThroughImageCell", cellType: WalkThroughImageCell.self)) { (row, image, cell) in
            cell.bgImageView.image = image
            }
            .disposed(by: disposeBag)
        
    }
}

//UICollectionViewDataSource && UICollectionViewDelegateFlowLayout
extension WalkThroughViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WalkThroughImageCell", for: indexPath) as! WalkThroughImageCell
        cell.bgImageView.image = viewModel.images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

