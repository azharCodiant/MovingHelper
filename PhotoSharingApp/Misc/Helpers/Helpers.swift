//
//  Helpers.swift
//  PhotoSharingApp
//
//  Copyright © 2017 Codiant Software Technologies Pvt ltd. All rights reserved.
//

import Foundation
import UIKit


extension Date {
    
    func UTCDateString() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter.string(from: self)
    }
    
    func offsetFrom(date: Date) -> String {
        
        let dayHourMinuteSecond: Set<Calendar.Component> = [.day, .hour, .minute, .second]
        let difference = NSCalendar.current.dateComponents(dayHourMinuteSecond, from: date, to: self);
        
        let seconds = "\(difference.second ?? 0)s"
        let minutes = "\(difference.minute ?? 0)m" + " " + seconds
        let hours = "\(difference.hour ?? 0)h" + " " + minutes
        let days = "\(difference.day ?? 0)d" + " " + hours
        
        if let day = difference.day, day          > 0 { return days }
        if let hour = difference.hour, hour       > 0 { return hours }
        if let minute = difference.minute, minute > 0 { return minutes }
        if let second = difference.second, second > 0 { return seconds }
        return ""
    }
    
}

extension Data {
    
    func deserialize() -> [String: Any]? {
        
        do {
            let object = try JSONSerialization.jsonObject(with: self, options: []) as? [String: Any]
            return object
        }
        catch let error {
            //DDLogError(error.localizedDescription)
            return nil
        }
    }
}

extension UIViewController {
    
    func push(_ viewController: UIViewController, animated: Bool = true) -> Void {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func showAlertWith(message: String, cancelButtonCallback: (() -> Void)? = nil) {
        
        let alertController = UIAlertController(title: "PhotoSharingApp", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
            cancelButtonCallback?()
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func isModal() -> Bool {
        if let navigationController = self.navigationController{
            if navigationController.viewControllers.first != self{
                return false
            }
        }
        if self.presentingViewController != nil {
            return true
        }
        if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController  {
            return true
        }
        if self.tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        return false
    }
    
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        
        return base
    }
}

extension UINavigationController {

    func applyStyling() {
        self.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationBar.tintColor = Color.blue
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: Color.orange, NSAttributedStringKey.font: UIFont(name: "Avenir", size: 20)!]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: Color.blue, NSAttributedStringKey.font: UIFont(name: "Avenir", size: 20)!], for: .normal)
    }
}

extension UIStoryboard {
    
    func controllerExists(withIdentifier: String) -> Bool {
        if let availableIdentifiers = self.value(forKey: "identifierToNibNameMap") as? [String: Any] {
            return availableIdentifiers[withIdentifier] != nil
        }
        
        return false
    }
    
    func viewController<T>(withClass: T.Type) -> T? {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = NSStringFromClass(withClass as! AnyClass).components(separatedBy: ".")[1] // trimmed module name
        
        guard self.controllerExists(withIdentifier: identifier) else {
            return nil
        }
        
        return storyboard.instantiateViewController(withIdentifier: identifier) as? T
    }
}


struct Validator {
    
    static func emptyString(_ string: String?) -> Bool {
        if string == nil || string!.isKind(of: NSNull.self) || string == "null" || string == "<null>" || string == "(null)" {
            return true
        }
        return string!.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty
    }
    
    static func filter(string: String?) -> String {
        if string == nil || string!.isKind(of: NSNull.self) || string == "null" || string == "<null>" || string == "(null)" {
            return ""
        }
        return string!.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    static func validEmail(_ email: String?) -> Bool {
        guard let emailAddress = email,
            !emptyString(emailAddress) else {
                return false
        }
        
        let filteredEmail = emailAddress.trimmingCharacters(in: CharacterSet.whitespaces)
        let regex = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" +
            "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailValidator = NSPredicate(format:"SELF MATCHES %@", regex)
        return emailValidator.evaluate(with: filteredEmail)
    }
}

// Vaue Transformers
/*
let IntToStringTransform = TransformOf<String, Int>(fromJSON: { (value: Int?) -> String? in
    guard let val = value else { return nil }
    return "\(val)"
}, toJSON: { (value: String?) -> Int? in
    if let value = value { return Int(value) }
    return nil
})

let StringToDoubleTransform = TransformOf<Double, String>(fromJSON: { (value: String?) -> Double? in
    if let value = value { return Double(value) }
    return 0.0
}, toJSON: { (value: Double?) -> String? in
    if let value = value { return String(value) }
    return "0.0"
})

let BoolToStringTransform = TransformOf<String, Bool>(fromJSON: { (value: Bool?) -> String? in
    guard let nonOptionalValue = value else {return "false"}
    return nonOptionalValue.description
}, toJSON: { (value: String?) -> Bool? in
    guard let nonOptionalValue = value else {return false}
    return nonOptionalValue == "true" ? true : false
})
 */
