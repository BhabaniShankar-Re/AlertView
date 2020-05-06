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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        additionalSetUP()
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

}

