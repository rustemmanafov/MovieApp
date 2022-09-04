//
//  LoginController.swift
//  MovieApp
//
//  Created by Rustem Manafov on 03.09.22.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var signInLabel: UIButton!
    
    var users = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readJsonFile()
        
    }
    
    func getJsonFilePath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory.appendingPathComponent("User.json")
    }
    
    func readJsonFile() {
        if let data =  try? Data(contentsOf: getJsonFilePath()) {
            do {
                users = try JSONDecoder().decode([UserModel].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("no file")
        }
    }
    
    func checkUser() -> Bool {
        if let email = emailTxt.text, let password = passwordTxt.text {
            for user in users {
                if user.email == email && user.password == password {
                    print("User logged in")
                    UserDefaults.standard.set(true, forKey: "isLoggedIn")
                    return true
                }
            }
        } else {
            print("Fill the information")
        }
        return false
    }
    
    @IBAction func signInAct(_ sender: Any) {
        if checkUser() {
            let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            let navigationController = UINavigationController(rootViewController: controller)
            navigationController.modalPresentationStyle = .overFullScreen
            present(navigationController, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Alert", message: "Something went wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func signUpAct(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        show(controller, sender: nil)
    }
    
}
