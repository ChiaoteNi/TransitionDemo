//
//  TransitionHelper.swift
//  
//
//  Created by Chiao-Te Ni on 2018/5/18.
//  Copyright © 2018年 Webber. All rights reserved.
//

import Foundation
import UIKit

class TransitionHelper {
    
    enum ShowMode {
        case push
        case present
    }
    
    static func showSecVC(from vc: UIViewController, mode: ShowMode = .push, animated: Bool = true) {
//        guard let secondVC = SBHelper.instantiate(vc: .secondVC, from: .main) as? ViewController else { return }
//        secondVC.transitioningDelegate =
//        switch mode {
//        case .push:
//            show(vc: secondVC, fromVC: vc, animated: animated)
//        case .present:
//            vc.present(secondVC, animated: animated, completion: nil)
//        }
    }
    
    // MARK: - private
    private static func show(vc: UIViewController, fromVC: UIViewController, animated: Bool = true) {
        if let naviController = fromVC.navigationController {
            naviController.isNavigationBarHidden = false
            naviController.pushViewController(vc, animated: animated)
        } else {
            fromVC.present(vc, animated: animated, completion: nil)
        }
    }
}


// Special Transition
extension TransitionHelper {
    
    /// 顯示公告Popup
    ///
    /// - Parameters:
    ///   - vc: 從哪個VC跳出popup
    ///   - completion: completionHandler
    static func showBulletinVC(from vc: UIViewController) {
//            guard let pvc = SBHelper.instantiate(vc: .bulletin, from: .popup) as? BaseVC else { return }
//            
//            let screenHeight = UIScreen.main.bounds.height
//            let screenWidth = UIScreen.main.bounds.width
//            
//            let isLongScreen = UIScreen.main.bounds.height / 667 * 375 > UIScreen.main.bounds.width
//            let width: CGFloat
//            let height: CGFloat
//            
//            if isLongScreen {
//                width = screenWidth * 280 / 375
//                height = width / 280 * 420
//            } else {
//                height = screenHeight * 420 / 667
//                width = height / 420 * 280
//            }
//            
//            let size = CGSize(width: width, height: height)
//            let orgin = CGPoint(x: (screenWidth - width) / 2, y: (screenHeight - height) / 2)
//            let presentModel = PopupTransitionManager(presentOrigin: orgin, presentSize: size)
//            presentModel.duration = 0.25
//            presentModel.cornerRadius = 10
//            presentModel.present(from: vc, to: pvc, animated: true, completion: nil)
    }
}
