//
//  MenuViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class MenuViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     *
     * 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
     *
     * 2) Use Autolayout to make sure all UI works for each resolution
     *
     * 3) Use this starter project as a base and build upon it. It is ok to remove some of the
     *    provided code if necessary. It is ok to add any classes. This is your project now!
     *
     * 4) Read the additional instructions comments throughout the codebase, they will guide you.
     *
     * 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
     *
     * Thank you and Good luck. - Rapptr Labs
     * =========================================================================================
     */
    
    // MARK: - Outlets
    @IBOutlet weak var chatButton: MenuButtonView!
    @IBOutlet weak var loginButton: MenuButtonView!
    @IBOutlet weak var animationButton: MenuButtonView!
    
    lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bg_home_menu"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var mainView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Coding Tasks"
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = attributes
        navigationController?.navigationBar.barTintColor = .headerBackground
        
        
        setupUI()
    }
    
    private func setupUI() {
        setupBackground()
        setupMainView()
        setupChatButton()
        setupLoginButton()
        setupAnimationButton()
    }
    
    private func setupBackground() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])

    }
    
    private func setupMainView() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ])
    }
    
    private func setupChatButton() {
        let icon = UIImage(named: "ic_chat")
        let tintedImage = icon?.withRenderingMode(.alwaysOriginal)
        chatButton.setupView(title: "CHAT".uppercased(), icon: tintedImage ?? .init())
        chatButton.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(chatButton)
        
        NSLayoutConstraint.activate([
            chatButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: Dimension.shared.largeHorizontalMargin_30),
            chatButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -Dimension.shared.largeHorizontalMargin_30),
            chatButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 0),
            chatButton.heightAnchor.constraint(equalToConstant: Dimension.shared.buttonHeight)

        ])
        
    }
    
    private func setupLoginButton() {
        let icon = UIImage(named: "ic_login")
        let tintedImage = icon?.withRenderingMode(.alwaysOriginal)
        loginButton.setupView(title: "LOGIN".uppercased(), icon: tintedImage ?? .init())
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: chatButton.leadingAnchor, constant: 0),
            loginButton.trailingAnchor.constraint(equalTo: chatButton.trailingAnchor, constant: 0),
            loginButton.topAnchor.constraint(equalTo: chatButton.bottomAnchor, constant: Dimension.shared.largeVerticalMargin),
            loginButton.heightAnchor.constraint(equalTo: chatButton.heightAnchor, constant: 0)

        ])
    }
    
    private func setupAnimationButton() {
        let icon = UIImage(named: "ic_animation")
        let tintedImage = icon?.withRenderingMode(.alwaysOriginal)

        animationButton.setupView(title: "ANIMATION".uppercased(), icon: tintedImage ?? .init())
        animationButton.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(animationButton)
        
        NSLayoutConstraint.activate([
            animationButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: 0),
            animationButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor, constant: 0),
            animationButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: Dimension.shared.largeVerticalMargin),
            animationButton.heightAnchor.constraint(equalTo: chatButton.heightAnchor, constant: 0),
            animationButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 0)

        ])
    }
    
    // MARK: - Actions
    @IBAction func didPressChatButton(_ sender: Any) {
        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    @IBAction func didPressLoginButton(_ sender: Any) {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    @IBAction func didPressAnimationButton(_ sender: Any) {
        let animationViewController = AnimationViewController()
        navigationController?.pushViewController(animationViewController, animated: true)
    }
}
