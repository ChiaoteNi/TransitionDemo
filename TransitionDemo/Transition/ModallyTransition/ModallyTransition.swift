//
//  ModallyTransitionController.swift
//  TransitionDemo
//
//  Created by Chiao on 2019/1/14.
//  Copyright © 2019 paradise-soft. All rights reserved.
//

import UIKit

class ModallyTransitionController: NSObject, UIViewControllerTransitioningDelegate {

    let presentAnimator: ModallyPresentAnimator = ModallyPresentAnimator()
    let dismissAnimator: ModallyDismissAnimator = ModallyDismissAnimator()
    let interactionController: SwipeVerticalInteractionController = SwipeVerticalInteractionController() // UIPercentDrivenInteractiveTransition
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissAnimator
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController.interacting ? interactionController : nil
    }
}
