//
//  UserDefaults.swift
//  MovieApp
//
//  Created by Rustem Manafov on 03.09.22.
//

import Foundation

// For Onboarding page UserDefaults
extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}
