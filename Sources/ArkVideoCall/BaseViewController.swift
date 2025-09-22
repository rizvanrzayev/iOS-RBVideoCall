//
//  BaseViewController.swift
//  ArkVideoCall
//
//  Created by Rizvan Rzayev on 22.09.25.
//

import UIKit
import AVFoundation

public class BaseViewController: UIViewController {

//    public lazy var alert: SCLAlertView = {
//       return generateMsgBox()
//    }()
    
//    public var alertResponder: SCLAlertViewResponder?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ""
        
        if let nav = self.navigationController {
            nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
            nav.navigationBar.shadowImage = UIImage()
            nav.navigationBar.isTranslucent = true
            
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            nav.navigationBar.titleTextAttributes = textAttributes
            
            self.navigationItem.hidesBackButton = true
        }
    }
    
//    public override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    public func cancelEvent(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: Dialog methods
    public func hideAlerts() {
//        if let responder = alertResponder {
//            if alert.isShowing() {
//                responder.close()
//            }
//        }
    }
    
//    public func generateMsgBox() -> SCLAlertView {
//        let appearance = SCLAlertView.SCLAppearance(showCloseButton: false, showCircularIcon: false)
//        let alertView = SCLAlertView(appearance: appearance)
//        return alertView
//    }
    
    public func cancelBtnClickHandlerWithRetry(_ errorMsg: String, _ title: String, action : @escaping ()->Void) {
//        hideAlerts()
//        
//        alert = generateMsgBox()
//        alert.addButton("İptal") {
//            self.cancelEvent()
//        }
//        alert.addButton("Tekrar Dene", action: action)
//        alertResponder = alert.showError(title, subTitle: errorMsg)
    }
    
    public func yesNoMsg(_ msg: String, _ title: String, yesAction : @escaping ()->Void, noAction : @escaping ()->Void) {
//        hideAlerts()
//        
//        alert = generateMsgBox()
//        alert.addButton("Evet") {
//            yesAction()
//        }
//        alert.addButton("Hayır") {
//            noAction()
//        }
//        alertResponder = alert.showNotice(title, subTitle: msg)
    }
    
    public func cancelAndGoToStart(cancelCallback: @escaping () -> Void) {
        yesNoMsg("İşlemi iptal etmek istediğinizden emin misiniz?", "İptal") {
            cancelCallback()
            self.navigationController?.popToRootViewController(animated: true)
        } noAction: {
            
        }
    }
    
    public func errorMsg(_ msg: String, _ title: String) {
        hideAlerts()
        
//        alert = generateMsgBox()
//        alert.addButton("Tamam") {
//            
//        }
//        alertResponder = alert.showError(title, subTitle: msg)
    }
    
    public func errorMsg(_ msg: String, _ title: String, callback: @escaping () -> Void) {
        hideAlerts()
        
//        alert = generateMsgBox()
//        alert.addButton("Tamam") {
//            callback()
//        }
//        alertResponder = alert.showError(title, subTitle: msg)
    }
    
    public func infoMsg(_ msg: String, _ title: String) {
        hideAlerts()
        
//        alert = generateMsgBox()
//        alert.addButton("Tamam") {
//            
//        }
//        alertResponder = alert.showInfo(title, subTitle: msg)
    }
    
    public func errorAndGoToStart(msg: String = "Bir hata oluştu. En baştan başlamanız gerekiyor.") {
        hideAlerts()
        
//        alert = generateMsgBox()
//        alert.addButton("Tamam") {
//            self.cancelEvent()
//        }
//        let subTitle = "\(msg) \n\nRef. \(AppData.sharedInstance.currentTransId)"
//        alertResponder = alert.showError("Hata", subTitle: subTitle)
    }
    
    // MARK: Navbar button methods
    public func addInfoBtn() {
//        let button1 = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(self.barBtnAction))
//        button1.title = "Hakkında"
//        button1.setIcon(icon: .ionicons(.iosInformationOutline), iconSize: 32, color: .white)
//        self.navigationItem.leftBarButtonItem = button1
    }
    
    @objc func barBtnAction(){
         hideAlerts()
//        alert = generateMsgBox()
//        alert.addButton("İletişim") {
//            if let url = URL(string: "https://arksigner.com/cozumler/liveauth") {
//                if #available(iOS 10.0, *) {
//                    UIApplication.shared.open(url)
//                } else {
//                    // Fallback on earlier versions
//                }
//            }
//        }
//        alert.addButton("Tamam") {
//            
//        }
//        
//        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
//        alert.showInfo("LiveAuth Hakkında", subTitle: "LiveAuth \(appVersion ?? "1.0.11")")
    }
    
    public func addCancelBtn(callback: Selector, _ btnColor: UIColor = .red) {
//        let button = UIBarButtonItem(image: nil, style: .plain, target: self, action: callback)
//        button.setIcon(icon: .ionicons(.iosCloseOutline), iconSize: 32, color: btnColor)
//        self.navigationItem.rightBarButtonItem = button
    }
    
    public func logAnalytic(_ eventName: String, params: [String: Any] = [:]) {
        var parameters = params
        parameters["uuid"] = AppData.sharedInstance.currentTransId
        
        
    }
    
    public func toggleFlash() {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        guard device.hasTorch else { return }

        do {
            try device.lockForConfiguration()
            
            if (device.torchMode == AVCaptureDevice.TorchMode.on) {
                device.torchMode = AVCaptureDevice.TorchMode.off
            } else {
                do {
                    try device.setTorchModeOn(level: 1.0)
                } catch {
                    print(error)
                }
            }

            device.unlockForConfiguration()
        } catch {
            print(error)
        }
    }
    
    public func turnOnScreenAlwaysOn() {
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    public func turnOffScreenAlwaysOn() {
        UIApplication.shared.isIdleTimerDisabled = false
    }
}
