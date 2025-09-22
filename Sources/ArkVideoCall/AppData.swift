//
//
//  AppData.swift
//  ArkVideoCallDemo
//
//  Created by ArkSigner ArkSigner on 23.12.2022.
//  Copyright © 2022 ArkSigner ArkSigner. All rights reserved.
//


import Foundation
import UIKit

class AppData {
    static var sharedInstance = AppData()
    
    private init() {
    }
    
    public var currentTransId: String = ""
    public var isInQueue: Bool? = nil
    public var nameSurname: String = ""
    public var idNumber: String = ""
    var serviceRootUrl: String = "https://commtestservice.arksigner.com"
    var nativeChatUrl: String = "https://jitsi11.arksigner.com"
     
}
