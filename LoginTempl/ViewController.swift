//
//  ViewController.swift
//  LoginTempl
//
//  Created by IvanK on 3/13/17.
//  Copyright © 2017 IvanK. All rights reserved.
//

import UIKit
import FacebookLogin
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {
    
//    @IBOutlet weak var gidSignInButton: GIDSignInButton!
    @IBOutlet weak var gidSignInButton: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
//        loginButton.center = view.center
//        view.addSubview(loginButton)
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: .NOTIFY_GoogleLoggedIn, object: nil)
        

    }
    
    func handleNotification() {
        self.openMainPage()
    }
    
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        activityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func gidSigninButtonClicked() {
        
        activityIndicator.startAnimating()
        
        GIDSignIn.sharedInstance().signIn()
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
//        GIDSignIn.sharedInstance().signOut()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

