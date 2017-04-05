//
//  HttpService.swift
//  LoginTempl
//
//  Created by IvanK on 3/13/17.
//  Copyright © 2017 IvanK. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

let URL_Login:String = "https://here.url/get"
let URL_Signup:String = "https://here.url/post"


public typealias CompletionHandler = ((Any?, Error?) -> Void)

public func logInWith( userName:NSString!,
                       passWord:NSString!,
                       completion: @escaping CompletionHandler ) {
    
    Alamofire.request(URL_Login).responseJSON { response in
        
        debugPrint(response)
        
        if let json = response.result.value {
            
            completion(json, nil)
            
        } else {
            
            completion(nil, nil)
        }
    }
    
}

public func SignUpWith(userName:NSString!,
                       passWord:NSString!,
                       email:NSString!,
                       completion: @escaping CompletionHandler ) {
    
    let parameters: Parameters = [
        "userName": userName,
        "email": email,
        "passWord": passWord,
        "params": [
            "a": 1,
            "b": 2,
            "c": 3
        ]
    ]
    
    Alamofire.request(URL_Signup, method: .post, parameters: parameters).responseJSON { response in
        
        debugPrint(response)
        
        if let json = response.result.value {
            
            completion(json, nil)
            
        }
    }
    
    
    
}
