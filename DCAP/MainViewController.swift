//
//  MainViewController.swift
//  DCAP
//
//  Created by Sean Zhang on 11/2/17.
//  Copyright © 2017 Sean Zhang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.placeholder = "Username"
        textField.keyboardType = .emailAddress
        
        return textField
    }()
    

    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        return textField
    }()

    var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    var nameLineView: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        line.translatesAutoresizingMaskIntoConstraints = false
        
        return line
    }()
    
    var passwordLineView: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        line.translatesAutoresizingMaskIntoConstraints = false
        
        return line
    }()
    
    var nameImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "customer"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    
    var passwordImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "lock2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        view.addSubview(nameLineView)
        nameLineView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        nameLineView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLineView.widthAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true
        nameLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.bottomAnchor.constraint(equalTo: nameLineView.topAnchor, constant: 0).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: nameLineView.rightAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 60 - 40).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTextField.backgroundColor = UIColor.white
        
        view.addSubview(nameImageView)
        nameImageView.bottomAnchor.constraint(equalTo: nameLineView.topAnchor, constant: -5).isActive = true
        nameImageView.leftAnchor.constraint(equalTo: nameLineView.leftAnchor, constant: 5).isActive = true
        nameImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        nameImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        

        view.addSubview(passwordLineView)
        passwordLineView.topAnchor.constraint(equalTo: nameLineView.bottomAnchor, constant: 50).isActive = true
        passwordLineView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordLineView.widthAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true
        passwordLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.bottomAnchor.constraint(equalTo: passwordLineView.topAnchor, constant: 0).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: passwordLineView.rightAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 60 - 40).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.backgroundColor = UIColor.white
        
        view.addSubview(passwordImageView)
        passwordImageView.bottomAnchor.constraint(equalTo: passwordLineView.topAnchor, constant: -5).isActive = true
        passwordImageView.leftAnchor.constraint(equalTo: passwordLineView.leftAnchor, constant: 5).isActive = true
        passwordImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        passwordImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
   
        
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: passwordLineView.bottomAnchor, constant: 10).isActive = true
        loginButton.leftAnchor.constraint(equalTo: passwordLineView.leftAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 60).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
