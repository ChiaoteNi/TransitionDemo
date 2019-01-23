//
//  public extension + CALayer.swift
//  comic
//
//  Created by Chiao-Te Ni on 2017/12/7.
//  Copyright © 2017年 Appimc. All rights reserved.
//

import Foundation
import UIKit

public extension CALayer {
    
    public func setGradientBGColor(colors: [CGColor], locations: [NSNumber], direction: Direction = .vertical) {
        let headerGradient = CAGradientLayer()
        headerGradient.frame = self.bounds
        headerGradient.colors = colors
        headerGradient.locations = locations
        if direction == .vertical {
            headerGradient.startPoint = CGPoint(x: 1, y: 0)
            headerGradient.endPoint   = CGPoint(x: 1, y: 1)
        } else {
            headerGradient.startPoint = CGPoint(x: 0, y: 1)
            headerGradient.endPoint   = CGPoint(x: 1, y: 1)
        }
        
        self.insertSublayer(headerGradient, at: 0)
    }
    
    public enum Direction {
        case vertical
        case horizental
    }
}
