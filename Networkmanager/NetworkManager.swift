//
//  NetworkManager.swift
//  FbTwGThirdparty
//
//  Created by Nishant on 27/07/17.
//  Copyright © 2017 Systematix. All rights reserved.
//

import UIKit

import AFNetworking
import MBProgressHUD


public class NetworkManager: NSObject {

    
    class func APIManager(_ parameters: [AnyHashable: Any],URL :String, success: @escaping (_ response: Any) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        let appDelegate: AppDelegate? = (UIApplication.shared.delegate as? AppDelegate)
        
        MBProgressHUD.hide(for: (appDelegate?.window)!, animated: true)
        MBProgressHUD.showAdded(to: (appDelegate?.window)!, animated: true)
      
        let manager = AFHTTPSessionManager(sessionConfiguration: URLSessionConfiguration.default)

        manager.requestSerializer = AFJSONRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer()
     
        manager.post(URL, parameters: parameters, progress: nil, success: {(_ task: URLSessionDataTask, _ responseObject: Any?) -> Void in
            MBProgressHUD.hide(for: (appDelegate?.window)!, animated: true)
            success(responseObject ?? NSDictionary())
        }, failure: {(_ task: URLSessionDataTask?, _ error: Error?) -> Void in
            failure(error)
            
            MBProgressHUD.hide(for: (appDelegate?.window)!, animated: true)
            GlobalVariable.instance.custome_alert(title: kmsg_title_error, msg: msg_APIFailed)
           
        })
    }
    
    
}
