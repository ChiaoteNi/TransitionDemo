//
//  FirstVC.swift
//  TransitionDemo
//
//  Created by Chiao on 2019/1/14.
//  Copyright © 2019 paradise-soft. All rights reserved.
//

import UIKit

class FirstVC: BaseTabRootController {

    let modalTransition: ModallyTransitionController = ModallyTransitionController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func presentSecVC() {
        guard let secVC = SBHelper.instantiate(vc: .secondVC, from: .main) as? SecondVC else { return }
        secVC.transitioningDelegate = modalTransition
        secVC.modalPresentationStyle = .custom
        modalTransition.interactionController.wire(viewController: secVC)
        present(secVC, animated: true, completion: nil)
    }
}
