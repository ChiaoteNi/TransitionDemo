//
//  NavigationTransitionController.swift
//  TransitionDemo
//
//  Created by Chiao on 2019/1/14.
//  Copyright © 2019 paradise-soft. All rights reserved.
//

import UIKit

class NaviTransition: NSObject, UINavigationControllerDelegate {
    
    let pushAnimator = PushAnimator()
    let popAnimator = PopAnimator()
    let popInteractiveAnimator = NaviInteractionController()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push: return pushAnimator
        case .pop: return popAnimator
        case .none: return nil
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return (animationController is PopAnimator && popInteractiveAnimator.interacting == true) ? popInteractiveAnimator : nil
    }
}
