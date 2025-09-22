//
//  ColorConstants.swift
//  ArkVideoCallDemo
//
//  Created by ArkSigner ArkSigner on 23.12.2022.
//  Copyright © 2022 ArkSigner ArkSigner. All rights reserved.
//

import Foundation
import UIKit

struct ColorConstants {
//    static let btnStartColor = UIColor(red: 74, green: 160, blue: 203, alpha: 1)
//    static let btnEndColor = UIColor(red: 121, green: 232, blue: 160, alpha: 1)
    
    static func UIColorFromRGB(_ rgbValue: Int) -> UIColor {
        return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0x00FF00) >> 8))/255.0, blue: ((CGFloat)((rgbValue & 0x0000FF)))/255.0, alpha: 1.0)
    }
}
