//
//  AlertPresenter.swift
//  About_Aleart
//
//  Created by Bhabani on 23/05/20.
//  Copyright © 2020 Bhabani. All rights reserved.
//

import UIKit

class AlertPresenter: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func myalert1(_ sender: Any) {
        let alert = MyAlertView(title: "type1", message: "alert message", preferredStyle: .alert)
        let action = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.showAlert()
    }
    
    @IBAction func golbalAlert(_ sender: Any) {
        let alert = GlobalAlertViewController(title: "type1", message: "alert message", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.show()
    }
    
    @IBAction func myalert2(_ sender: Any) {
        let alert = GlobalAlertViewController(title: "Privecy", message: "Please Provide Your Basic Information For Privecy Policy", preferredStyle: .alert)
        alert.addTextField { (emialField) in
            emialField.placeholder = "Email"
            emialField.textColor = .link
        }
        alert.addTextField { (mobileField) in
            mobileField.placeholder = "Mobile No"
            mobileField.textColor = .systemRed
        }
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            (_) in
            let emial = alert.textFields?[0].text
            let phone = alert.textFields?[1].text
            
            print("Email: - ",emial as Any, "\n", "Phone Number: - ", phone as Any)
        })
        alert.addAction(action)
        alert.presentInNewWindow(animated: true, completion: nil)
    }
    
}
