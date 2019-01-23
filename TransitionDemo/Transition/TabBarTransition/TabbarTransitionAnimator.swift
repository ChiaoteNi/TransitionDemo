//
//  SwipeTransitionAnimator.swift
//  TransitionDemo
//
//  Created by Chiao on 2018/11/16.
//  Copyright © 2018年 Chaio. All rights reserved.
//

import Foundation
import UIKit

class TabbarTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let targetEdge: UIRectEdge
    
    init(targetEdge edge: UIRectEdge) {
        targetEdge = edge
        super.init()
        
        guard edge != .left && edge != .right else { return }
        assert(false, "edge只吃left||right")
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let toVC = transitionContext.viewController(forKey: .to) else {
                transitionContext.completeTransition(false)
                return
        }
        
        guard let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to) else {
                transitionContext.completeTransition(false)
                return
        }
        
        let containerView = transitionContext.containerView
        
        let fromFrame: CGRect = transitionContext.initialFrame(for: fromVC)
        let toFrame: CGRect = transitionContext.finalFrame(for: toVC)
        
        let offset: CGVector = CGVector(dx: targetEdge == .left ? -1 : 1,
                                        dy: 0)
        fromView.frame = fromFrame
        
        let targetView = toView
        targetView.frame = toFrame.offsetBy(dx: toFrame.size.width * offset.dx * -1,
                                            dy: toFrame.size.height * offset.dy * -1)
        containerView.addSubview(targetView)
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, options: [.beginFromCurrentState, .overrideInheritedCurve, .overrideInheritedOptions, .overrideInheritedDuration], animations: {
            fromView.frame = fromFrame.offsetBy(dx: fromFrame.size.width * offset.dx,
                                                dy: fromFrame.size.height * offset.dy)
            toView.frame = toFrame
        }, completion: { finished in
            if finished {
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                toVC.setNeedsStatusBarAppearanceUpdate()
            } else {
                fromView.frame = fromFrame.offsetBy(dx: fromFrame.size.width * offset.dx,
                                                    dy: fromFrame.size.height * offset.dy)
                toView.frame = toFrame
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        })
    }
}

