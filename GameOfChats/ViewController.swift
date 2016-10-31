//
//  ViewController.swift
//  GameOfChats
//
//  Created by Mladen Vidović on 28/10/2016.
//  Copyright © 2016 Mladen Vidović. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        if FIRAuth.auth()?.currentUser?.uid == nil {//user is not logged in
            
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
            
            
        }
    }
    
    
    func handleLogout () {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        
        
        let loginController = LoginController()
        
        present(loginController, animated: true, completion: nil)
    }
    
}

