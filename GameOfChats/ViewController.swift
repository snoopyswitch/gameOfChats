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
        
        //let ref = FIRDatabase.database().reference(fromURL: "https://gameofchats-cbea8.firebaseio.com/")
        //ref.updateChildValues(["someValue": 123123])
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
    }
    
    
    func handleLogout () {
        
        let loginController = LoginController()
        
        present(loginController, animated: true, completion: nil)
    }
    
}

