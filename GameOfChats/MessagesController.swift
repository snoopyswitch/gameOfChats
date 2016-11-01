//
//  ViewController.swift
//  GameOfChats
//
//  Created by Mladen Vidović on 28/10/2016.
//  Copyright © 2016 Mladen Vidović. All rights reserved.
//

import UIKit
import Firebase

class MessagesController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(handleNewMessage))
        
        checkIfUserIsLoggedIn()
    }
    
    func handleNewMessage () {
        let newMessageController = NewMessageController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    
    
    func checkIfUserIsLoggedIn () {
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            let uid = FIRAuth.auth()?.currentUser?.uid
            
            FIRDatabase.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: {(snapshot) in
                
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
                }, withCancel: nil)
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

