//
//  ViewController.swift
//  MVVM_Fruits
//
//  Created by mohomed Ali on 16/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextFld: UITextField!
    
    @IBOutlet weak var passwordTextFld: UITextField!
    
   
    
    let login_ViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func goTableViewBtnClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "TableViewController")
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    @IBAction func signInBtnClicked(_ sender: Any) {
        print("Sign In Btn Clicked")
        let emailInput = emailTextFld.text
        print(emailInput)
        
        let passwordInput = passwordTextFld.text
        
        
        print(passwordInput)
        
        if login_ViewModel.doValidLogin(emailID: emailInput, passwordId: passwordInput){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationController = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            
            self.navigationController?.pushViewController(destinationController, animated: true)
            
        }else {
            print("Invalid Login")
            
        }
    }
    

    
    

}

