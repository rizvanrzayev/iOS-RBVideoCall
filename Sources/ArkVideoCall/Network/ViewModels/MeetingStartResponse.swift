//
//  MeetingStartResponse.swift
//  ArkVideoCallDemo
//
//  Created by ArkSigner ArkSigner on 23.12.2022.
//  Copyright © 2022 ArkSigner ArkSigner. All rights reserved.
//

import Foundation


public struct MeetingStartResponse: Codable {
    let success: Bool
    let message: String?
    let errorCode: String?
}

