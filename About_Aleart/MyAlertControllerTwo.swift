//
//  MyAlertControllerTwo.swift
//  About_Aleart
//
//  Created by Bhabani on 23/05/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class MyAlertControllerTwo: UIAlertController {
    var window: UIWindow?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        window = nil
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let viewcont = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "initialview") as? ViewController
                        self.window?.rootViewController = viewcont
    }
    
    func represent(){
        window = UIApplication.shared.windows.last
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        let root = window?.rootViewController
        root?.present(self, animated: true, completion: {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//                let view = UINavigationController()
//                view.view.backgroundColor = .white
                
//                let viewcont = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "initialview") as? ViewController
//                self.window?.rootViewController = viewcont
//            }
        })
        
    }
    

}
