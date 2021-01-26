//
//  Companie.swift
//  Testios
//
//  Created by Christophe Vichery on 1/25/21.
//

import UIKit

class Companie: NSObject {
    var id: UInt64?
    var name: String?
    var location: Dictionary<String, String>?
    var revenue: Array<Dictionary<String, AnyObject>>?
}
