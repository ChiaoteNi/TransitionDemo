//
//  TabBarController.swift
//  TransitionDemo
//
//  Created by Chiao on 2019/1/13.
//  Copyright © 2019 paradise-soft. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    let transition = TabbarTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = transition
        transition.interactionController.wire(viewController: self)
    }
}
