//
//  LoginViewController.swift
//  LoginTempl
//
//  Created by IvanK on 3/14/17.
//  Copyright © 2017 IvanK. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var textFieldUserName: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonClicked() {
        
        if (textFieldUserName.text?.isEmpty)! || (textFieldPassword.text?.isEmpty)! {
            return
        }
        
        logInWith(userName: textFieldUserName.text as NSString!, passWord: textFieldPassword.text as NSString!) { (result, error) in
            
            print("JSON: \(result)")
            
            if error == nil {
                self.openMainPage()
            }
        }
        
    }
    
    func openMainPage() -> Void {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
