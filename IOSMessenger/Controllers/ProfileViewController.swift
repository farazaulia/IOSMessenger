//
//  ProfileViewController.swift
//  IOSMessenger
//
//  Created by Faraz Muhammad Aulia on 24/09/20.
//  Copyright © 2020 Faraz Muhammad Aulia. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    private let profileTableView = UITableView(frame: .zero, style: .grouped)
    private let cellId = "ProfileCell"
    
    let data = ["Log Out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureProfileTableView()
    }
    
    private func configureProfileTableView() {
        view.addSubview(profileTableView)
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        profileTableView.frame = view.bounds
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
}


extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.backgroundColor = .white
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { [weak self] _ in
            guard let self = self else { return }
            self.handleLogOut()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
    
    private func handleLogOut() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true)
        } catch {
            print("Failed to log out")
        }
    }
    
}
