//
//  LoginViewController.swift
//  KTV
//
//  Created by 정현준 on 6/13/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var launchImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setButton()
    }

    func setButton() {

        self.loginButton.layer.cornerRadius = loginButton.bounds.height / 2
        self.loginButton.layer.borderColor = UIColor(named: "main-brown")?.cgColor
        self.loginButton.layer.borderWidth = 1
        self.loginButton.clipsToBounds = true

    }

    @IBAction func loginDidTap(_ sender: Any) {
        self.view.window?.rootViewController = self.storyboard?.instantiateViewController(withIdentifier: "tabbar")
    }

}

