//
//  TabBarInteractionController.swift
//  TransitionDemo
//
//  Created by Chiao on 2019/1/22.
//  Copyright © 2019 paradise-soft. All rights reserved.
//

import Foundation

class TabbarInteractionController: UIPercentDrivenInteractiveTransition {
    
    var interacting: Bool = false
    private var isChangedIndexAlready: Bool = false
    private var initPt = CGPoint(x: 0, y: 0)
    private var initTranslation = CGPoint(x: 0, y: 0)
    private weak var transitionContext: UIViewControllerContextTransitioning?
    
    private var couldComplete: Bool = false
    private weak var presentingViewController: UITabBarController? = nil
    
    func wire(viewController: UITabBarController) {
        presentingViewController = viewController
        prepareGestureRecognizeInView(view: viewController.view)
    }
    
    func prepareGestureRecognizeInView(view:UIView) {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(gestureRecoginizer:)))
        view.addGestureRecognizer(gesture)
    }
    
    override func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        guard transitionContext.transitionWasCancelled == false else { return }
        super.startInteractiveTransition(transitionContext)
    }
    
    @objc func handleGesture(gestureRecoginizer: UIPanGestureRecognizer) {
        let location = gestureRecoginizer.translation(in: gestureRecoginizer.view!.superview!)
        switch gestureRecoginizer.state {
        case .began:
            interacting = true
            initPt = location
            initTranslation = location
        case .changed:
            if isChangedIndexAlready == false {
                if location.x - initPt.x > 0 {
                    presentingViewController?.selectedIndex -= 1
                } else if location.x - initPt.x < 0 {
                    presentingViewController?.selectedIndex += 1
                }
                isChangedIndexAlready = true
            }
            
            if percentForGesture(gesture: gestureRecoginizer) < 0.0 {
                cancel()
                gestureRecoginizer.removeTarget(self, action: #selector(handleGesture(gestureRecoginizer:)))
            } else {
                update(percentForGesture(gesture: gestureRecoginizer))
            }
        case .ended, .cancelled:
            interacting = false
            isChangedIndexAlready = false
            if percentForGesture(gesture: gestureRecoginizer) >= 0.1 {
                finish()
            } else {
                cancel()
            }
        default:
            break
        }
    }
    
    func percentForGesture(gesture: UIPanGestureRecognizer) -> CGFloat {
        let transitionContainerView : UIView? = transitionContext?.containerView
        var containerWidth: CGFloat {
            guard let containerView = transitionContainerView else { return 1 }
            return containerView.bounds.width
        }
        let translationInContainerView = gesture.translation(in: transitionContext?.containerView)
        
        if (translationInContainerView.x > 0.0 && initTranslation.x < 0.0)
            || (translationInContainerView.x < 0.0 && initTranslation.x > 0.0) {
            return -1.0
        } else {
            return abs(translationInContainerView.x) / containerWidth
        }
    }
}

