//
//  ModallyPresentAnimator.swift
//  TransitionDemo
//
//  Created by Chiao on 2019/1/14.
//  Copyright © 2019 paradise-soft. All rights reserved.
//

import UIKit

class ModallyPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) else { return }
        
        var bounds = UIScreen.main.bounds
        bounds.size = CGSize(width: 300, height: 300)
        bounds.origin = CGPoint(x: 100, y: 100)
        
        let maskView = UIView(frame: UIScreen.main.bounds)
        maskView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        maskView.alpha = 0
        
        toVC.view.frame = bounds.offsetBy(dx: 0, dy: UIScreen.main.bounds.height)
        toVC.view.layer.cornerRadius = 30
        toVC.view.layer.masksToBounds = true
//        toVC.view.frame.size = CGSize(width: 300, height: 300)
        
        let containerView = transitionContext.containerView
        containerView.addSubview(maskView)
        containerView.addSubview(toVC.view)

        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseIn, animations: {
            toVC.view.frame = bounds
            maskView.alpha = 1
        }, completion: { finish in
            transitionContext.completeTransition(finish)
        })
    }
    
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        guard let fromVC = transitionContext.viewController(forKey: .from) else { return }
//        guard let toVC = transitionContext.viewController(forKey: .to) else { return }
//        
//        let container = transitionContext.containerView
//        toVC.view.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 300))
//        toVC.view.layer.cornerRadius = 30
//        toVC.view.layer.masksToBounds = true
//        container.addSubview(toVC.view)
//        
//        let snapShot = fromVC.view.snapshotView(afterScreenUpdates: true)
//        if let snap = snapShot { container.addSubview(snap) }
//        
//        UIView.animate(withDuration: 0.25, animations: {
//            snapShot?.alpha = 0
//        }, completion: { _ in
//            snapShot?.removeFromSuperview()
//            transitionContext.completeTransition(true)
//        })
//    }
}
