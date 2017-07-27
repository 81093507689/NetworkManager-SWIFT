//
//  ViewController.swift
//  Networkmanager
//
//  Created by Nishant on 27/07/17.
//  Copyright © 2017 Systematix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txt_email:UITextField? = UITextField()
    @IBOutlet var txt_pass:UITextField? = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click_Login(_ sender: AnyObject)
    {
        
            self.connection_login()
    }
    
    
    func connection_login()
    {
        
        let params = [
            "email": self.txt_email?.text ?? String(),
            "password": self.txt_pass?.text ?? String()
        ]
        
        
        NetworkManager.APIManager(params, URL: kURL_LOGIN, success: {(_ response: Any) -> Void in
            
            print(response)
            
           
            
            
        }, failure: {(_ error: Error?) -> Void in
            
            
        })
        
        
        
        
        
    }
    

    
}

