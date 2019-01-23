//
//  ModallyDismissAnimator.swift
//  TransitionDemo
//
//  Created by Chiao on 2019/1/14.
//  Copyright © 2019 paradise-soft. All rights reserved.
//

import UIKit

class ModallyDismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)
        let bounds = UIScreen.main.bounds

        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseIn, animations: {
            fromVC?.view.frame = bounds.offsetBy(dx: 0, dy: bounds.size.height)
        }, completion: { finish in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }    
}
