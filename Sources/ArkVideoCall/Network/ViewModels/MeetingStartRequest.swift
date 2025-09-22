//
//  MeetingStartRequest.swift
//  ArkVideoCallDemo
//
//  Created by ArkSigner ArkSigner on 23.12.2022.
//  Copyright © 2022 ArkSigner ArkSigner. All rights reserved.
//

import Foundation

public class MeetingStartRequest: Encodable {
    public var transId: String = ""
    public var location: String = ""
    public var model: String = ""
    public var brand: String = ""
    public var id: String = ""
    public var version: String = ""
    public var isTest: Bool = true
    public var skillCodes: [String] = []
    public var companyCode: String = ""
    public var nameSurname: String = ""
    public var identyNumber: String = ""
}

extension MeetingStartRequest {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
    
    var asString: String {
        return dictionary?.description ?? ""
    }
}
