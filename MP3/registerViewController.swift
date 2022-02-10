//
//  registerViewController.swift
//  MP3
//
//  Created by Бексултан Нурпейс on 23.12.2021.
//

import UIKit
import Firebase
import FirebaseAuth
import AVFoundation


class registerViewController: UIViewController {
    @IBOutlet weak var email_field: UITextField!
    
    @IBOutlet weak var password_field: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func register_pressed(_ sender: Any) {
        let email = email_field.text
        let password = password_field.text
        
        if email != "" && password != ""{
            Auth.auth().createUser(withEmail: email!, password: password!) {[weak self ] result, error in
                Auth.auth().currentUser?.sendEmailVerification(completion: nil)
                if error == nil {
                    self?.showMessage(title: "Success", message:"PLS, Verify your emeail")
                }else{
                    self?.showMessage(title: "Success", message:"some problem there")
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func showMessage(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            if title != "Error!"{
                self.dismiss(animated: true, completion: nil)
            }
        }
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
}
