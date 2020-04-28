//
//  PrivateUsageManager.swift
//  MVVMFrame
//
//  Created by bjhl on 2020/4/28.
//  Copyright © 2020 linxi. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import CoreLocation.CLLocationManager

struct PrivaceUsageManager {
    typealias callBlock = (() -> Void)?
    
    private static var locationManager = CLLocationManager()
    
    static func cameraUsageApply(successBlock: callBlock, failBlock: callBlock) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let status = AVCaptureDevice.authorizationStatus(for: .video)
            switch status {
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { (result) in
                    if result {
                        successBlock?()
                    } else {
                        failBlock?()
                    }
                }
            case .restricted:
                // 无权更改此应用程序权限
                failBlock?()
            case .denied:
                failBlock?()
                PrivaceUsageManager.showApplyAlert(title: "相机权限没有开启", message: "需要去“设置“中修改")
            case .authorized:
                successBlock?()
            }
        }
    }
    
    static func microphoneUsageApply(successBlock: callBlock, failBlock: callBlock) {
        let status = AVCaptureDevice.authorizationStatus(for: .audio)
        switch status {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .audio) { (result) in
                if result {
                    successBlock?()
                } else {
                    failBlock?()
                }
            }
        case .restricted:
            // 无权更改此应用程序权限
            failBlock?()
        case .denied:
            failBlock?()
            PrivaceUsageManager.showApplyAlert(title: "麦克风权限没有开启", message: "需要去“设置“中修改")
        case .authorized:
            successBlock?()
        }
        
    }
    
    static func photoLibraryUsageApply(successBlock: callBlock, failBlock: callBlock) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let status = PHPhotoLibrary.authorizationStatus()
            
            switch status {
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { (status) in
                    if status == .authorized {
                        // 获取相册权限成功
                        successBlock?()
                    } else {
                        // 获取相册权限失败
                        failBlock?()
                    }
                }
            case .authorized:
                successBlock?()
            default:
                failBlock?()
                PrivaceUsageManager.showApplyAlert(title: "相册权限没有开启", message: "需要去“设置“中修改")
            }
        }
    }
    
    static func locationWhenInUseUsageApply(target: CLLocationManagerDelegate?, successBlock: callBlock, failBlock: callBlock) {
        if CLLocationManager.locationServicesEnabled() {
            let status = CLLocationManager.authorizationStatus()
            switch status {
            case .notDetermined:
                PrivaceUsageManager.locationManager.delegate = target
                CLLocationManager().requestWhenInUseAuthorization()
            case .authorizedWhenInUse:
                successBlock?()
            case .authorizedAlways:
                successBlock?()
            default:
                failBlock?()
                PrivaceUsageManager.showApplyAlert(title: "位置权限没有开启", message: "需要去“设置“中修改")
            }
            
        }
    }
    
    static func locationAlwaysUsageApply(target: CLLocationManagerDelegate?, successBlock: callBlock, failBlock: callBlock) {
        if CLLocationManager.locationServicesEnabled() {
            let status = CLLocationManager.authorizationStatus()
            switch status {
            case .notDetermined:
                PrivaceUsageManager.locationManager.delegate = target
                PrivaceUsageManager.locationManager.requestAlwaysAuthorization()
            case .authorizedAlways:
                successBlock?()
            default:
                failBlock?()
                PrivaceUsageManager.showApplyAlert(title: "位置权限没有开启", message: "需要去“设置“中修改")
            }
            
        }
    }
    
    private static func showApplyAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let goAction = UIAlertAction(title: "去设置", style: .default) { (action) in
            let url = URL(string: UIApplication.openSettingsURLString) ?? URL(fileURLWithPath: "")
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(goAction)
        alert.addAction(cancel)
        UIApplication.topViewController()?.present(alert, animated: false, completion: nil)
    }
}
