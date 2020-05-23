//
//  MyAleartView.swift
//  About_Aleart
//
//  Created by Bhabani on 19/05/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class MyAlertView: UIAlertController{
    var window: UIWindow?
    
    deinit {
        window = nil
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        window = nil
    }
    
    func showAlert(){
        createNewWindow()
        
        let action = UIAlertAction(title: "Ok", style: .default) { [weak self](_) in
            self?.window = nil
        }
        self.addAction(action)
        window?.rootViewController?.present(self, animated: true, completion: nil)
        
    }
    
    func createNewWindow(){
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        
        let windowScene = UIApplication.shared.connectedScenes.filter({ $0.activationState == .foregroundActive }).first as? UIWindowScene
        window?.windowScene = windowScene
        window?.windowLevel = .alert + 1
        window?.makeKeyAndVisible()
    }
}
