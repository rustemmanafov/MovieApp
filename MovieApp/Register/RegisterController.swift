//
//  RegisterController.swift
//  MovieApp
//
//  Created by Rustem Manafov on 03.09.22.
//

import UIKit

class RegisterController: UIViewController {
    
    @IBOutlet weak var firstNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var genderTxt: UITextField!
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var signUpLabel: UIButton!
    
    var users = [UserModel]()
    var pickerView = UIPickerView()
    var dataPicker = UIDatePicker()
    var genderArr = ["Male", "Female"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helper()
    }
    
    fileprivate func helper() {
        pickerView.delegate = self
        pickerView.dataSource = self
        genderTxt.inputView = pickerView
        emailTxt.keyboardType = .emailAddress
        createDatePicker()
        genderTxt.text = "Male"
    }
    
    func createDatePicker() {
        
        ageTxt.textAlignment = .center
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        
        ageTxt.inputAccessoryView = toolBar
        ageTxt.inputView = dataPicker
        dataPicker.datePickerMode = .date
        
    }
    
    @objc func donePressed() {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        ageTxt.text = formatter.string(from: dataPicker.date)
        self.view.endEditing(true)
    }
    
    func getDocumentPath() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
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
    
    func writeToJsonFile() {
        do {
            let data = try JSONEncoder().encode(users)
            try data.write(to: getJsonFilePath())
            navigationController?.popViewController(animated: true)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func signUpAct(_ sender: Any) {
        
        if let firstName = firstNameTxt.text, let lastName = lastNameTxt.text, let email = emailTxt.text, let password = passwordTxt.text, let gender = genderTxt.text, let age = ageTxt.text {
            
            let user = UserModel(firstName: firstName, lastName: lastName, email: email, password: password, gender: gender, age: age)
            users.append(user)
            writeToJsonFile()
            
        } else {
            let alert = UIAlertController(title: "Alert", message: "Please fill fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

// gender picker view
extension RegisterController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderArr.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        genderTxt.text = genderArr[row]
        genderTxt.resignFirstResponder()
        
    }
}
