//
//  StringExtension.swift
//  ArkVideoCallDemo
//
//  Created by ArkSigner ArkSigner on 23.12.2022.
//  Copyright © 2022 ArkSigner ArkSigner. All rights reserved.
//

import Foundation

extension String {
    func validateUrl() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).starts(with: "https://")
        
        let urlRegEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        let predicate = NSPredicate(format:"SELF MATCHES %@", argumentArray:[urlRegEx])
        var urlTest = NSPredicate.withSubstitutionVariables(predicate)
        
        return predicate.evaluate(with: self)
    }
    
    func includeTrailingSlash() -> String {
        if self.hasSuffix("/") {
            return self
        } else {
            return "\(self)/"
        }
    }
    
    func getDomain() -> String {
        let url = URL(string: self)
        if let domain = url?.host {
            return domain
        }
        
        return self
    }
}
