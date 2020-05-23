//
//  RegisterViewController.swift
//  About_Aleart
//
//  Created by Bhabani on 30/04/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func calButtonTapped(_ sender: Any) {
        print("tapped")
        let secondAlert = MyAlertView(title: "My alert View", message: "Hureee it working", preferredStyle: .alert)
        
        secondAlert.showAlert()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
