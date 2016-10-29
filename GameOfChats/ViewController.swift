//
//  ViewController.swift
//  GameOfChats
//
//  Created by Mladen Vidović on 28/10/2016.
//  Copyright © 2016 Mladen Vidović. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
    }
    
    
    func handleLogout () {
        
        let loginController = LoginController()
        
        present(loginController, animated: true, completion: nil)
    }
    
}

