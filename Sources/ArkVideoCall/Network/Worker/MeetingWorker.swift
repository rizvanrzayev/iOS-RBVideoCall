//
//  MeetingWorker.swift
//  ArkVideoCallDemo
//
//  Created by ArkSigner ArkSigner on 23.12.2022.
//  Copyright © 2022 ArkSigner ArkSigner. All rights reserved.
//

import Foundation

public class MeetingWorker: BaseKdsWorker {
    func startMeeting(_ model: MeetingStartRequest, _ closure: @escaping (Int, MeetingStartResponse?, String) -> Void) {
        let headers = [
            "content-type": "application/json",
            "apikey": "0AF22349-1A6D-4B3B-87C6-AE28443609D2",
            "clientid": "65e7e4e3-0d8f-49f0-bec2-e3201481ca81",
            "cache-control": "no-cache"
        ]
        let parameters = [
            "transId" : model.transId,
            "location" : model.location,
            "model" : model.model,
            "brand" : model.brand,
            "id" : model.id,
            "version": model.version,
            "isTest" : model.isTest,
            "skillCodes" : model.skillCodes,
            "companyCode" : model.companyCode,
            "nameSurname" : model.nameSurname,
            "identyNumber" : model.identyNumber
        ] as [String : Any]
        
        var postUrl:String?
        postUrl = "\(AppData.sharedInstance.serviceRootUrl)/api/mobile/AddMeetingWithoutKyc"
        makeRequest(postUrl: postUrl!, params: parameters, headers: headers) { (statusCode, stringData) in
            if statusCode == 200 {
                do {
                    if let d = stringData {
                        let jsonDecoder = JSONDecoder()
                        let responseModel = try jsonDecoder.decode(MeetingStartResponse.self, from: d)
                        closure(statusCode, responseModel, String(data: d, encoding: .utf8) ?? "")
                    } else {
                        closure(statusCode, nil, "")
                    }
                } catch  {
                    print(error)
                    closure(statusCode, nil, "")
                }
            } else {
                closure(statusCode, nil, "")
            }
        }
    }
    
    func leaveMeeting(_ model: MeetingStartRequest, _ closure: @escaping (Int, MeetingStartResponse?, String) -> Void) {
        
        let headers = [
            "content-type": "application/json",
            "apikey": "0AF22349-1A6D-4B3B-87C6-AE28443609D2",
            "clientid": "65e7e4e3-0d8f-49f0-bec2-e3201481ca81",
            "cache-control": "no-cache"
        ]
        
        let parameters = [
            "transId": AppData.sharedInstance.currentTransId,
            "brand": model.brand,
            "id": model.id,
            "model": model.model,
            "location": "model.location",
            "version": model.version
            
        ] as [String : String]
        let postUrl = "\(AppData.sharedInstance.serviceRootUrl)/api/mobile/LeaveMeeting"
        makeRequest(postUrl: postUrl, params: parameters, headers: headers) { (statusCode, stringData) in
            print(statusCode)
        }
        
        
    }
    
    
    
}
