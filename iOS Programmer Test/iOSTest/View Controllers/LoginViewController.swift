//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    
    // MARK: - Properties
    @IBOutlet weak var tfEmail: InputField!
    @IBOutlet weak var tfPassword: InputField!
    
    @IBOutlet weak var btnSubmit: UIButton!
    private var client: LoginClient?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        client = LoginClient()
        
        tfEmail.backgroundColor = .viewBackground
        tfEmail.layer.opacity = 0.8
        tfEmail.layer.cornerRadius = 5.0
        tfEmail.clipsToBounds = true
        tfEmail.layer.borderWidth = 0
        
        tfPassword.backgroundColor = .viewBackground
        tfPassword.layer.opacity = 0.8
        tfPassword.layer.cornerRadius = 5.0
        tfPassword.clipsToBounds = true
        tfPassword.layer.borderWidth = 0
        
        btnSubmit.backgroundColor = .headerBackground
        btnSubmit.setTitleColor(.white, for: .normal)
        
    }
        
    // MARK: - Actions
    @IBAction func backAction(_ sender: Any) {
        let mainMenuViewController = MenuViewController()
        self.navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        guard let email = tfEmail.text, let password = tfPassword.text else { return }
        let started = NSDate()
        
        client?.login(withEmail: email, password: password, completion: { [weak self] (json, error) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                
                if let msg = error {
                    self.showAlert("Error", message: msg)
                } else {
                    guard let json = (json ?? [:]) as? [String: String] else { return }
                    let msg = json["message"]
                    let after = NSDate().timeIntervalSince(started as Date).rounded()
                    self.showAlert("Success", message: "\(String(describing: msg!)) and it takes \(after * 1000) miliseconds" , handleAction: {
                        self.navigationController?.popViewController(animated: true)
                    })
                }
            }
            
        })
    }
    
    private func showAlert(_ title: String = "", message: String = "", handleAction: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
            handleAction?()
        })
        alert.addAction(ok)
        
        self.present(alert, animated: true)

    }
}
