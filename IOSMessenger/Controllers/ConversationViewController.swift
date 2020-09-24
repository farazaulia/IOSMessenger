//
//  ViewController.swift
//  IOSMessenger
//
//  Created by Faraz Muhammad Aulia on 24/09/20.
//  Copyright © 2020 Faraz Muhammad Aulia. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let isAuthenticated = UserDefaults.standard.bool(forKey: "authenticated")
        
        if !isAuthenticated {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }
    

}

