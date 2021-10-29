//
//  SignUpViewController.swift
//  coffeeHub
//
//  Created by zed on 10/19/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailtextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmpasswordTextField: UITextField!

    @IBOutlet weak var viewBody: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        passwordTextField.isSecureTextEntry = true
        confirmpasswordTextField.isSecureTextEntry = true
       
        mailIconforTextField(nameTextField: emailtextField)
        lockIconforTextField(nameTextField: passwordTextField)
        lockIconforTextField(nameTextField: confirmpasswordTextField)
        
        viewBody.layer.cornerRadius = 80
        viewBody.layer.maskedCorners = [.layerMinXMinYCorner]

    }
    func mailIconforTextField(nameTextField:UITextField){
        nameTextField.leftViewMode = .always
        let imageView1 = UIImageView()
        let image1 = UIImage(named: "email")
        imageView1.image = image1
        imageView1.frame = CGRect(x: 5, y: 0, width: nameTextField.frame.height, height: nameTextField.frame.height)
       nameTextField.leftView = imageView1
    }
    func lockIconforTextField(nameTextField:UITextField){
        nameTextField.leftViewMode = .always
        let imageView1 = UIImageView()
        let image1 = UIImage(named: "lock")
        imageView1.image = image1
        imageView1.frame = CGRect(x: 5, y: 0, width: nameTextField.frame.height, height: nameTextField.frame.height)
       nameTextField.leftView = imageView1
    }
    
    
    
    @IBAction func signUpBtn(_ sender: Any) {
    signUp()
    
    }
    func signUp(){
        
        let url = URL(string: "https://coffeetek.herokuapp.com/register")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        let header = ["Content-type":"application/json", "charset":"UTF-8"]
        let userbody = SignUpModel(phone: (emailtextField.text)!, password: (passwordTextField.text)!, comfrim: (confirmpasswordTextField.text)!)
        do {
        
            let jsonData = try JSONEncoder().encode(userbody)
            urlRequest.httpBody = jsonData
            urlRequest.allHTTPHeaderFields = header
            URLSession.shared.dataTask(with: urlRequest) { (data,respone,error) in
                if let data = data {
                    do {
                        
                    let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    print(json as! [String:Any])
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Message", message: "Register Success", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
                            self.navigationController?.present(vc!, animated: true)
                            
                        }
                        
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }.resume()
        }catch{
            print(error.localizedDescription)
        }
          
          
    }
        
    
    @IBAction func backToLoginBtn(_ sender: Any) {
    
        navigationController?.popViewController(animated: true)
    }
    

}

struct SignUpModel:Codable{
    var phone: String
    var password: String
    var comfrim: String
}
