//
//  public extension + CGAffineTransform.swift
//  ck101
//
//  Created by Chiao-Te Ni on 2018/3/28.
//  Copyright © 2018年 Webber. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGAffineTransform {
    
    public init(rotationDegree: CGFloat) {
        self = CGAffineTransform(rotationAngle: rotationDegree / 180 * .pi)
    }
}
