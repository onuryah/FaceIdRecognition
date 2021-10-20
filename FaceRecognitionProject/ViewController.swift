//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Ceren Çapar on 5.10.2021.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    @IBOutlet weak var labelField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func checkButtonClicked(_ sender: Any) {
        let authContext = LAContext()
        
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is It Really You") { success, error in
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                    
                }else {
                    DispatchQueue.main.async {
                        self.labelField.text = "Error!"

                    }
                    
                }
            }
        }
    }
    

}

