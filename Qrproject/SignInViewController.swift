//
//  SignInViewController.swift
//  Qrproject
//
//  Created by popmiiz on 10/24/2560 BE.
//  Copyright © 2560 popmiiz. All rights reserved.
//
//
//  ViewController.swift
//  FirebaseSocialLogin
//
//  Created by Brian Voong on 10/21/16.
//  Copyright © 2016 Lets Build That App. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate, GIDSignInDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        setupFacebookButtons()
        setupGoogleButtons()
        //self.performSegue(withIdentifier: "signInSegue", sender: self)
        //self.navigationController?.isNavigationBarHidden = true
      
    }
   
    //google
    fileprivate func setupGoogleButtons() {
        //add google sign in button
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x: 16 , y: 420 + 100, width: view.frame.width - 32, height: 55)
        googleButton.contentHorizontalAlignment = .center
        
        view.addSubview(googleButton)
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self

    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let err = error {
            print("Failed to log into Google: ", err)
            return
        }
        
        print("Successfully logged into Google", user)
        
        //self.performSegue(withIdentifier: "signInSegue", sender: self)
        
        guard let idToken = user.authentication.idToken else { return }
        guard let accessToken = user.authentication.accessToken else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        
        Auth.auth().signIn(with: credentials, completion: { (user, error) in
            if let err = error {
                print("Failed to create a Firebase User with Google account: ", err)
                return
            }
            
            guard let uid = user?.uid else { return }
            print("Successfully logged into Firebase with Google", uid)
           return self.performSegue(withIdentifier: "signInSegue", sender: self)
           
        })
        
        //        GIDSignIn.sharedInstance().signOut()
        //        GIDSignIn.sharedInstance().disconnect()
        //        self.window?.rootViewController!.performSegue(withIdentifier: "signInSegue", sender: self)
    
    }
  //signout
    
//
//    @IBAction func didTapSignout(_ sender: AnyObject) {
//        GIDSignIn.sharedInstance().signOut()
//    }

    
//    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
//        GIDSignIn.sharedInstance().signOut()
//        GIDSignIn.sharedInstance().disconnect()
//        //SignOut
//        if error != nil {
//            //handle error
//            print(error)
//        }
//    }
    
    
    //face
    fileprivate func setupFacebookButtons() {
        let loginButton = FBSDKLoginButton()
        view.addSubview(loginButton)
        //frame's are obselete, please use constraints instead because its 2016 after all
        loginButton.frame = CGRect(x: 18 , y: 420 + 30, width: view.frame.width - 38, height: 39)
        loginButton.delegate = self
        loginButton.readPermissions = ["email", "public_profile"]
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
        
    }
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        showEmailAddress()
    }
    func showEmailAddress() {
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else { return }
        let credentials = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        Auth.auth().signIn(with: credentials, completion: { (user, error) in
            if error != nil {
                print("Something went wrong with our FB user: ", error ?? "")
                return
            }
            print("Successfully logged in with our user: ", user ?? "")
            self.performSegue(withIdentifier: "signInSegue", sender: self)
        })
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start { (connection, result, err) in
            if err != nil {
                print("Failed to start graph request:", err ?? "")
                return
            }
            print(result ?? "")
        }
    }
    
}

