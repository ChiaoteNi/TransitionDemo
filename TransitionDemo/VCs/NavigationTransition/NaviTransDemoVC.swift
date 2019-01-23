//
//  FirstNaviDemoVC.swift
//  TransitionDemo
//
//  Created by Chiao on 2019/1/14.
//  Copyright © 2019 paradise-soft. All rights reserved.
//

import UIKit

class FirstNaviDemoVC: BaseTabRootController {

    let transition = NaviTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func presentSecVC() {
        guard let secVC = SBHelper.instantiate(vc: .secondVC, from: .main) as? SecondVC else { return }
        guard let naviController = navigationController else { return }
        naviController.delegate = transition
        transition.popInteractiveAnimator.wire(viewController: secVC)
        naviController.pushViewController(secVC, animated: true)
    }
}
