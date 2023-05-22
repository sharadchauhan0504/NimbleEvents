//
//  SwiftPublicMethods.swift
//  NimbleEvents
//
//  Created by skdevil on 05/22/2023.
//  Copyright (c) 2023 skdevil. All rights reserved.
//

import Foundation

public final class SwiftPublicMethods {
    
    let name = "SwiftPublicMethods"
    public init() {}
    
    public func addEventToSystem(map: [String: String]) -> Bool {
        let keys = map.keys.map { strdup($0) }
        let values = map.values.map { strdup($0) }
        
        var convertedKeysArray: [UnsafePointer<CChar>?] = []
        for pointer in keys {
            if let unwrappedPointer = pointer {
                convertedKeysArray.append(UnsafePointer(unwrappedPointer))
            } else {
                convertedKeysArray.append(nil)
            }
        }
        
        var convertedValuesArray: [UnsafePointer<CChar>?] = []
        for pointer in values {
            if let unwrappedPointer = pointer {
                convertedValuesArray.append(UnsafePointer(unwrappedPointer))
            } else {
                convertedValuesArray.append(nil)
            }
        }
        
        let success = addEventToSystemC(&convertedKeysArray, &convertedValuesArray, Int32(map.count))
        
        keys.forEach { free($0) }
        values.forEach { free($0) }
        
        return success
    }
    
    public func getAggregatedAnswer(key: String) -> [Float] {
        let cKey = strdup(key)
        let result = getAggregatedAnswerC(cKey)
        free(cKey)
        
        var aggregatedValues = [Float]()
        var index = 0
        
        while result?[index] != 0.0 {
            aggregatedValues.append(result?[index] ?? 0.0)
            index += 1
        }
        
        free(result)
        
        return aggregatedValues
    }
}

