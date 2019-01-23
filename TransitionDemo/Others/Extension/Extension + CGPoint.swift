//
//  Extension + CGPoint.swift
//  TransitionDemo
//
//  Created by Chiao on 2018/11/14.
//  Copyright © 2018年 Chaio. All rights reserved.
//

import Foundation
import CoreGraphics

func + (_ leftItem: CGPoint,_ rightItem: CGPoint) -> CGPoint {
    return CGPoint(x: leftItem.x + rightItem.x,
                   y: leftItem.y + rightItem.y)
}
