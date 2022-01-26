//
//  loginViewController.swift
//  MP3
//
//  Created by Бексултан Нурпейс on 23.12.2021.
//

import UIKit
import Firebase
import FirebaseAuth


class loginViewController: UIViewController {
    var current_user: User?
    @IBOutlet weak var email_field: UITextField!
    @IBOutlet weak var password_field: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        current_user = Auth.auth().currentUser
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        current_user = Auth.auth().currentUser
        if current_user != nil && current_user!.isEmailVerified{
            gotoMainPage()
        }
    }
    
    @IBAction func login_pressed(_ sender: Any) {
        let email = email_field.text
        let password = password_field.text
        if email != "" && password != ""{
            Auth.auth().signIn(withEmail: email!, password: password!) { result, error in
                if error == nil{
                    if Auth.auth().currentUser!.isEmailVerified{
                        self.gotoMainPage()
                    }else{
                        self.showMessage(title: "Warning", message: "your email is not veryfied")
                    }
                }else{
                    
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

        }
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func gotoMainPage(){
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let mainPage = storyboard.instantiateViewController(withIdentifier: "homeViewController") as? homeViewController{
            mainPage.modalPresentationStyle = .fullScreen
            present(mainPage, animated: true, completion: nil)
        }
    }
}
