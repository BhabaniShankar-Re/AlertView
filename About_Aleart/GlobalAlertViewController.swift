//
//  GlobalAlertViewController.swift
//  About_Aleart
//
//  Created by Bhabani on 06/05/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//  According To DBAlertview Controller
//  But it doesn't work in iOS 13

import UIKit

fileprivate var alertWindow = [UIAlertController: UIWindow]()

class GlobalAlertViewController: UIAlertController {
    
    

    private lazy var aleartWindow: UIWindow? = {
        let windowScene = UIApplication.shared.connectedScenes.filter { (scene) -> Bool in
            scene.activationState == .foregroundActive
        }.first
        if let windowScene = windowScene as? UIWindowScene{
            let window = UIWindow(windowScene: windowScene)
            window.frame = UIScreen.main.bounds
            window.rootViewController = UIViewController()
            window.backgroundColor = UIColor.clear
            window.windowLevel = UIWindow.Level.alert + 1
            return window
        }
        
        return nil
    }()
    
    
    public func show(animated flag: Bool = true, completion:(() -> Void)? = nil) {
        if let rootViewController = aleartWindow?.rootViewController{
            aleartWindow?.makeKeyAndVisible()
            rootViewController.present(self, animated: flag, completion: completion)
        }
    }
     

}

extension UIAlertController {

    func presentInNewWindow(animated: Bool, completion: (() -> Void)?) {
        let foregroundActiveScene = UIApplication.shared.connectedScenes.filter { $0.activationState == .foregroundActive }.first
        guard let foregroundWindowScene = foregroundActiveScene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: foregroundWindowScene)
        alertWindow[self] = window

        window.rootViewController = UIViewController()
        window.windowLevel = .alert + 1
        window.makeKeyAndVisible()
        window.rootViewController!.present( self, animated: animated, completion: completion)
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        alertWindow[self] = nil
    }

}
