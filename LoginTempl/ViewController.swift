//
//  ViewController.swift
//  LoginTempl
//
//  Created by IvanK on 3/13/17.
//  Copyright © 2017 IvanK. All rights reserved.
//

import UIKit
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
//        loginButton.center = view.center
//        view.addSubview(loginButton)
        
        
        
    }
    
    @IBAction func fbloginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile, .email, .userFriends ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                print(grantedPermissions)
                print(declinedPermissions)
                print(accessToken)
                
                self.openMainPage()
            }
        }
    }
    
    func openMainPage() -> Void {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

