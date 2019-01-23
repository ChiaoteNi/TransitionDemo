//
//  SecTabVC.swift
//  TransitionDemo
//
//  Created by Chiao on 2019/1/13.
//  Copyright © 2019 paradise-soft. All rights reserved.
//

import UIKit

class SecondVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        let closeBtn = UIButton(type: .infoDark)
        let length: CGFloat = 30
        closeBtn.frame = CGRect(x: UIScreen.main.bounds.width - 15 - length,
                                y: 15,
                                width: length,
                                height: length)
        closeBtn.addTarget(self, action: #selector(close), for: .allEvents)
        view.addSubview(closeBtn)
    }

    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
}
