//
//  SwipeVerticalInteractionController.swift
//  TransitionDemo
//
//  Created by Chiao on 2019/1/14.
//  Copyright © 2019 paradise-soft. All rights reserved.
//

import UIKit

class NaviInteractionController: UIPercentDrivenInteractiveTransition {

    var interacting: Bool = false
    
    private var couldComplete: Bool = false
    private weak var presentingViewController: UIViewController? = nil
    
    func wire(viewController:UIViewController) {
        presentingViewController = viewController
        prepareGestureRecognizeInView(view: viewController.view)
    }
    
    func prepareGestureRecognizeInView(view:UIView) {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(gestureRecoginizer:)))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func handleGesture(gestureRecoginizer: UIPanGestureRecognizer) {
        let trainsiton = gestureRecoginizer.translation(in: gestureRecoginizer.view!.superview!)
        switch gestureRecoginizer.state {
        case .began:
            interacting = true
            presentingViewController?.navigationController?.popViewController(animated: true)
        case .changed:
            var fraction = trainsiton.y/UIScreen.main.bounds.height
            print(fraction)
            fraction = max(fraction, 0.0)
            fraction = min(fraction, 1)
            couldComplete = fraction > 0.5
            update(fraction)
        case .cancelled, .ended:
            interacting = false
            if couldComplete == false || gestureRecoginizer.state == .cancelled {
                cancel()
            } else {
                finish()
            }
        default:
            break
        }
    }
}
