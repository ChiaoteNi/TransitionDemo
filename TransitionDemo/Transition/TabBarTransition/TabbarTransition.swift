//
//  SwipTransitionDelegate.swift
//  TransitionDemo
//
//  Created by Chiao on 2018/11/16.
//  Copyright © 2018年 Chaio. All rights reserved.
//

import Foundation
import UIKit

class TabbarTransition: NSObject {
    
    let swipeLeftAnimator = TabbarTransitionAnimator(targetEdge: .left)
    let swipeRightAnimator = TabbarTransitionAnimator(targetEdge: .right)
    let interactionController = TabbarInteractionController()
}

extension TabbarTransition: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let vcs = tabBarController.viewControllers, vcs.count > 0 else { return nil }
        
        guard let toIndex: Int = toVC == tabBarController.moreNavigationController ? nil : vcs.index(of: toVC) else { return nil }
        guard let fromIndex: Int = fromVC == tabBarController.moreNavigationController ? nil : vcs.index(of: fromVC) else { return nil }
        
        if toIndex > fromIndex {
            return swipeLeftAnimator
        } else {
            return swipeRightAnimator
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController.interacting ? interactionController : nil
    }
}
