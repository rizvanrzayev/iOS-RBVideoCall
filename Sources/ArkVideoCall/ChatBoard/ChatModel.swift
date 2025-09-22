//
//  ChatModel.swift
//  ArkVideoCallDemo
//
//  Created by ArkSigner ArkSigner on 23.12.2022.
//  Copyright © 2022 ArkSigner ArkSigner. All rights reserved.
//

import Foundation
import UIKit

public struct Message {
    let text: String
    let isInComing:Bool
    let time: Date
}

public struct combinedMessage {
    let cText: String
    let cIsInComing:Bool
    let cTime: Date
}

public var messages = [[Message]]()

public var combinedMessages = [String: combinedMessage]()

public var messageList = [Int(): ["Text": String(), "isInComing": Bool(), "Time": String()]]

public var isChatTableVisible:Bool? = nil

public var isInComingBubbleGroundColor:UIColor?
public var isOutGoingBubleGroundColor:UIColor?

public var dateLabelBackgroundcolor:UIColor?
public var messageViewBackgroundColor:UIColor?
public var TextFieldBackgroundColor:UIColor?
public var tableViewBackgroundColor:UIColor?

public var isInComingTextColor:UIColor?
public var isOutGoingTextColor:UIColor?
public var dateLabelTextColor:UIColor?

public var messageLabelFont:UIFont?
public var dateLabelFont:UIFont?
public var TextFieldFont:UIFont?









