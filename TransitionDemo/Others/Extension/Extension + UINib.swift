//
//  Extension + UINib.swift
//  TransitionDemo
//
//  Created by Chiao on 2018/11/17.
//  Copyright © 2018年 Chaio. All rights reserved.
//

import Foundation
import UIKit

// MARK: - LoadNib
public extension UINib {
    public class func load(nibName name: String, bundle: Bundle? = nil) -> Any? {
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: nil, options: nil).first
    }
    
    public class func loadView<T: UIView>(class: T.Type) -> T?  {
        let nibName = T.className
        return load(nibName: nibName) as? T
    }
}
