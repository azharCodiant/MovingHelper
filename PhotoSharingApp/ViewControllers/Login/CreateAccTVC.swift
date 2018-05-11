//
//  CreateAccTVC.swift
//  PhotoSharingApp
//
//  Created by Azharuddin on 31/01/18.
//  Copyright © 2018 Azharuddin. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn

class CreateAccTVC: UITableViewController{
    
    @IBOutlet weak var tfName:     UITextField!
    @IBOutlet weak var tfEmail:    UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    
    // MARK: - Private Methods
    
    func configure(){
        
        GIDSignIn.sharedInstance().uiDelegate                            = self
        GIDSignIn.sharedInstance().delegate                              = self
        GIDSignIn.sharedInstance().clientID                              = "1086203934410-n7b5lg7babbv1tpi350e4fa7plgstlqj.apps.googleusercontent.com"
        
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationItem.title                                        = "Create an Account"
        
    }
    
    private func validated() -> Bool {
        
        
        if Validator.emptyString(tfName.text) {
            showAlertWith(message: ENTER_FIRST_NAME)
            return false
        }else if (tfName.text?.count)!<3{
            showAlertWith(message: ENTER_CORRECT_FIRST_NMAE)
            return false
        }else if Validator.emptyString(tfEmail.text){
            showAlertWith(message: ENTER_EMAIL)
            return false
        }else if !Validator.validEmail(tfEmail.text){
            showAlertWith(message: ENTER_PROPER_EMAIL)
            return false
        }else if Validator.emptyString(tfPassword.text){
            showAlertWith(message: ENTER_PASSWORD)
            return false
        }
        
        return true
        
        
    }
    
    // MARK: - Action Methods
    @IBAction func btnFacebook_Action(_ sender: Any) {
        
        let fbLoginManager : FBSDKLoginManager                           = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["public_profile","email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult                 = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData()
                    }
                }
            }
        }
    }
    @IBAction func btnGoogle_Action(_ sender: Any) {
        
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    @IBAction func btnSignUP_Action(_ sender: Any) {
        
        guard validated() else {
            return
        }
        /*
         let parameters: HTTPParameters = [kName: self.tfName.text!,
         kEmail: self.tfEmail.text!,
         kPassword: self.tfPassword.text!]
         
         APIComponents.Account.signUp(parameters: parameters) { (success, response, error) in
         guard success, response != nil  else {
         if error != nil {
         self.showAlertWith(message: error!.localizedDescription)
         }
         return
         }
         }
         */
    }
    
    
    // MARK: - API Methods
    
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                
                
                
                guard  error == nil else { return }
                
                let data:[String:AnyObject]                                      = result as! [String : AnyObject]
                print(data)
                /*
                 let strEmail                                                     = data["email"] as? String
                 let strFullName                                                  = data["name"] as? String
                 let strFirstName                                                 = data["first_name"] as? String
                 let strLastName                                                  = data["last_name"] as? String
                 let strFacebookId                                                = data["id"] as? String
                 let strImageUrl                                                  = (((data["picture"]!["data"]) as? [String: Any])?["url"])!
                 // (((data["picture"]!["data"]) as? [String: Any])?["width"])
                 //(((data["picture"]!["data"]) as? [String: Any])?["url"])
                 */
                
                
                
            })
        }
    }
    
    
    
}


extension CreateAccTVC :  GIDSignInUIDelegate, GIDSignInDelegate{
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        
        guard  user != nil else { return }
        /*
         let userId                                                       = user.userID
         let idToken                                                      = user.authentication.idToken
         let fullName                                                     = user.profile.name
         let givenName                                                    = user.profile.givenName
         let familyName                                                   = user.profile.familyName
         let email                                                        = user.profile.email
         let picture                                                      = user.profile.imageURL(withDimension: 200) as! URL
         
         signIn.disconnect()
         */
    }
    
    
}

