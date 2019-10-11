//
//  HomeUserCell.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/4.
//  Copyright © 2019 方梦凯. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class HomeUserCell: UITableViewCell {
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    func setupUI(with model: UserModel) {
        headImageView.image = UIImage(data: (try? Data(contentsOf: URL(string: model.headImageUrl ?? "") ?? URL(fileURLWithPath: ""))) ?? Data())
//        headImageView.kf.indicatorType = .activity
//        headImageView.kf.setImage(with: URL(string: model.headImageUrl!) ?? URL(fileURLWithPath: ""))
        nameLabel.text = model.name
        summaryLabel.text = model.summary
//        DispatchQueue.main.async {
//            if let url = URL(string: model.headImageUrl ?? "") {
//                var data = Data()
//                do {
//                    data = try Data(contentsOf: url)
//                } catch {
//                    print(error)
//                }
//                self.headImageView.image = UIImage(data: data)
//            }
//        }
    }
}
