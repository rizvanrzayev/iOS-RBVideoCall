//
//  BaseKdsWorker.swift
//  ArkVideoCallDemo
//
//  Created by ArkSigner ArkSigner on 23.12.2022.
//  Copyright © 2022 ArkSigner ArkSigner. All rights reserved.
//

import Foundation
// import Alamofire

public class BaseKdsWorker {
    public func makeRequest(postUrl: String, params: Any, headers: [String: String], closure: @escaping (Int, Data?) -> Void) {
       
//        var httpHeaders = HTTPHeaders()
//        for headerName in headers {
//            httpHeaders[headerName.key] = headerName.value
//        }
        
        
        debugPrint(postUrl)
        debugPrint(params)
//        let request = AF.request(postUrl, method: .post, parameters: params as! Parameters, encoding: JSONEncoding.default, headers: httpHeaders)
//        let request = Alamofire.request(postUrl, method: .post, parameters: params, encoder: JSONParameterEncoder.default, headers: httpHeaders)
//        request.responseString { (response) in
//            print(response)
//            
//            if let data = response.data {
//                let responseBody = String(data: data, encoding: .utf8)
//                print(responseBody)
//            }
//
//            if let error = response.error {
//                print(error)
//                closure(-1, nil)
//                return
//            }
//
//            guard let resp = response.response else {
//                closure(-1, nil)
//                return
//            }
//
//            if resp.statusCode == 200 {
//                if let d = response.data {
//                    closure(resp.statusCode, d)
//                } else {
//                    closure(-1, nil)
//                }
//            } else {
//                closure(resp.statusCode, nil)
//            }
//        }
    }
}
