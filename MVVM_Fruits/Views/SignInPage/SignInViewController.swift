//
//  SignInViewController.swift
//  MVVM_Fruits
//
//  Created by mohomed Ali on 16/04/2023.
//

import UIKit

class SignInViewController: UIViewController {
    
//    let reservedInput = ""
    
    
    @IBOutlet weak var emailOutputLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailOutputLbl.text = "sign In succesfull"
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
