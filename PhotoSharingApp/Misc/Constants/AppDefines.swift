//
//  AppDefines.swift
//
//  Copyright © 2017 Codiant Software Technologies Pvt Ltd. All rights reserved.
//
import UIKit

struct Screen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(width, height)
    static let minLength = min(width, height)
}

struct Device {
    static let iPhone6 = UIDevice.current.userInterfaceIdiom == .phone && Screen.maxLength == 667.0
    static let iPhone6p = UIDevice.current.userInterfaceIdiom == .phone && Screen.maxLength == 736.0
    static let iPhoneX = UIDevice.current.userInterfaceIdiom == .phone && Screen.maxLength == 812.0
    static func needResizing() -> Bool { return Screen.height > 568.0 }
}

struct Color {
    
    static var orange: UIColor {
        get { return UIColor(red: 243.0/255.0, green: 146.0/255.0, blue: 31.0/255.0, alpha: 1.0) }
    }
    
    static var green: UIColor {
        get { return UIColor(red: 115.0/255.0, green: 219.0/255.0, blue: 120.0/255.0, alpha: 1.0) }
    }
    
    static var blue: UIColor {
        get { return UIColor(red: 59.0/255.0, green: 149.0/255.0, blue: 211.0/255.0, alpha: 1.0) }
    }
    
    static var darkGray: UIColor {
        get { return UIColor(red: 99.0/255.0, green: 99.0/255.0, blue: 99.0/255.0, alpha: 1.0) }
    }
    
    static var lightGray: UIColor {
        get { return UIColor(red: 163.0/255.0, green: 163.0/255.0, blue: 163.0/255.0, alpha: 1.0) }
    }
    
    static var barButtonItem: UIColor {
        get { return UIColor(red: 136.0/255.0, green: 136.0/255.0, blue: 136.0/255.0, alpha: 1.0) }
    }
    
    static var defaultIOSBlue: UIColor {
        get { return UIColor(red: 14.0/255.0, green: 122.0/255.0, blue: 254.0/255.0, alpha: 1.0) }
    }
}

