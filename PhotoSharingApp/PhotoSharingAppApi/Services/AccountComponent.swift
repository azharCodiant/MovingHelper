//
//  AccountComponent.swift
//  PhotoSharingApp
//
//  Copyright © 2018 Codiant. All rights reserved.
//

import UIKit

struct AccountComponent {
    
    static func signUp(parameters: HTTPParameters, closure: @escaping (Bool, Data?, Error?)->Void) {
        
        NSSession.shared.requestWith(path: "signup", method: .post, parameters: parameters, retryCount: 2) { (success, data, error) in
            closure(success, data, error)
        }
    }
    
    static func login(parameters: HTTPParameters, closure: @escaping (Bool, Data?, Error?)->Void) {
        
        NSSession.shared.requestWith(path: "login", method: .post, parameters: parameters, retryCount: 2) { (success, data, error) in
            closure(success, data, error)
        }
    }
    
    static func logout(closure: @escaping (Bool, Data?, Error?)->Void) {
        
        NSSession.shared.requestWith(path: "logout", method: .post, parameters: [:], retryCount: 2) { (success, data, error) in
            closure(success, data, error)
        }
    }
    
    static func forgotPassword(parameters: HTTPParameters, closure: @escaping (Bool, Data?, Error?)->Void) {
        
        NSSession.shared.requestWith(path: "recover", method: .post, parameters: parameters, retryCount: 2) { (success, data, error) in
            closure(success, data, error)
        }
    }
    
    static func changePassword(parameters: HTTPParameters, closure: @escaping (Bool, Data?, Error?)->Void) {
        
        NSSession.shared.requestWith(path: "changepassword", method: .post, parameters: parameters, retryCount: 2) { (success, data, error) in
            closure(success, data, error)
        }
    }

}
