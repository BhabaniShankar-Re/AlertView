//
//  ViewController.swift
//  About_Aleart
//
//  Created by Bhabani on 30/04/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var unavailableImage: UIImageView!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    
    var isUserLogedIN:Bool = false
    
    var popWindow: UIWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        additionalSetUP()
        
//        let alert = MyAlertControllerTwo(title: "chaw", message: "Bonzure ken cha", preferredStyle: .alert)
//        alert.represent()
        // Phase1 - is not working.
        
//        let alert = UIAlertController(title: "nothing", message: "go checkout my blog", preferredStyle: .alert)
//        
//        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
//        
//        alert.addAction(action)
//        
//        alert.presentInNewWindow(animated: true, completion: nil)
        
        // Phase 2
      //  let secondAlert = MyAlertView(title: "My alert View", message: "Hureee it working", preferredStyle: .alert)
//        let alertview = UIAlertController(title: "hello", message: "do you want the alert", preferredStyle: .alert)
//       // self.present(alertview, animated: true, completion: nil)
//
//        let window = UIApplication.shared.windows.last
//        window?.makeKeyAndVisible()
//        window?.rootViewController = UIViewController()
//        window?.rootViewController?.present(alertview, animated: true
//            , completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let alert = UIAlertController(title: "hello", message: "no message", preferredStyle: .alert)
//        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if isUserLogedIN{
            blurEffect.isHidden = false
        }
    }
    
    func additionalSetUP(){
        unavailableImage.isUserInteractionEnabled = true
        blurEffect.isUserInteractionEnabled = true
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
        blurEffect.addGestureRecognizer(tapgesture)
    }
    @objc func onTap(){
        if !isUserLogedIN{
            showAlert()
        }else{
            blurEffect.isHidden = false
        }
    }
    
    func showAlert(){
        let alertController = UIAlertController(title: "Alert/_\\", message: "To watch the content you have register frist", preferredStyle: .alert)
        let registerAction = UIAlertAction(title: "Register", style: .default) { (_) in
            self.performSegue(withIdentifier: "ToRegisterVC", sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(registerAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true) {
            print("aleart controller presented.")
        }
    }
    
    func additionalWindowSetup(){
        let windowScene = UIApplication.shared.connectedScenes.filter { $0.activationState == .foregroundActive
        }.first
        
        if let windowScene = windowScene as? UIWindowScene {
            popWindow = UIWindow(windowScene: windowScene)
        }
        
        popWindow?.frame = UIScreen.main.bounds
        popWindow?.backgroundColor = .blue
        popWindow?.rootViewController = {
            let vc = UIViewController()
            vc.view.backgroundColor = .systemRed
            return vc
        }()
        popWindow?.windowLevel = .statusBar + 1
        popWindow?.makeKeyAndVisible()
    }

}

