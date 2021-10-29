//
//  LoginViewController.swift
//  coffeeHub
//
//  Created by zed on 10/19/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var viewBody: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        textFieldSetup()
        passwordTextField.isSecureTextEntry = true
        viewBody.layer.cornerRadius = 80
        viewBody.layer.maskedCorners = [.layerMinXMinYCorner]
        
    }

    func textFieldSetup(){
        emailField.leftViewMode = .always
        passwordTextField.leftViewMode = .always
        let imageView1 = UIImageView()
        let image1 = UIImage(named: "email")
        imageView1.image = image1
        imageView1.frame = CGRect(x: 5, y: 0, width: emailField.frame.height, height: emailField.frame.height)
        emailField.leftView = imageView1
        
        let imageView2 = UIImageView()
        let image2 = UIImage(named: "lock")
        imageView2.image = image2
        imageView2.frame = CGRect(x: 5, y: 0, width: passwordTextField.frame.height, height: passwordTextField.frame.height)
        passwordTextField.leftView = imageView2
    
   
    }
   
    func login(){
        
        let loginBody = ["phone":"\(String(describing: emailField.text))","password":"\(String(describing: passwordTextField.text))"]
        let header = ["Content-type":"application/json", "charset":"UTF-8"]
        let url = URL(string: "https://coffeetek.herokuapp.com/login")
        var urlRequset = URLRequest(url: url!)
        urlRequset.httpMethod = "POST"
        urlRequset.allHTTPHeaderFields = header
        do {
            let getDataBody = try JSONSerialization.data(withJSONObject: loginBody, options: .fragmentsAllowed)
            urlRequset.httpBody = getDataBody
            URLSession.shared.dataTask(with: urlRequset) { (data,respone,error) in
            
                if let data = data {
                    let responeBody = try? JSONDecoder().decode(LoginUser.self, from: data)
                    
                    DispatchQueue.main.async {
                        let vc = UIStoryboard(name: "TabBar", bundle: Bundle.main).instantiateViewController(withIdentifier: "home")
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: nil)
//                        self.navigationController?.pushViewController(vc, animated: true)

                        }
                        
                    }
    
            }.resume()
            
            
        }catch{
            print(error.localizedDescription)
            
        }
        
    }
    

    @IBAction func loginBtn(_ sender: Any) {
        login()
       
    }
    
    
    @IBAction func SignUpBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "signUp")
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
}

public struct LoginUser: Codable{
    var _id: String
    var image:String
    var name:String
    var phoneNumber:String
    var status:Int
}

