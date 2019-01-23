//
//  PopAnimator.swift
//  TransitionDemo
//
//  Created by Chiao on 2019/1/15.
//  Copyright © 2019 paradise-soft. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) else {
                transitionContext.completeTransition(false)
                return
        }
        
        guard let fromView = fromVC.view, let toView = toVC.view else {
            transitionContext.completeTransition(false)
            return
        }
        
        let containerView = transitionContext.containerView
        containerView.insertSubview(toView, belowSubview: fromView)
        fromView.frame = CGRect(x: 0, y: 0,
                                width: fromView.frame.width,
                                height: fromView.frame.height)
        toView.frame = CGRect(x: -200,y: 0,
                              width: fromView.frame.width,
                              height: fromView.frame.height)
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.frame = CGRect(x: 0,
                                    y: fromView.frame.height,
                                    width: fromView.frame.width,
                                    height: fromView.frame.height)
            toView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: toView.frame.width,
                                  height: toView.frame.height)
        }, completion: { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
