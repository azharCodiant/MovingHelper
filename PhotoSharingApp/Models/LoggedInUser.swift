//
//  LoggedInUser.swift
//  PhotoSharingApp
//
//  Copyright © 2018 Codiant. All rights reserved.
//

import UIKit
import ObjectMapper

enum KeychainSyncType {
    case fromKeychain, toKeychain
}

@objcMembers
class LoggedInUser: NSObject, Mappable {

    var dateOfBirth: String!
    var email: String!
    var firstname: String!
    var id: String!
    var lastname: String!
    var patientID: String!
    var phone: String!
    var accessToken: String!
    
    private var keychainStorage: UICKeyChainStore!
    
    static let shared: LoggedInUser = {
        let instance = LoggedInUser()
        instance.keychainStorage = UICKeyChainStore(service: Bundle.main.bundleIdentifier!)
        return instance
    }()
    
    required init?(map: Map){}
    
    private override init(){}
    
    func mapping(map: Map) {
        accessToken <- map["token"]
        
        dateOfBirth <- map["userdata.date_of_birth"]
        email <- map["userdata.email"]
        firstname <- map["userdata.firstname"]
        id <- (map["userdata.id"])
        lastname <- map["userdata.lastname"]
        patientID <- (map["userdata.patientID"])
        phone <- map["userdata.phone"]
    }

    //  MARK:- Public methods
    func map(JSONObject: Any?) {
        _ = Mapper(context: nil).map(JSONObject: JSONObject, toObject: self)
        syncUser(type: .toKeychain)
        UserDefaults.standard.set(true, forKey: "UserLoggedIn")
    }
    
    func checkLastUserSession() -> Bool {
        let sessionAvailable = UserDefaults.standard.bool(forKey: "UserLoggedIn")
        if sessionAvailable {
            self.syncUser(type: .fromKeychain)
        }
        return sessionAvailable
    }
    
    func clear() {
        for children in Mirror(reflecting: self).children {
            guard let label = children.label,
                label != "keychainStorage" else {
                    continue
            }
            self.setValue("", forKey: label)
        }
        self.keychainStorage.removeAllItems()
        UserDefaults.standard.set(false, forKey: "UserLoggedIn")
    }
    
    func syncUser(type: KeychainSyncType) {
        for children in Mirror(reflecting: self).children {
            guard let label = children.label,
                label != "keychainStorage" else {
                    continue
            }

            if type == .toKeychain {
                if let keychainValue = children.value as? String {
                    self.keychainStorage.setString(keychainValue, forKey: label)
                }
            }
            else {
                if let keychainValue = self.keychainStorage.string(forKey: label) {
                    self.setValue(keychainValue, forKey: label)
                }
            }
        }
    }
}

