//
//  ViewController.swift
//  MVVMFrame
//
//  Created by fangmengkai on 2019/6/12.
//  Copyright © 2019 linxi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel = ViewControllerViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sample
        viewModel.getNormalRequest()
    }

    @IBAction func getApply() {
        PrivaceUsageManager.cameraUsageApply(successBlock: nil, failBlock: nil)
        PrivaceUsageManager.microphoneUsageApply(successBlock: nil, failBlock: nil)
        PrivaceUsageManager.locationAlwaysUsageApply(target: nil, successBlock: nil, failBlock: nil)
    }
 
}

