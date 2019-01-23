//
//  public extension + Array.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/7.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation

public extension Array {
    typealias E = Element
    
    public subscript(safe index: Int) -> E? {
        guard index >= 0, index < count else { return nil }
        let element = self[index]
        return element
    }
}
