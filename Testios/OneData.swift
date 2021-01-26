//
//  OneData.swift
//  Testios
//
//  Created by Christophe Vichery on 1/25/21.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1) {
        self.init(
            red: CGFloat(red)/255,
            green: CGFloat(green)/255,
            blue: CGFloat(blue)/255,
            alpha: a
        )
    }
    
    convenience init(rgb: Int, a: CGFloat = 1) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}

class OneData: NSObject {
    var currentDeviceWt: CGFloat = 0
    var currentDeviceHt: CGFloat = 0
    
    var listOfPics = [UIImage]()
    
    static let shared = OneData()
    override init() {
        super.init()
        
        // Set device size
        if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
            currentDeviceWt = UIScreen.main.bounds.width
            currentDeviceHt = UIScreen.main.bounds.height
        } else {
            currentDeviceWt = UIScreen.main.bounds.height
            currentDeviceHt = UIScreen.main.bounds.width
        }
    }
}
